**Userモデル**

| データ型 | カラム名 |
|---:|:---|
| string | :name |
| string | :email |
| string | :password_digest |
| index | :email |

**Taskモデル**

| データ型 | カラム名 |
|---:|:---|
| string | :name |
| text | :description |
| string | :status |
| date | :deadline |
| string | :priority |
| index | :user_id |

**Labelモデル**

| データ型 | カラム名 |
|---:|:---|
| integer | :user_id |
| integer | :task_id |


herokuデプロイ

```
$ heroku login
```

herokuにアプリ作成

```
$ heroku create
```

precompile

```
$ rails assets:precompile
```

herokuのbuildpackにrubyパッケージセット

```
$ heroku buildpacks:set heroku/ruby
```

herokuのbuildpackにnodejsパッケージ追加

```
$ heroku buildpacks:add --index 1 heroku/nodejs
```

ひとまずmasterにpush

```
$ git add .
$ git commit -m 'heroku'
$ git push origin master
```

herokuへデプロイ

```
$ git push heroku master
```

herokuでdb:migrate

```
$ heroku run rails db:migrate
```

```
$ heroku open
```
