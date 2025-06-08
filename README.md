# くまもとVOICE Reports

くまもとVOICEとして参加したイベントの学習会などのレポートをまとめるリポジトリです。

## 📅 イベント管理

- **イベント告知・募集**: [connpass](https://kmv.connpass.com/) で管理
- **参加レポート**: 本リポジトリで管理

## 📚 リサーチ・調査

深い調査や分析が必要な内容については、[NotebookLM](https://notebooklm.google.com/notebook/4b348fec-bc9e-4cb4-baba-0f550d42c770) を活用しています。

## 📂 ディレクトリ構成ガイド

```
reports/
├── 2025/
│   ├── 05/
│   │   └── 20250529_kumamoto-univ-incubation/
│   │       ├── README.md
│   │       ├── photos/
│   │       └── materials/
│   └── 06/
├── templates/
│   ├── event-report-template.md
│   └── meetup-report-template.md
├── assets/
│   └── images/
└── README.md
```

## 📝 最新のレポート

### 2025年5月

- **[2025/5/29 熊本大学インキュベーションラボラトリ](./2025/05/20250529_kumamoto-univ-incubation/README.md)**
  - 日時: 2025年5月29日（木）18:00〜
  - 場所: 熊本大学黒髪南キャンパス インキュベーションラボラトリ ベンチャー支援室

## 🎯 レポート作成ガイドライン

### レポートに含める内容

1. **基本情報**
   - イベント名
   - 日時・場所
   - 参加者情報

2. **イベント概要**
   - 目的・テーマ
   - アジェンダ

3. **学習内容・気づき**
   - 重要なポイント
   - 新しい発見
   - 疑問点

4. **今後のアクション**
   - フォローアップ予定
   - 次回への改善点

### ファイル命名規則

- ディレクトリ: `YYYYMMDD_event-name`
- ファイル: `README.md` をメインレポートとする
- 画像: `photos/` ディレクトリに格納
- 資料: `materials/` ディレクトリに格納

## 🔗 関連リンク

- [くまもとVOICE connpass](https://kmv.connpass.com/)
- [NotebookLM - デジタル民主主義リサーチ](https://notebooklm.google.com/notebook/4b348fec-bc9e-4cb4-baba-0f550d42c770)

# レポート作成手順

## 1. 新しいレポート用ディレクトリの作成

```bash
# 日付とイベント名でディレクトリを作成
# 例：2025年6月15日のAI勉強会の場合
export EVENT_DATE="20250615"
export EVENT_NAME="ai-study-meetup"
export YEAR="2025"
export MONTH="06"

# ディレクトリ構造を作成
mkdir -p ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/{photos,materials,notes}
```

## 2. テンプレートからレポートファイルを作成

```bash
# テンプレートをコピーしてレポートを作成
cp templates/event-report-template.md ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/README.md

# エディタでレポートを開く（お好みのエディタを使用）
code ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/README.md
# または
vim ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/README.md
```

## 3. 写真・資料の追加

```bash
# 写真を追加
cp /path/to/photos/* ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/photos/

# 配布資料を追加
cp /path/to/materials/* ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/materials/

# ファイル一覧を確認
ls -la ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/
```

## 4. Git操作でレポートを公開

```bash
# 変更をステージング
git add ${YEAR}/${MONTH}/${EVENT_DATE}_${EVENT_NAME}/

# コミット
git commit -m "Add report: ${EVENT_DATE} ${EVENT_NAME}"

# プッシュ
git push origin main
```

## 5. インデックスREADMEの更新

```bash
# メインREADMEを編集して新しいレポートを追加
vim README.md

# 変更をコミット
git add README.md
git commit -m "Update index: add ${EVENT_DATE} ${EVENT_NAME} report"
git push origin main
```

## 一括実行スクリプト例

```bash
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
```

## スクリプトの使用方法

```bash
# スクリプトを実行可能にする
chmod +x create-report.sh

# レポートディレクトリを作成
./create-report.sh 20250615 ai-study-meetup

# レポートを編集
code 2025/06/20250615_ai-study-meetup/README.md
```

## よく使うGitエイリアス（オプション）

```bash
# .gitconfigに追加
git config --global alias.report-add 'add .'
git config --global alias.report-commit 'commit -m'
git config --global alias.report-push 'push origin main'

# 使用例
git report-add
git report-commit "Add report: 20250615 AI勉強会"
git report-push
```

## ファイル名の命名規則

```bash
# イベント名の命名例
ai-study-meetup          # AI勉強会
startup-pitch-event      # スタートアップピッチイベント
tech-conference-2025     # テックカンファレンス2025
networking-meetup        # ネットワーキングイベント
workshop-react-basics    # React基礎ワークショップ
```

## 📞 お問い合わせ

イベントやレポートに関するご質問・ご提案がございましたら、Issueでお知らせください。

---

**くまもとVOICE** - 熊本から発信する学習コミュニティ
