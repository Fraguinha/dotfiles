chpwd() {
  echo
  ls
  echo
}

cdf() {
  target=$(osascript -e \
    "tell application \"Finder\" to \
     if (count of Finder windows) > 0 then \
     get POSIX path of (target of front Finder window as text)")
  [[ -n "${target}" ]] && {
    cd "${target}"
    return 0
  } || {
    echo "${0}: No finder window found"
    return 1
  }
}

github() {
    help () {
    echo "usage: github [ --directory dir ] [ -i gitignore ] [ -l license ] [ -d description ] [ -h homepage ] [ --public ]"
    echo
    echo "  --gitignores    - Show available gitignores"
    echo "  --licenses      - Show available licenses"
    echo
    echo "  --help          - Show this help menu"
    echo
    echo "  --directory dir - Specify directory (default: cwd)"
    echo
    echo "  -i gitignore    - Specify gitignore (default: none)"
    echo "  -l license      - Specify license (default: none)"
    echo
    echo "  -d description  - Specify repository discription (default: none)"
    echo "  -h homepage     - Specify repository homepage (default: none)"
    echo
    echo "  --public        - Make repository public"
  }

  gitignores () {
    curl -sfL "https://api.github.com/gitignore/templates" |\
    jq --raw-output ".[]"
  }

  licenses () {
    curl -sfL "https://api.github.com/licenses" |\
    jq --raw-output ".[].key"
  }

  while getopts ":i:l:d:h:-:" option; do
    case "${option}" in
      "i")
        gitignore="${OPTARG}"
        ;;
      "l")
        license="${OPTARG}"
        ;;
      "d" | "h" )
        arguments+=("-${option}" "${OPTARG}")
        ;;
      "-")
        case "${OPTARG}" in
          "help")
            help
            return 0
          ;;
          "gitignores")
            gitignores
            return 0
          ;;
          "licenses")
            licenses
            return 0
          ;;
          "public")
            arguments+=("--public")
          ;;
          "directory")
            directory="${OPTARG}"
          ;;
          *)
          echo "github: Invalid option or missing argument: --${OPTARG}"
          help
          return 1
          ;;
        esac
        ;;
      *)
        echo "github: Invalid option or missing argument: -${OPTARG}"
        help
        return 1
        ;;
    esac
  done

  if [[ -z ${directory} ]]; then
    directory=$(basename "$(pwd)")
  else
    mkdir "${directory}"
    builtin cd "${directory}" || return 1
  fi

  [[ $(git rev-parse --git-dir 2>/dev/null) ]] && {
    echo "github: Already in a git repository"
    return 1
  }

  [[ -n ${gitignore} ]] && {
    curl -sfL "https://api.github.com/gitignore/templates/${gitignore}" |\
    jq --raw-output ".source" >> .gitignore
    [[ ! -s .gitignore ]] && {
      echo "github: Invalid .gitignore: ${gitignore}"
      help
      rm .gitignore
      return 1
    }
  }

  [[ -n ${license} ]]  && {
    curl -sfL "https://api.github.com/licenses/${license}" |\
    jq --raw-output ".body"  > LICENSE
    [[ ! -s LICENSE ]] && {
      echo "github: Invalid license: ${license}"
      help
      rm LICENSE
      return 1
    }
    sed -i "" \
    "s/\[year\]/$(date +"%Y")/g;s/\[fullname\]/$(git config user.name)/g" \
    LICENSE
  }

  if [[ ! -f "README.md" ]]; then
    echo "# ${directory}" > README.md
    echo >> README.md
    echo "This project is licensed under the ${license} License - see the [LICENSE](LICENSE) file for details" >> README.md
  fi

  git init

  git add .
  git commit -m 'Initial commit'

  gh repo create "${directory}" "${arguments}"

  git push -u origin master
}
