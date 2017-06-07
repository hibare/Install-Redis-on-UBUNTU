#!/bin/sh

#Redis automatic installation script
#Property of SKYNET Inc.

#Declaring color variables
RED='\033[0;36m' 	#CYAN COLOUR
NC='\033[0m'	 	#NO COLOUR
GREEN='\033[0;32m' 	#GREEN COLOUR
CYAN='\033[0;31m'	#RED COLOUR
YELLOW='\033[1;33m'

#Banner
echo "==============================================================="
echo " ssssss   kk  kk  yy    yy  tttttttt  eeeeee    ccccc  hh    hh"  
echo "ss        kk kk    yy  yy   tttttttt  ee       cc      hh    hh"
echo " sssss    kkkk      yyyy       tt     eeeee   cc       hhhhhhhh"
echo "      ss  kk  kk     yy        tt     ee       cc      hh    hh"
echo "ssssss    kk   kk    yy        tt     eeeeee    ccccc  hh    hh"
echo "==============================================================="

echo "${CYAN}Downloaded from www.extrabits.tk"
echo "Contact us at support@extrabits.tk"

#Copy redis file
echo "${CYAN}Copying redis file..."
cp redis-stable.tar.gz ~/

#Chage pwd
cd ~

#Extract files
echo "${GREEN}Extracting files..."
tar xzf redis-stable.tar.gz

#Change PWD to redis
cd redis-stable

#Make files
echo "${YELLOW}Making files ready to install..."
make

#Make test
echo "${RED}Testing files..."
make test
cd ~

#Set paths
echo "${CYAN}Setting paths..."
home=`pwd`

echo "alias redis-server='$home/redis-stable/src/redis-server'">>.bashrc
echo "alias redis-cli='$home/redis-stable/src/redis-cli'">>.bashrc

echo "${RED}Important to read: "
echo "To start server use command redis-server"
echo "To get client use command redis-cli"
echo ""
echo "${RED}Complete...!${NC}"
