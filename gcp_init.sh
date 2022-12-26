
echo "Authenticating into Github and setting env var for TF provider" 
# https://registry.terraform.io/providers/integrations/github/latest/docs#authentication
gh auth login
export GITHUB_TOKEN=$(gh auth token)

echo "Authenticating into GCP to create state and management resources"
gcloud auth application-default login

echo "Use terraform to create state and management resources and save secrets to CICD"
cd terraform/init
terraform init
terraform validate
terraform plan -compact-warnings -input=false
terraform apply -auto-approve -input=false
