blue="\e[34m"
green="\e[32m"
red="\e[91m"
banner(){
echo -e "$blue
'########:::::::::::'######:::'######:::::'###::::'##::: ##:
... ##..:::::::::::'##... ##:'##... ##:::'## ##::: ###:: ##:
::: ##::::::::::::: ##:::..:: ##:::..:::'##:. ##:: ####: ##:
::: ##::::'#######:. ######:: ##:::::::'##:::. ##: ## ## ##:
::: ##::::........::..... ##: ##::::::: #########: ##. ####:
::: ##:::::::::::::'##::: ##: ##::: ##: ##.... ##: ##:. ###:
::: ##:::::::::::::. ######::. ######:: ##:::: ##: ##::. ##:
:::..:::::::::::::::......::::......:::..:::::..::..::::..::
"
}
menu(){
echo -e "$blue             ＞＞＞＞>>>＞$blue[Menu]$blue ＜<<<＜＜＜＜$blue"
echo " "
echo " "
echo -e "$blue                        ➡$blue [\e[34m1\e[34m]$blue Ping "
echo -e "$blue                        ➡$blue [\e[34m2\e[34m]$blue Scan "
echo -e "$blue                        ➡$blue [\e[34m3\e[34m]$blue Check vulnerabilities "
echo -ne "\e[34m#Select Option\e[34m: "
read optnz
if [ $optnz = "1" ];
then
banner
sleep 1
echo -ne "\e[34m#Type host name to ping (website.com)\e[34m: "
read host
ping $host
elif [ $optnz = "2" ];
then
banner
echo -e "Scan could take up to 5 min so be patient (press ESC to check the percentage of ports scanned)"
echo -ne "#Type host name to scan (website.com): "
read host
nmap -sT -p- $host
elif [ $optnz = "3" ];
then
bash vuln.sh
fi
}
banner
menu
