# Google Kubernetes Engine (GKE)

## Setup

```
gcloud config configurations create <config-name>
gcloud config set project <project-name>
gcloud config set account <your-account>
gcloud auth application-default login
```

## Run

```
terraform init
terraform plan
terraform apply
```

## Reference

- https://cloud.google.com/kubernetes-engine/docs/quickstarts/create-cluster-using-terraform
- https://github.com/terraform-google-modules/terraform-docs-samples/tree/main/gke/quickstart/autopilot
