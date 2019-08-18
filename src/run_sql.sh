SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# SQLファイルを作成する
echo "create table T(C text);
insert into T values('AAA');" > create.sql
# `.read`してテーブルやレコードを確認する。
sqlite3 :memory: \
".read create.sql" \
".tables" \
"select * from T;"

# `.dump`でSQLファイルを作成する
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('AAA');" \
".dump" > dump.sql
# `.read`でSQLファイルを読み込んで実行する
sqlite3 :memory: \
".read dump.sql" \
".tables" \
"select * from T;"

# SQLite3専用SQL文プラグマ
echo "pragma function_list;" > func_list.sql
sqlite3 :memory: \
".read func_list.sql"

