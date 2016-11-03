#
# Usage: sh update_golang.sh [go$VERSION.$OS-$ARCH.tar.gz]
#

sudo rm -rf /usr/local/go/

sudo tar -C /usr/local -xzf $1

go get -v -u github.com/FiloSottile/gorebuild

gorebuild
