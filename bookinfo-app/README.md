# Kubernetes Cluster Setup with terraform and Deploying the bookinfo application at DigitalOcean Platform
- ![bookinfo-app](/images/assets/withistio.svg)

## 1-Terraform Install
- `chmod +x terraform-install.sh`
-`./terraform-install.sh`
- [Install Terraform](/k8s-cluster-setup-using-terraform-at-digitalocean/terraform-install.sh)

## 2-kubectl Install
- `chmod +x kubectl-install.sh`
- `./kubectl-install.sh`
- [install kubectl](/k8s-cluster-setup-using-terraform-at-digitalocean/kubectl-install.sh)

## 3-Add DigitalOcean Token
```bash
echo "digitalocean_api_token=\"YOUR_API_KEY\"" >> terraform.tfvars
```

## 4-Initialize Terraform
```bash
 terraform init
```
## 5-Terraform Plan
- `terraform plan`

## 6. Terraform your Kubernetes Cluster
```bash
terraform apply
```

## 7. Set your KUBECONFIG Environment Variable

```bash
export KUBECONFIG="./.kube/kubeconfig.yaml"
```


## Kubernetes Pods Level: Concepts & Best Practices
### Pod Detail
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-1.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-2.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-3.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-4.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-5.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-6.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-7.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-8.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-9.jpg)
- ![pod01](/bookinfo-app/imgs/Kubernetes%20Pods%20Level%20Understanding-10.jpg)

## Clean up

- `./cleanup.sh`