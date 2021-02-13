#!/bin/bash
set -e -o pipefail

function error() {
  # 何か起きたことを標準エラー出力に書く
  echo "ERROR" >&2
  # スクリプトを終了する
  exit 1
}

# コマンドの返り値が非ゼロのときハンドラを実行するように指定する
trap error ERR

# 例として非ゼロを返すコマンドを実行する
false
