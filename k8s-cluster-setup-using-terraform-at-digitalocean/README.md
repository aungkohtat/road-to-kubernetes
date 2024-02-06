# kubernetes-cluster-setup-using-terraform-at-digitalocean
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
echo "digitalocean_api_token=\"dop_v1_fdd3f98daxxxxxe3f999bf6996fe1bxxxxx17008b960709f14297c33199eb5f\"" >> terraform.tfvars
## 4-Initialize Terraform
```bash
 terraform init
```
```bash
gitpod /workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean (main) $ tf init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of digitalocean/digitalocean from the dependency lock file
- Reusing previous version of hashicorp/local from the dependency lock file
- Using previously-installed digitalocean/digitalocean v2.34.1
- Using previously-installed hashicorp/local v2.4.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## 5-Terraform Plan
- `terraform plan`

```bash
gitpod /workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean (main) $ tf plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_kubernetes_cluster.my_cluster will be created
  + resource "digitalocean_kubernetes_cluster" "my_cluster" {
      + cluster_subnet                   = (known after apply)
      + created_at                       = (known after apply)
      + destroy_all_associated_resources = false
      + endpoint                         = (known after apply)
      + ha                               = false
      + id                               = (known after apply)
      + ipv4_address                     = (known after apply)
      + kube_config                      = (sensitive value)
      + name                             = "my-k8s-cluster"
      + region                           = "sgp1"
      + registry_integration             = false
      + service_subnet                   = (known after apply)
      + status                           = (known after apply)
      + surge_upgrade                    = true
      + updated_at                       = (known after apply)
      + urn                              = (known after apply)
      + version                          = "1.29.0-do.0"
      + vpc_uuid                         = (known after apply)

      + node_pool {
          + actual_node_count = (known after apply)
          + auto_scale        = false
          + id                = (known after apply)
          + name              = "pool-1"
          + node_count        = 3
          + nodes             = (known after apply)
          + size              = "s-2vcpu-4gb"
        }
    }

  # local_file.k8s_config will be created
  + resource "local_file" "k8s_config" {
      + content              = (known after apply)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "/workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean/.kube/kubeconfig.yaml"
      + id                   = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.
```

## 6. Terraform your Kubernetes Cluster
```bash
terraform apply
```
```bash
gitpod /workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean (main) $ tf apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_kubernetes_cluster.my_cluster will be created
  + resource "digitalocean_kubernetes_cluster" "my_cluster" {
      + cluster_subnet                   = (known after apply)
      + created_at                       = (known after apply)
      + destroy_all_associated_resources = false
      + endpoint                         = (known after apply)
      + ha                               = false
      + id                               = (known after apply)
      + ipv4_address                     = (known after apply)
      + kube_config                      = (sensitive value)
      + name                             = "my-k8s-cluster"
      + region                           = "sgp1"
      + registry_integration             = false
      + service_subnet                   = (known after apply)
      + status                           = (known after apply)
      + surge_upgrade                    = true
      + updated_at                       = (known after apply)
      + urn                              = (known after apply)
      + version                          = "1.29.0-do.0"
      + vpc_uuid                         = (known after apply)

      + node_pool {
          + actual_node_count = (known after apply)
          + auto_scale        = false
          + id                = (known after apply)
          + name              = "pool-1"
          + node_count        = 3
          + nodes             = (known after apply)
          + size              = "s-2vcpu-4gb"
        }
    }

  # local_file.k8s_config will be created
  + resource "local_file" "k8s_config" {
      + content              = (known after apply)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "/workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean/.kube/kubeconfig.yaml"
      + id                   = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

digitalocean_kubernetes_cluster.my_cluster: Creating...
digitalocean_kubernetes_cluster.my_cluster: Still creating... [10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [40s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [50s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m0s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m40s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [1m50s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m0s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m40s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [2m50s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m0s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m40s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [3m50s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m0s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m40s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [4m50s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [5m0s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [5m10s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [5m20s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Still creating... [5m30s elapsed]
digitalocean_kubernetes_cluster.my_cluster: Creation complete after 5m33s [id=2fa8dc19-87c7-436e-998a-1f4eb3c6b5d7]
local_file.k8s_config: Creating...
local_file.k8s_config: Creation complete after 0s [id=7995b8e6449695bd4c0505cb4239788193f8d9ee]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## 7. Set your KUBECONFIG Environment Variable

```bash
export KUBECONFIG="./.kube/kubeconfig.yaml"
```

## 8. Check Kubernetes Cluster Nodes
```bash
gitpod /workspace/Kubernetes-in-Action/k8s-cluster-setup-using-terraform-at-digitalocean (main) $ kubectl get nodes -o wide
NAME           STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP       OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
pool-1-oq0c3   Ready    <none>   3m14s   v1.29.0   10.104.0.3    104.248.149.62    Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
pool-1-oq0cn   Ready    <none>   3m16s   v1.29.0   10.104.0.2    104.248.145.191   Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
pool-1-oq0u9   Ready    <none>   3m17s   v1.29.0   10.104.0.4    104.248.149.91    Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
```


## 9. Deploy your first app
-`kubectl apply -f k8s.yaml`

## 10. Clean-up
- `terraform apply -destroy -auto-approve`

**Happy Learning ...!!!**