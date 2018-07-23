
source bin/log.sh

function xcode_version {
  xcrun xcodebuild -version | \
    grep -E "(\d+\.\d+(\.\d+)?)" | cut -f2- -d" " | \
    tr -d "\n"
}

function xcode_gte_9 {
  local version=$(xcode_version)
  local major=$(echo $version | cut -d. -f1)
  if [ "${major}" \> "9" -o "${major}" = "9" ]; then
    echo -n "true"
  else
    echo -n "false"
  fi
}

function simulator_app_path {
  if [ "${DEVELOPER_DIR}" = "" ]; then
    local dev_dir=$(xcode-select --print-path)
  else
    local dev_dir="${DEVELOPER_DIR}"
  fi
  echo -n "${dev_dir}/Applications/Simulator.app"
}
