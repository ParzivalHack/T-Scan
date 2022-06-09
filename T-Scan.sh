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
echo -ne "#Type host name to scan"
read host
echo -ne "#Type port/port-range to scan"
read port
bash scan.sh $host $port
elif [ $optnz = "3" ];
then
bash vuln.sh
fi
}
banner
scan() {
  if [[ -z $1 || -z $2 ]]; then
    echo "Usage: $0 <host> <port, ports, or port-range>"
    return
  fi

  local host=$1
  local ports=()
  case $2 in
    *-*)
      IFS=- read start end <<< "$2"
      for ((port=start; port <= end; port++)); do
        ports+=($port)
      done
      ;;
    *,*)
      IFS=, read -ra ports <<< "$2"
      ;;
    *)
      ports+=($2)
      ;;
  esac

  for port in "${ports[@]}"; do
    alarm 1 "echo >/dev/tcp/$host/$port" &&
      echo "$green Port $port is open" ||
      echo "$red Port $port is closed"
  done
}
