#!/bin/bash
set -Eeuo pipefail
echo "install curl"
apt-get update


echo "install required packages"
{ cat <<EOF
apt-utils
bison
build-essential
ca-certificates
cmake
curl
doxygen
git
gcc
gcc-mingw-w64
geoip-database
gnutls-bin
gnupg
graphviz
heimdal-dev
ike-scan
libgcrypt20-dev
libglib2.0-dev
libgnutls28-dev
libgpgme11-dev
libgpgme-dev
libhiredis-dev
libical-dev
libksba-dev
libldap2-dev
libmicrohttpd-dev
libnet-dev
libnet-snmp-perl
libpcap-dev
libpopt-dev
libsnmp-dev
libssh-gcrypt-dev
libxml2-dev
locales-all
mailutils
net-tools
nmap
nsis
openssh-client
openssh-server
perl-base
pkg-config
postfix
postgresql-11
postgresql-server-dev-11
python3-defusedxml
python3-dialog
python3-lxml
python3-paramiko
python3-pip
python3-polib
python3-psutil
python3-setuptools
redis-server
redis-tools
rsync
smbclient
sshpass
texlive-fonts-recommended
texlive-latex-extra
uuid-dev
wapiti
wget
whiptail
xml-twig-tools
xsltproc
EOF
} | xargs apt-get install -yq --no-install-recommends

echo "Install nodejs"
# Install Node.js
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install nodejs -yq --no-install-recommends

echo "Install yarn"
# Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn -yq --no-install-recommends

