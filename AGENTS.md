# Repository Guidelines

本リポジトリは json-server を用いて `db.json` を公開するための最小構成です。`db.yaml` をソースとし、GitHub Actions で `db.json` を生成します。

## プロジェクト構成
- ルート直下: `db.yaml`(ソース), `db.json`(生成物), `README.md`, `Dockerfile`, `compose.yaml`
- Node: `package.json` に実行スクリプトを定義
- CI: `.github/workflows/generate_json.yaml` が `db.yaml` から `db.json` を生成・コミット

## ビルド・実行・開発コマンド
- ローカル起動: `npm run json-server`
  - ポート `8080` で `db.json` を配信します。
- Docker ビルド/実行:
  - `docker build -t json-server .`
  - `docker run -t -v \`pwd\`:/data -p 8080:8080 json-server`
- Compose: `docker compose up --build`
- JSON 生成(ローカル): `yq -c '.' db.yaml > db.json`

## コーディング/データスタイル
- フォーマット: JSON/YAML は 2 スペースインデント、UTF-8
- 命名: キーは `snake_case`、エンドポイントは複数形(`teams`, `games`, `players`)
- ID: 数値連番。参照整合性が崩れないように追加・変更
- 並び: 可能なら ID 昇順で安定化

## テスト方針
- 公式テストは未提供。変更時は手動検証を行ってください。
- 例: `curl http://localhost:8080/teams` で配列取得、`/db` で全体取得
- `db.yaml -> db.json` 変換後に JSON が構文的に正しいか (`jq . db.json`) を確認

## コミット/PR ガイド
- 変更対象は原則 `db.yaml`。`db.json` は CI/ローカル生成
- コミット: 目的が分かる短い要約。例: `data: add team sp_bears`
- PR 必須事項:
  - 概要と変更点(エンドポイント/スキーマ/件数)
  - 動作確認手順とリクエスト例(`curl` や URL)
  - 影響範囲(破壊的変更の有無)

## セキュリティ/運用の注意
- 公開データのみを格納し、機密情報は入れない
- `db.json` はサイズ/件数の上限あり(ホスティング制約を参照)
- ポートは既定で `8080` を使用。衝突時は `-p` で変更
