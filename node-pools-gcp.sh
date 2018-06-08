
gcloud container node-pools create $NAME --cluster $CLUSTER --scopes gke-default,cloud-platform

gcloud container node-pools list

gcloud container node-pools describe $NAME
