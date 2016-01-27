# はじめに
フロントエンドかけこみ寺の自己紹介用リポジトリです。

## フロントエンドかけこみ寺とは
フロントエンドでもくもくしたい人たち(エンジニア・デザイナー・ディレクター職種限らず)が
隔週水曜に集まってもくもくする会です。
リモートでの参加も可能です。

# メンバー.md 追加手順

_template.md をコピーして アカウント名.md というファイルを作り、
プルリクエストを送ってください。

## Github からリポジトリを clone して PullRequest を出す方法
### 黒い画面版

#### リポジトリをローカルに持ってきます(git clone)

```
git clone git@github.com:front-temple/members.git
```
#### ブランチを作成します

```
git checkout -b add_your_id
```

#### _template.md をコピーして自分の自己紹介を作成して編集します

```
cp _template.md [your_id].md
```

編集はお好みのエディタでご自由にどうぞ〜
他の方の自己紹介を参照にされるのも良し( ˘ω˘)

.md とは MarkDown記法で書かれたドキュメントです。
[Markdownの書き方](http://www.markdown.jp/what-is-markdown/#markdown-1)

#### git で 作成した .md をgit に追加します

```
git add [your_id].md
```

#### git に commit します

```
git commit -m "commit message"
```

コミットメッセージは何語でも構いません :smiley:

#### Github に push します

```
git push origin [branch_name]
```

#### Github で PullRequest を出します
ご参照: [Github上でPullRequestする](http://qiita.com/samurairunner/items/7442521bce2d6ac9330b#github%E4%B8%8A%E3%81%A7pullrequest%E3%81%99%E3%82%8B)

# 各URL
- Slack [https://frontend-temple-slack-invite.herokuapp.com/](https://frontend-temple-slack-invite.herokuapp.com/)
- connpass [http://frontend-temple.connpass.com/](http://frontend-temple.connpass.com/)
