# README
■アプリ前提  
現場Railsに記載範囲の技術を使用してアウトプット用のアプリを作成する。  

■アプリ名  
子供のお小遣い管理アプリ(pocket money app)  

■機能概要  
子供が支出をアプリに登録して、親が支出の使い道の確認をする。

■利用手順  
1.親権者アカウントをトップページから作成をする。  
2.親権者アカウントでログインをして、子供アカウントを作成する。(複数作成可能)  
3.子供アカウントでログインをして、支出を登録する。(子供アカウントごとに作成可能)  
4.親権者アカウントにログインをすると作成した子供アカウントの支出が見れる。(カテゴリー、支出した子供の検索可能)  

■初期データ用意済みのアカウント  
【親権者アカウント】  
メールアドレス:admin@admin  
パスワード:admin  

【子供アカウント①】  
メールアドレス:kotaro@kotaro  
パスワード:kotaro  

【子供アカウント②】  
メールアドレス:kojiro@kojiro  
パスワード:kojiro  

【子供アカウント③】  
メールアドレス:kosaburo@kosaburo  
パスワード:kosaburo

■備考  
子供アカウント同士では支出内容が表示されないようにする。  

■ER図  
[![Image from Gyazo](https://i.gyazo.com/2a317f0ca56c364fef7b7e1c7d339b46.png)](https://gyazo.com/2a317f0ca56c364fef7b7e1c7d339b46)  

■エンドポイント表  
| No. | やりたいこと               | HTTP動詞    | URIパターン            | Controller#Action     |
| --- | -------------------- | --------- | ------------------ | --------------------- |
| 1   | 支出一覧を表示する(表示)        | GET       | /expences          | expences#index        |
| 2   | 支出詳細を表示する(表示)        | GET       | /expences/:id      | expences#show         |
| 3   | 支出の新規登録画面を表示する(表示)   | GET       | /expences/new      | expences#new          |
| 4   | 支出を新規登録する(動作)        | POST      | /expences          | expences#create       |
| 5   | 支出の編集画面を表示する(表示)     | GET       | /expences/:id/edit | expences#edit         |
| 6   | 支出を更新する(動作)          | PUT/PATCH | /expences/:id      | expences#update       |
| 7   | 支出を削除する(動作)          | DELETE    | /expences/:id      | expences#destroy      |
| 8   | ユーザー一覧を表示する(表示)      | GET       | /users             | users#index           |
| 9   | ユーザー詳細を表示する(表示)      | GET       | /users/:id         | users#show            |
| 10  | ユーザーの新規登録画面を表示する(表示) | GET       | /users/new         | users#new             |
| 11  | ユーザーを新規登録する(動作)      | POST      | /users             | users#create          |
| 12  | ユーザーの編集画面を表示する(表示)   | GET       | /users/:id/edit    | users#edit            |
| 13  | ユーザーを更新する(動作)        | PUT/PATCH | /users/:id         | users#update          |
| 14  | ユーザーを削除する(動作)        | DELETE    | /users/:id         | users#destroy         |
| 15  | ログインのフォームを表示する(表示)   | GET       | /user_sessions/new | user_sessions#new     |
| 16  | ログインを行う(動作)          | POST      | /user_sessions     | user_sessions#create  |
| 17  | ログアウトを行う(動作)         | DELETE    | /logout            | user_sessions#destroy |