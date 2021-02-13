#!/bin/bash
set -e


# コマンドの返り値が非ゼロのときハンドラを実行するように指定する
trap error ERR

sh docker-setup-1st.sh

exit 0;

function error() {
  # 何か起きたことを標準エラー出力に書く
  echo "E: Sub-process /usr/bin/dpkg returned an error code (1) occured!!!" >&2
  echo "but Docker install OK Raspberry Pi reboot"

  sudo reboot

  # スクリプトを終了する
  exit 1
}


# 例として非ゼロを返すコマンドを実行する
false
