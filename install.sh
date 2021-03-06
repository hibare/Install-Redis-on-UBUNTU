#!/bin/sh

#Redis automatic installation script

#Declaring color variables
CYAN='\033[0;36m'       #CYAN COLOUR
NC='\033[0m'            #NO COLOUR
GREEN='\033[0;32m'      #GREEN COLOUR
RED='\033[0;31m'        #RED COLOUR
YELLOW='\033[1;33m'	#YELLOW COLOUR


#Clear terminal screen
clear

#Banner
echo "======================================================"
echo "+                   Install redis                    +"
echo "======================================================"
echo "    [0;1;34;94m▄▄▄▄[0m   [0;34m▄▄▄▄▄▄[0m               [0;37m▄▄▄▄▄[0m   [0;1;30;90m▄▄▄[0m    [0;1;30;90m▄▄▄[0m"
echo "  [0;34m██▀▀▀▀█[0m  [0;34m██▀▀▀[0;37m▀██[0m   [0;37m▄████▄[0m   [0;37m█[0;1;30;90m▀▀▀▀██▄[0m  [0;1;30;90m██▄[0m  [0;1;30;90m▄█[0;1;34;94m█[0m" 
echo " [0;34m██▀[0m       [0;37m██[0m    [0;37m██[0m [0;37m▄██▀[0m  [0;1;30;90m▀██[0m        [0;1;30;90m██[0m   [0;1;34;94m██▄▄██[0m " 
echo " [0;37m██[0m        [0;37m█████[0;1;30;90m██[0m  [0;1;30;90m██[0m [0;1;30;90m▄█████[0m      [0;1;34;94m▄█▀[0m     [0;1;34;94m▀██▀[0m"   
echo " [0;37m██▄[0m       [0;1;30;90m██[0m  [0;1;30;90m▀██▄[0m [0;1;30;90m██[0m [0;1;30;90m█[0;1;34;94m█▄▄██[0m    [0;1;34;94m▄█▀[0m        [0;34m██[0m"    
echo "  [0;1;30;90m██▄▄▄▄█[0m  [0;1;30;90m██[0m    [0;1;34;94m██[0m [0;1;34;94m▀█▄[0m [0;1;34;94m▀▀▀▀▀[0m  [0;1;34;94m▄[0;34m██▄▄▄▄▄[0m     [0;34m██[0m"    
echo "    [0;1;30;90m▀▀▀▀[0m   [0;1;34;94m▀▀[0m    [0;1;34;94m▀▀▀[0m [0;1;34;94m▀██[0;34m▄▄▄█▄[0m  [0;34m▀▀▀▀▀▀▀▀[0m     [0;37m▀▀[0m"    
echo "                       [0;34m▀▀▀▀▀[0m"                      
                                                
echo "======================================================"
echo "  Developed by : Shubham Hibare (CR@2Y)"
echo "  Website      : http://hibare.in"  
echo "  Github       : https://hibare.github.io/"
echo "  Linkedin     : https://linkedin.com/in/hibare"
echo "  License      : Unlicensed"
echo "======================================================"
echo "${RED}Disclaimer:${NC} Author of this script is not responsible 
for any damage caused to your system from using this 
script. Use this script at your own risk. You have ${RED}15 
seconds${NC} to abort the process."
echo "======================================================"
sleep 15

#Test for root
if [ `id -u` != 0 ]; then
	echo "${RED}ALERT ... got root?${NC}"
	exit 1
fi

echo "${CYAN}Installing redis ... ${nc}"

#Download latest version of redis
echo -n  "${YELLOW}[*] Downloading redis ... ${NC}"
wget http://download.redis.io/releases/redis-stable.tar.gz > /dev/null 2>&1
ls -l redis-stable.tar.gz > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Create file structure
echo -n "${YELLOW}[*] Creating file structure ... ${NC}"
mkdir -p ~/.crazyScripts
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Copy redis file
echo -n  "${YELLOW}[*] Copying redis file ...${NC}"
cp -f redis-stable.tar.gz ~/.crazyScripts > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Chage pwd
cd ~/.crazyScripts

#Extract files
echo -n "${YELLOW}[*] Extracting files ... ${NC}"
tar xzf redis-stable.tar.gz > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Remove file
rm -f redis-stable.tar.gz > /dev/null 2>&1

#Change PWD to redis
cd redis-stable

#Make files
echo -n "${YELLOW}[*] Executing make ... ${NC}"
make > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi


#Make test
echo -n "${YELLOW}[*] Executing make test ... ${NC}"
make test > /dev/null 2>&1
echo "${GREEN}[Done]${NC}"

cd ~

#Create links
echo -n "${YELLOW}[*] Creating links ... ${NC}"
home=`pwd`
ln -s $home/.crazyScripts/redis-stable/src/redis-server /bin/redis-server > /dev/null 2>&1
ln -s $home/.crazyScripts/redis-stable/src/redis-cli /bin/redis-cli > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi
echo "${CYAN}Completed...${NC}"
echo "${YELLOW}Important to read: ${NC}"
echo "To start server use command redis-server"
echo "To get client use command redis-cli"
