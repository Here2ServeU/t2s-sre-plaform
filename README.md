# T2S SRE Platform - Infrastructure as Code and Kubernetes Deployment

## Project Structure
```
t2s-sre-platform
├── terraform                    # Infrastructure as Code (Terraform)
│   ├── main.tf                  # EKS Cluster, VPC, RDS, S3
│   ├── variables.tf              # Input variables
│   ├── outputs.tf                # Terraform outputs
│   ├── eks.tf                    # EKS Cluster configuration
│   ├── alb.tf                    # Application Load Balancer setup
│   ├── rds.tf                    # PostgreSQL database setup
│   ├── s3.tf                     # S3 Bucket for frontend assets
│   ├── security.tf                # IAM roles & security groups
│   ├── terraform.tfvars          # Variables for AWS deployment
│   ├── providers.tf              # AWS provider
│   ├── README.md                 # Terraform setup instructions
│   ├── backend.tf                # Terraform state management (S3)
│   ├── outputs.tf                # Terraform outputs
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
│   ├── README.md                 # Helm setup guide
│
├── ci-cd                         # CI/CD Pipelines
│   ├── github-actions.yaml        # GitHub Actions Pipeline
│   ├── argocd.yaml                # ArgoCD GitOps Deployment
│   ├── Jenkinsfile                # Jenkins pipeline (optional)
│   ├── Dockerfile                 # Backend Dockerfile
│   ├── frontend.Dockerfile        # Frontend Dockerfile
│   ├── README.md                  # CI/CD Setup Guide
│
├── security                      # Security and Compliance
│   ├── trivy-scan.yaml           # Trivy Container Security Scan
│   ├── opa-policies.rego         # OPA Policy Enforcements
│   ├── vault-setup.yaml          # HashiCorp Vault for secrets management
│   ├── falco.yaml                # Falco Runtime Security
│   ├── README.md                 # Security setup documentation
│
├── monitoring                    # Observability and Monitoring
│   ├── prometheus-config.yaml    # Prometheus configuration
│   ├── grafana-dashboards/       # Prebuilt Grafana dashboards
│   ├── open-telemetry.yaml       # OpenTelemetry Distributed Tracing
│   ├── alerts.yaml               # Alerting Rules (PagerDuty / Slack)
│   ├── README.md                 # Monitoring and Logging setup
│
├── chaos-engineering             # Chaos Engineering Setup
│   ├── litmuschaos-experiment.yaml # LitmusChaos Fault Injection
│   ├── gremlin-attack.sh         # Gremlin CPU and Network Chaos
│   ├── README.md                 # Chaos Engineering Guide
│
├── backend                       # Flask Backend Code
│   ├── app.py                    # Flask application
│   ├── requirements.txt          # Python dependencies
│   ├── Dockerfile                 # Backend containerization
│   ├── README.md                  # Backend setup
│
├── frontend                      # React Frontend Code
│   ├── src/                      # React app source code
│   ├── Dockerfile                 # Frontend containerization
│   ├── package.json               # Node.js dependencies
│   ├── README.md                  # Frontend setup
│
├── docs                          # Documentation
│   ├── architecture-diagram.png  # Project architecture diagram
│   ├── installation.md           # Installation guide
│   ├── troubleshooting.md        # Common issues and solutions
│   ├── README.md                 # Project overview
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

## Deployment Steps
1. **Provision Infrastructure**
   ```sh
   cd terraform
   terraform init
   terraform apply -auto-approve
   ```
2. **Deploy Applications via Helm**
   ```sh
   helm install backend helm/backend-chart --namespace t2s-app
   helm install frontend helm/frontend-chart --namespace t2s-app
   ```
3. **Set up CI/CD**
   ```sh
   kubectl apply -f ci-cd/github-actions.yaml
   ```

For detailed documentation, refer to each directory's respective `README.md` files.
