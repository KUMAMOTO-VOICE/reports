#!/bin/bash
# create-report.sh

# 引数チェック
if [ $# -ne 2 ]; then
    echo "使用方法: $0 <YYYYMMDD> <event-name>"
    echo "例: $0 20250615 ai-study-meetup"
    exit 1
fi

EVENT_DATE=$1
EVENT_NAME=$2
YEAR=${EVENT_DATE:0:4}
MONTH=${EVENT_DATE:4:2}

# ディレクトリ作成
mkdir -p ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/{photos,materials,notes}

# テンプレートコピー
cp templates/event-report-template.md ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/README.md

echo "✅ レポートディレクトリを作成しました: ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/"
echo "📝 レポートを編集してください: ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/README.md"
