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
echo -ne "Host (www.example.com): "
read host2
echo -ne "Port: "
read port
nmap -sV -p $port $host2
elif [ $optnz = "3" ];
then
banner
echo -ne "Host (www.example.com): "
read host3
nmap -sV --script http-shellshock $host3
fi
}
banner
menu
