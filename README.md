# gitlab-ci-er-create

# プロジェクトにschemaspy.propertiesを作成してください

sumple　schemaspy.properties
```
# http://schemaspy.readthedocs.io/en/latest/started.html#configuration
# type of database. Run with -dbhelp for details
# postgres
schemaspy.t=pgsql
# mysql
#schemaspy.t=mysql
# optional path to alternative jdbc drivers.
# postgres
schemaspy.dp=/postgres-connector-java.jar
# mysql
#schemaspy.dp=/mysql-connector-java.jar
# database properties: host, port number, name user, password
schemaspy.host=postgres
schemaspy.port=5432
schemaspy.db=hoge_db
schemaspy.u=postgres
schemaspy.p=
# output dir to save generated files
schemaspy.o=/[your gitlab build directory]/output
# db scheme for which generate diagrams
schemaspy.s=public
```

# gitlab-ci.ymlに実行を追記

sample gitlab-ci.yml
```
image: toshiclick/gitlab-ci-er-create
services:
  - postgres
script:
  - # テーブル作成をしてください
  - cd /[your gitlab build directory]
  - export LANG="ja_JP.UTF-8" && export TZ="Asia/Tokyo"
  - java -jar /schemaspy.jar
artifacts:
  paths:
    - output/
only:
  - master
```

