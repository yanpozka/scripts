#
# will open the default browser
#
go test -v -coverprofile=/tmp/c.out && go tool cover -html=/tmp/c.out

#
# alias tco='...'
#
