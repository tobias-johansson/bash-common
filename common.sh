set -e

black=`  tput setaf 0`
red=`    tput setaf 1`
green=`  tput setaf 2`
yellow=` tput setaf 3`
blue=`   tput setaf 4`
magenta=`tput setaf 5`
cyan=`   tput setaf 6`
white=`  tput setaf 7`
bold=`   tput bold`
reset=`  tput sgr0`

log()  { >&2 echo "$@"; }
err()  { log "$red$@$reset"; }
die()  { err "$@"; exit 1; }
show() { log "$1='${!1}'"; }

vars() {
  for name in $@; do
    if [[ -z "${!name}" ]]; then
      err "Missing env. variable: $name"
      die "Required env. variables are: $@"
    fi
  done
}

args() {
  local names=()
  while [[ "$1" != "--" ]]; do
    names+=($1); shift;
  done
  shift
  local orig="$@"
  for name in ${names[*]}; do
    real_name=${name%\?}
    if [[ -z "$1" ]]; then
      if [[  $real_name == $name ]]; then
        err "Wrong number of arguments"
        err "Expected arguments are: ${names[*]}"
        die "Got arguments: $orig"
      fi
    else
      eval $real_name=\$1;
      if [[ $# -gt 0 ]]; then
        shift;
      fi
    fi
  done
}

enum() {
  local n="$1"; shift;
  local var="$1"
  local value="${!var}"; shift;
  for name in "$@"; do
    if [[ "$value" == "$name" ]]; then
      echo "$n"
      exit 0
    else
      n=$(($n+1))
    fi
  done
  err "Invalid value: $var='$value'"
  die "Expected one of: $@"
}
