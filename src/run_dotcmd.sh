SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# SQLファイルを作成する。
echo "create table T(C text);
insert into T values('AAA');
.tables
.headers on
.mode column
select * from T;
" > create_dot.sql

# `.read`してテーブルやレコードを確認する。
sqlite3 :memory: ".read create_dot.sql"

