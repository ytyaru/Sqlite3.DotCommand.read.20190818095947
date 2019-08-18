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

# ファイルから
sqlite3 :memory: < create_dot.sql

# コマンド引数から
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('AAA');" \
".tables" \
".headers on" \
".mode column" \
"select * from T;"

# ファイルへ
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('AAA');" \
".tables" \
".headers on" \
".mode column" \
"select * from T;" > out.txt
cat out.txt

# 環境引数
TBL_NM="T"
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('AAA');" \
".tables" \
".headers on" \
".mode column" \
"select * from ${TBL_NM};" > out.txt
cat out.txt

