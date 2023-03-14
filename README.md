# LinkMe - Terraform

This project is part of my devops portfolio project.
In my project I created an awesome app named 'LinkMe', and built a full ci/cd for it.

The full project consists of 4 github repositories:
* The app source code - https://github.com/RachelNaane/linkMe
* The Jenkinsfile repo - https://github.com/RachelNaane/linkMe-jenkins
* The infrastructure source code - you are here:)
* The kubernetes source code - https://github.com/RachelNaane/linkMe-gitops

## Deployment

To deploy this project run

```bash
  terraform apply -var-file=”prod.tfvars”
```

Terraform will create an EKS cluster with argocd that can be configured to apply the LinkMe app (or any ather app you wish) to the cluster. 