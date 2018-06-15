
alias gdev='printf "gcloud container clusters get-credentials dev-cluster-name\nkubectl config set-context \$(kubectl config current-context) --namespace=$NAMESPACE\n" | xclip -sel clip'

alias gprod='printf "gcloud container clusters get-credentials prod-cluster-name\nkubectl config set-context \$(kubectl config current-context) --namespace=$NAMESPACE\n" | xclip -sel clip'

# after this just paste in your terminal Ctrl+Shift+v or Ctrl+v
