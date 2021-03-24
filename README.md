## プロジェクト名
SoccerNote(SoccerNoteApp)

## 概要
サッカーの試合結果を記録し一覧で表示。日付・相手チーム・スコアの記録。また、前半・後半・まとめに分けて試合のコメントを残すことが可能。とてもシンプルなアプリのため、簡単に記録でき、過去の試合を見返すことができます。

## 開発フロー
- チーム開発
- アジャイル開発

## タスク管理
タスク管理ツールTrelloを使用

## 開発情報
|  項目  |  バージョン  |
| :---: | :---: |
|  Xcode  |12.4|
|  Swift  | 5.3.2|
|  iOS  |  13.0以上  |
|  デバイス  |  iPhone<br>iPad |
|  CocoaPods  |  1.9.3  |


## 使用ライブラリ
**Firebase Authentication**  
簡単に認証機能を追加することができるライブラリ。本アプリでは匿名ログインを使用

**Firebase Realtime Database**  
Firebaseから提供されているNoSQLデータベース

**IQKeyIboardManagerSwift**  
キーボードの表示に合わせて、入力場所を移動することができるライブラリ

**SwiftLint**
Swiftの静的解析ツールの一つで、コンパイラよりも詳細にソースコードの解析をすることができるライブラリ

## バージョン管理
GitHubを使用
- Git-flow に基づき運用

## デザインパターン
MVCモデルを使用

## ルール
### ブランチルール

|  ブランチ  | 役割  |
| :---: | --- |
|  master  |完成版のブランチ<br>基本的にここにコミットはしない<br>リリース単位のマージコミットが並ぶ|
|  release |リリースビルド作成用<br>もしバグが発生した場合は hotfixブランチを切って修正する|
|  hotfix/xxx  |  リリースビルド作成用後の修正ブランチ |
|  develop  |  開発用のメインブランチ<br>デフォルトブランチ |
|  feature/xxx  |  機能開発用のブランチ |
|  fix/xxx  |  バグ修正用ブランチ  |
|  refactor/xxx  |  リファクタリング用ブランチ  |

### extensionルール  
- プロトコルを準拠するタイミング

### コメントルール
TODO: リリースまでに完了させたい修正箇所  
FIXME: 長期化の可能性がある修正箇所  


## 環境構築
1. Bundlerをインストール
    -  `sudo gem install bundler` 
2. リポジトリをclone
    -  `git clone https://github.com/hidec-7/SoccerNoteDev.git` 
3. CocoaPodsをインストール
    -  `bundle install --path vendor/bundle`
4. CocoaPodsを実行
    -  `bundle exec pod install`
5. SoccerNoteApp.xcworkspace を開く  
6. Schemeを`SoccerNoteApp`に変更

## インストール
[MySoccerNote(AppStore)](https://apps.apple.com/jp/app/mysoccernote/id1555488477)

## 作者
hideto.chaya7@gmail.com
