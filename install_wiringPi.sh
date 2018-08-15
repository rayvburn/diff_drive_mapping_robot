CYN='\033[0;36m'  # ${CYN}
NC='\033[0m'      # ${NC}

echo " "
while true; do
    read -p "Do you wish to install the wiringPi library? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo " "
while true; do
    read -p "Are you sure you are trying to install it on a Raspberry Pi device? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo " "
cd ~/
mkdir git
cd ~/git
git clone git://git.drogon.net/wiringPi
cd ~/git/wiringPi
./build

gpio -v
gpio readall

echo -e "If you have any trouble trying to compile DDMR package just copy the wiringPi's libwiringPi.so to /usr/local/lib/ (if it's not there already)"
echo -e "It doesn't remove compilation warnings but makes wiringPi fully usable by ROS nodes"
echo -e "Check ${CYN}http://wiringpi.com/${NC} for any further info"
echo " "

