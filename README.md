# GCP Terraform IaC Project Template

This project aims at making GCP based IaC projects easier. It uses terraform to setup the required resources in GCP and Github for a end to end CICD project.

This project assumes some basic understanding of git, github, system administration.

## Requirements

* [Google Cloud Platfrom(GCP) Account](https://console.cloud.google.com/getting-started)
* [Github Account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)

## Local Development

For local, on your laptop not in the "cloud" development, you will need:

* [Git](https://git-scm.com/downloads)
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)
* Code editor, recommended: [VS Code](https://code.visualstudio.com/download)

### Unable to use containers for development

If you are unable to use containers for development you will need to install all the components listed in ```.devcontainer/devcontainer.json``` in order to get this project running.

## Developing in Cloud

You can leverage online services to avoid installing tools on your local machine here are some options:

* [Github Codespaces](https://github.com/features/codespaces), note that there are [limits on the free tier for this service](https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces).
* [Gitpod](https://gitpod.io/) note the [limits of the free tier](https://www.gitpod.io/pricing)

## Usage

Whatever way you choose to run the project you will need to clone/fork this repo and then do the following:
 
1. Open project in a [Dev Container](https://containers.dev/) as specified in ```.devcontainer/devcontainer.json```, using a [Supported Tool](https://containers.dev/supporting), [VS Code with the Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) is recommended. This will allow you to have all the required tools to run the project.
2. Run the ```gcp_init.sh``` script or individual steps as listed therein.
