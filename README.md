# T2S SRE Platform - Infrastructure as Code and Kubernetes Deployment

## Project Structure
```
t2s-sre-platform
├── terraform                    # Infrastructure as Code (Terraform)
│   ├── backend-setup            # Code to provision an S3 Bucket and DynamodDB Table for Backend
│   │   ├── main.tf              # S3, DynamoDB
│   │   ├── variables.tf         # Variables for S3 and DynamoDB to use for Remote Backend
│   ├── main.tf                  # EKS Cluster, VPC, RDS, S3
│   ├── variables.tf              # Input variables
│   ├── outputs.tf                # Terraform outputs
│   ├── terraform.tfvars          # Variables for AWS deployment
│   ├── providers.tf              # AWS provider
│   
├── helm                          # Helm Charts for Kubernetes Deployment
│   ├── backend-chart/            # Helm chart for Flask API
│   │   ├── Chart.yaml            # Helm chart metadata
│   │   ├── values.yaml           # Default values for Helm
│   │   ├── templates/            # YAML templates
│   │   │   ├── deployment.yaml   # Backend Deployment
│   │   │   ├── service.yaml      # Backend Service
│   │   │   ├── configmap.yaml    # Backend ConfigMap
│   ├── frontend-chart/           # Helm chart for React App
│   │   ├── Chart.yaml            # Helm chart metadata
│   │   ├── values.yaml           # Default values for Helm
│   │   ├── templates/            # YAML templates
│   │   │   ├── deployment.yaml   # Frontend Deployment
│   │   │   ├── service.yaml      # Frontend Service
│   
├── ci-cd                         # CI/CD Pipelines
│   ├── github-actions.yaml        # GitHub Actions Pipeline
│   ├── argocd.yaml                # ArgoCD GitOps Deployment
│   ├── Jenkinsfile                # Jenkins pipeline (optional)
│   ├── Dockerfile                 # Backend Dockerfile
│   ├── frontend.Dockerfile        # Frontend Dockerfile
│   
├── security                      # Security and Compliance
│   ├── trivy-scan.yaml           # Trivy Container Security Scan
│   ├── opa-policies.rego         # OPA Policy Enforcements
│   ├── vault-setup.yaml          # HashiCorp Vault for secrets management
│   ├── falco.yaml                # Falco Runtime Security
│   
├── monitoring                    # Observability and Monitoring
│   ├── prometheus-config.yaml    # Prometheus configuration
│   ├── grafana-dashboards/       # Prebuilt Grafana dashboards
│   ├── open-telemetry.yaml       # OpenTelemetry Distributed Tracing
│   ├── alerts.yaml               # Alerting Rules (PagerDuty / Slack)
│   
├── chaos-engineering             # Chaos Engineering Setup
│   ├── litmuschaos-experiment.yaml # LitmusChaos Fault Injection
│   ├── gremlin-attack.sh         # Gremlin CPU and Network Chaos
│   
├── backend                       # Flask Backend Code
│   ├── app.py                    # Flask application
│   ├── requirements.txt          # Python dependencies
│   ├── Dockerfile                 # Backend containerization
│   
├── frontend                      # React Frontend Code
│   ├── src/                      # React app source code
│   ├── Dockerfile                 # Frontend containerization
│   ├── package.json               # Node.js dependencies
│   
├── docs                          # Documentation
│   ├── architecture-diagram.png  # Project architecture diagram
│   ├── installation.md           # Installation guide
│   ├── troubleshooting.md        # Common issues and solutions
│
└── README.md                     # Main project documentation
```

## Features
- **Terraform for Infrastructure as Code** (AWS EKS, ALB, RDS, S3, IAM, Security Groups)
- **Helm for Kubernetes Management** (Backend, Frontend, ConfigMaps, Services)
- **CI/CD Pipelines** (GitHub Actions, ArgoCD, Jenkins)
- **Security & Compliance** (Trivy, OPA, Vault, Falco)
- **Monitoring & Logging** (Prometheus, Grafana, OpenTelemetry, Fluent Bit)
- **Chaos Engineering** (LitmusChaos, Gremlin)

---
## Prerequisites
- **AWS CLI** (Configured with IAM permissions)
- **Terraform** (Infrastructure as Code)
- **Kubectl** (Kubernetes CLI)
- **Helm** (Package manager for Kubernetes)
- **Docker** (Container runtime)
- **GitHub Actions** (CI/CD pipeline automation)

---
## Deployment Steps
### **1. Provision AWS Infrastructure using Terraform**
```sh
cd terraform
terraform init
terraform apply -auto-approve
```

### **2. Deploy Applications with Helm**
```sh
helm upgrade --install backend helm/backend-chart --namespace t2s-app
helm upgrade --install frontend helm/frontend-chart --namespace t2s-app
```

### **3. Set up CI/CD Pipelines**
- Choose between GitHub and Jenkins depending on your desired CI/CD tool.  

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

## Security Features
- **Trivy** for container security scanning
- **OPA Policies** to enforce security policies
- **Vault** for secret management
- **Falco** for runtime security monitoring

## Monitoring & Observability
- **Prometheus** for collecting metrics
- **Grafana** for visual dashboards
- **OpenTelemetry** for distributed tracing
- **Alerting** via Slack and PagerDuty

## Chaos Engineering
- **LitmusChaos** to inject failures
- **Gremlin** for CPU & Network attacks

## License
This project is open-source and licensed under the MIT License.

---
