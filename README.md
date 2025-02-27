# プロジェクト名: 『Clock Safety』

![Clock Safety ロゴ](https://github.com/user-attachments/assets/bbc15af6-f210-4ce8-ad6b-08fa6ddd1fb5)

# 目次
- [サービス概要](#サービス概要)
- [サービスURL](#サービスURL)
- [サービス開発の背景](#サービス開発の背景)
- [サービス紹介](#サービス紹介)
- [使用技術](#使用技術)
- [画面遷移図](#画面遷移図)
- [ER図](#er図)

---

## ⌚️ サービス概要
Googleスマートウォッチから得られる健康管理データを使用して、離れて暮らす高齢家族が健康な状態で暮らしているのかを確認できるサービスです。  
スマートウォッチを付けて生活をしてもらい、webアプリ上で離れて暮らす高齢家族の日々の健康状態を確認することができます。  
<br>

##　 🌏 サービスURL
サービスへのリンク: [Clock Safety](https://www.clock-safety.com/)  

こちらは「Clock Safety」のバックエンドのリポジトリになります。  

フロントエンドのリポジトリは[こちら](https://github.com/yuki0877/Clock-Safety-Front)  

<br>

## 📖 サービス開発の背景
前職で福祉職に就いており、社会構造の変化により、「高齢単身・夫婦のみ世帯」が高齢世帯の2/3に達しているという問題を支援している中で見てきました。家族や地域とのつながりが急速に薄れ、孤立している現状があり、離れて暮らす高齢の親の健康を心配している場面をよく目にしてきました。  
離れて暮らしていても、日々の健康状態を知ることが出来れば、高齢家族の体調の異変にも気づくことができ、健康に暮らすことができるのではないかと考え、身近な時計を使ってサービスを作りたいと思いました。  
<br>

## 💻 サービス紹介
### ゲストログイン

![ゲストログイン](https://github.com/user-attachments/assets/111c9ca0-5b83-4e0d-8801-df3fbcd6499f)  

「ゲストログイン」ボタンを押すと、アカウント登録なしで自動的にログインし、サンプルデータを使って Clock Safety の機能を体験できます。  
正式なアカウントを登録すると、すべての機能が利用可能になります。  
本サービスは Googleスマートウォッチ を使用し、Fitbit に登録している方を対象としています。  
すべての機能を利用するには、Googleログイン が必要です。  

### 心拍数

![心拍数](https://github.com/user-attachments/assets/45a139cb-bad8-4db5-9782-8d6938ea91eb)  

このページでは、ユーザーの一日の心拍数データを視覚的に確認できます。以下の情報が表示されます。  

平均心拍数: 一日の平均的な心拍数を表示します。日常的な健康状態を把握するために役立ちます。  
最大心拍数: 一日を通して記録された最も高い心拍数を示します。運動や活動中の心拍数の変動を知ることができます。  
最低心拍数: 一日を通して記録された最も低い心拍数です。リラックスしている時や休息中の心拍数を確認できます。  
これらの指標を通じて、日々の健康状態を管理し、異常がないかをチェックすることができます。  

### 睡眠

![睡眠](https://github.com/user-attachments/assets/d0d8854a-1cb7-4918-921a-20dab1c2df54)  

このページでは、ユーザーの一日の睡眠データを視覚的に確認できます。以下の情報が表示されます。  

睡眠時間: 一日を通して記録された総睡眠時間を表示します。十分な睡眠がとれているかを確認するために役立ちます。  
睡眠スコア: 睡眠の質を評価したスコアを示します。深い睡眠や中途覚醒の状況などを反映し、睡眠の質を改善するための参考になります。  
これらの指標を通じて、日々の睡眠状態を管理し、健康的な睡眠習慣を維持することができます。  

### 異常値

![異常値](https://github.com/user-attachments/assets/cd26fbf7-f3c1-4eff-8cf3-db31adf27a05)  

このページでは、ユーザーの心拍数データの中で異常値が記録された日時とその異常値の詳細が表示されます。以下の情報を確認できます。  

異常値の日時: 心拍数が正常範囲を外れた日時が表示されます。特定の時間帯で異常が発生したことを把握できます。  
異常値の値: 異常値として記録された心拍数の数値が表示されます。心拍数が異常な範囲に達した際にその具体的な数値が確認できます。  
異常の種類: 心拍数が高すぎて異常だったのか、それとも低すぎて異常だったのかを識別できます。  
これにより、急激な変動や不整脈の兆候などを素早く確認できます。  
これらの情報をもとに、異常な心拍数が発生した理由を理解し、早期に対応することが可能です。  

### 心拍数異常値検出メール

![心拍数異常値検知メール](https://github.com/user-attachments/assets/30aa1351-a2bb-40af-9c46-9955d906a1cd)  

心拍数の異常値が検出されると、ユーザーに「異常値が検出されました」という通知メールが送信されます。  
メール通知により、異常値が発生した際に迅速に対応できるようになります。  

<br>

## 🔧 使用技術

| カテゴリ | 技術内容 |
|----------|---------------------------|
| サーバーサイド | Ruby on Rails 6.1.7.8（APIモード）・Ruby 3.0.2 |
| フロントエンド | Vue 3 |
| 認証 | Supabase API |
| 開発環境 | Docker |
| CI/CD | Github Actions |
| CSSフレームワーク | Vuetify |
| インフラ | versel・render.com |
| Web API | fitbit API・Supabase API |
| データベースサーバー | PostgreSQL |
| アプリケーションサーバー | render.com |
| バージョン管理ツール | GitHub|
<br>

## 画面遷移図
[Figmaリンクはこちら](https://www.figma.com/design/UMn6QEW28fiYXKHVa8SbMi/Untitled?node-id=0-1&t=PYdP1WfHSxMrE3SF-0)  
<br>

## ER図
[ER図リンクはこちら](https://drive.google.com/file/d/1F67qDpe38e0mCpme2DoIlTHbOx2tGzr0/view?usp=sharing)
