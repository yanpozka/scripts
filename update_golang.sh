#
# Usage: sh update_golang.sh [version like 1.9.1] 
#

url="https://storage.googleapis.com/golang/go$1.linux-amd64.tar.gz"

wget $url -O /tmp/go.tar.gz

if [ $? -ne 0 ]; then
	echo "Failed downloading Go payload, url: $url"
	exit 1
fi

sudo rm -rf /usr/local/go/

sudo tar -C /usr/local -xzf /tmp/go.tar.gz

go version

go get -v -u github.com/FiloSottile/gorebuild

gorebuild
