# DevOps Portfolio

This is part of my devops portfolio!

The goal of this project is to demonstrate all the Technologies and methodologies I learned as a devops engineer.

Tools & Technologies:
* App: python flask, HTML, Bootstrap, Javascript.
* Database: Mongodb
* CI/CD: Jenkins, Kubernetes, Argocd, Helm
* Infrastructure: Terraform & AWS
* Logging: EFK stack
* Monitoring: Prometheus & Grafana

The full project consists of 4 github repositories:
* The app source code - https://github.com/RachelNaane/linkMe
* The Jenkinsfile repo - https://github.com/RachelNaane/linkMe-jenkins
* The infrastructure source code - you are here:)
* The kubernetes source code - https://github.com/RachelNaane/linkMe-gitops

## Architecture

To see the full architecture of the whole project - https://miro.com/app/board/uXjVPpJXqes=/?share_link_id=803191704280

## Deployment

To deploy this part of the project run

```bash
  terraform apply -var-file=”prod.tfvars”
```

Terraform will create an EKS cluster with argocd, that can be configured to apply the LinkMe app (or any other app you wish) to the cluster. 