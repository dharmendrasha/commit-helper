#!/usr/bin/env bash
#
set -fb

readonly THISDIR=$(cd "$(dirname "$0")" ; pwd)
readonly MY_NAME=$(basename "$0")
readonly FILE_TO_FETCH_URL="https://raw.githubusercontent.com/dharmendrasha/commit-helper/1-auto-update/commit.sh"
readonly EXISTING_SHELL_SCRIPT="${THISDIR}/commit.sh"
readonly EXECUTABLE_SHELL_SCRIPT="${THISDIR}/.commit.sh"

function get_remote_file() {
  readonly REQUEST_URL=$1
  readonly OUTPUT_FILENAME=$2
  readonly TEMP_FILE="${THISDIR}/tmp.file"
  if [ -n "$(which wget)" ]; then
    $(wget -O "${TEMP_FILE}"  "$REQUEST_URL" 2>&1)
    if [[ $? -eq 0 ]]; then
      mv "${TEMP_FILE}" "${OUTPUT_FILENAME}"
      chmod 777 "${OUTPUT_FILENAME}"
    else
      return 1
    fi
  fi
}

function clean_up() {
  # clean up code (if required) that has to execute every time here
  return 1
}

function self_clean_up() {
  rm -f "${EXECUTABLE_SHELL_SCRIPT}"
}

function update_self_and_invoke() {
  get_remote_file "${FILE_TO_FETCH_URL}" "${EXECUTABLE_SHELL_SCRIPT}"
  if [ $? -ne 0 ]; then
    cp "${EXISTING_SHELL_SCRIPT}" "${EXECUTABLE_SHELL_SCRIPT}"
  fi
  exec "${EXECUTABLE_SHELL_SCRIPT}" "$@"
}
function main() {
  cp "${EXECUTABLE_SHELL_SCRIPT}" "${EXISTING_SHELL_SCRIPT}"
  # your code here
} 

if [[ $MY_NAME = \.* ]]; then
  # invoke real main program
  trap "clean_up; self_clean_up" EXIT
  main "$@"
else
  # update myself and invoke updated version
  trap clean_up EXIT
  update_self_and_invoke "$@"
fi