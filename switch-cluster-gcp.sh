
alias gcluster='printf "gcloud container clusters get-credentials $CLUSTER_NAME\nkubectl config set-context \$(kubectl config current-context) --namespace=$NAMESPACE\ngcloud config set container/cluster $CLUSTER_NAME\n" | xclip -sel clip'

# after this just paste in your terminal Ctrl+Shift+v or Ctrl+v
