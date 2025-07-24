# civo-terraform-cluster


--------- civo ---------
brew tap civo/tools
brew install civo

civo apikey add my-cluster <civo-token>
civo kubernetes config k8s_demo_1 --save
kubectl cluster-info

kubectl config current-context
kubectl config get-contexts
kubectl config use-context <context-name>
kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

Notes:
- in helm/argo civo we cannot pull images from toher registries, only docker hub (docker.io)

--------- cluster CIVO --------
Before - install OBS for recording
1. setup homebrew
2. setup Orbstack - start kubernetes
3. install docker hub
4. setup ngrok 
    ngrok http --url=connectors.ngrok.app 8086
5. install terraform
6. run cluster kubernetes local in terraform
7. expose argocd 
    kubectl port-forward svc/argocd-server -n argocd 8080:80
    argocd admin initial-password -n argocd


--------- cluster --------
Before - install OBS for recording
1. setup homebrew
2. install docker
3. setup ngrok 
    ngrok http --url=connectors.ngrok.app 8086
4. install terraform
5. run cluster kubernetes local in terraform
6. expose argocd 
    kubectl port-forward svc/argocd-server -n argocd 8080:80
    argocd admin initial-password -n argocd
7. brew install helm
8. export KUBECONFIG=/Users/yabinmonroy/.kube/config.yaml


8. docker tunnel 
    docker-compose up -d

9. cloudflare tunnel nginx-demo-1 , demo-local-control-plane
10. install psql in local - brew install postgresql@15
11. enable snow-k8s folder and sql tables

12. enable metric server https://github.com/kubernetes-sigs/metrics-server


----------- application setup ------------

connectors-monkey
- build-and-deploy-public-img.yml
- deploy-public-img.yml
- build-and-deploy-public-img-notifications-off.yml
- deploy-public-img-notifications-off.yml


NOTES:
1. if an application got stuck in argocd kubectl -n argocd patch application app-hello-app-image-helm-civo -p '{"metadata":{"finalizers":null}}' --type=merge
