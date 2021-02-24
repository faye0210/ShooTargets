# README
# ShooTargets

## 概要
モチベーションを上げやすくしながら目標（またはタスク）を管理できるサービス。
設定した目標を達成するとポイント式で加算され、一定のポイントを溜めるとレベルアップする。

## コンセプト
モチベーションを上げ、目標達成を継続させる目標管理アプリ。

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
ユーザー機能
  * マイページ機能
  * ログイン機能
  * ログアウト機能
  * SNSログイン機能

目標（タスク）ページ
  * 作成、保存機能
  * 一覧画面
  * 削除機能
  * 詳細機能
  * 編集機能
  * 検索機能
  * ソート機能
  * 達成登録機能

目標リストページ
  * 一年の目標リスト（固定）
  * 作成機能
  * 削除機能

通知機能
  * メール通知機能
  * 通知機能
  * シェア機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1UN0kiaEfbPuDL-_VPGWv551cNH_OeDeQWgo0Ei_OA6M/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1Mp_Nw4z11NiZVi6uNrZNZwIIfH_4mYMy6mu11UnGInY/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/16XSfHNbwH9up29PGQdndsTKYQy8bWCJ2Tu1J_TOvyNk/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1CazHy2yvWAfq06G4NwPiJIOY3L-Q0B0jtBclzSTAzkM/edit?usp=sharing

## 使用予定Gem
* devise
* carrierWave
* mini_magik
* OAuth
* Bootstrap
* Ransack

## 使用Gem
* pry-rails
* better_errors
* binding_of_caller
* devise
* carrierWave
* mini_magik
* OAuth
* Bootstrap
* Ransack
* devise-i18n
* devise-i18n-views
* letter_opener_web
