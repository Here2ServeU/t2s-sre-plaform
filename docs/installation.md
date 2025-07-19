# Installation Guide

## Prerequisites
Before setting up the **T2S SRE Platform**, ensure you have the following installed:

### Required Tools
- **[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)** – Configured with IAM permissions.
- **[Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)** – Infrastructure as Code.
- **[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)** – Kubernetes CLI.
- **[Helm](https://helm.sh/docs/intro/install/)** – Kubernetes Package Manager.
- **[Docker](https://docs.docker.com/get-docker/)** – Container Runtime.
- **[GitHub CLI](https://cli.github.com/)** – GitHub CLI (optional).

### Step-by-Step Installation

### **Step 1: Clone the Repository**
```sh
git clone https://github.com/Here2ServeU/t2s-sre-plaform.git
cd t2s-sre-plaform
```

### **Step 2: Set Up AWS Infrastructure**
```sh
cd terraform
terraform init
terraform apply -auto-approve
```
- This provisions **EKS, RDS, S3, and networking** resources.

*Refer to the image below for Terraform setup:*
![Terraform Setup](https://via.placeholder.com/800x400.png?text=Terraform+Setup+Screenshot)

### **Step 3: Deploy Applications with Helm**
```sh
helm upgrade --install backend helm/backend-chart --namespace t2s-app
helm upgrade --install frontend helm/frontend-chart --namespace t2s-app
```
- This deploys the **Flask Backend** and **React Frontend** to **Kubernetes**.

*Deployment overview:*
![Helm Deployment](https://via.placeholder.com/800x400.png?text=Helm+Deployment+Screenshot)

### **Step 4: Set Up CI/CD Pipelines**
#### GitHub Actions
```sh
kubectl apply -f ci-cd/github-actions.yaml
```
#### ArgoCD GitOps Deployment
```sh
kubectl apply -f ci-cd/argocd.yaml
```
#### Jenkins Pipeline (Optional)
```sh
kubectl apply -f ci-cd/Jenkinsfile
```
*GitHub Actions Pipeline Setup:*
![GitHub Actions](https://via.placeholder.com/800x400.png?text=GitHub+Actions+Setup)

### **You're all set!**
Now, navigate to your **frontend URL** and access the app!
