#!/bin/sh

# get the latest capstone source code from github
echo "[*] cloning capstone respository to ~/capstone..."
cd ~/ && git clone https://github.com/aquynh/capstone.git ~/capstone

# config
echo "[*] configuring capstone..."
cd capstone/
./make.sh

# first, uninstall all the capstone file
echo "[*] uninstalling capstone..."
sudo ./make.sh uninstall
sudo pip uninstall capstone
sudo pip3 uninstall capstone

# re-install capstone
echo "[*] re-installing capstone..."
sudo ./make.sh install

# install python binding (both python2 & python3)
echo "[*] installing python binding..."
cd bindings/python
sudo make install
sudo make install3

# verify core & binding version
echo "[*] verifying capstone binding version & core version..."
b2="$(python -c "from capstone import *; print(version_bind())")"
c2="$(python -c "from capstone import *; print(cs_version())")"
r2="$(python -c "from capstone import *; print(version_bind() == cs_version())")"

b3="$(python3 -c "from capstone import *; print(version_bind())")"
c3="$(python3 -c "from capstone import *; print(cs_version())")"
r3="$(python3 -c "from capstone import *; print(version_bind() == cs_version())")"

echo "python2 capstone version verify:"
echo "version_bind: $b2"
echo "cs_version: $c2"
echo "result: $r2"
echo ""
echo "python3 capstone version verify:"
echo "version_bind: $b3"
echo "cs_version: $c3"
echo "result: $r3"

echo "[*] Done."
