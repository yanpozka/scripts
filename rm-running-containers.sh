
docker rm -f $(docker ps -a -q)

#
# to remove all images:
#
# docker rmi -f $(docker images -a -q)
