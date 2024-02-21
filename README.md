# Vagrant Docker Deployment
The ultimate goal of this project is to streamline and standardize the deployment process of a web application by implementing Vagrant and Docker. Through Vagrant's efficient virtual machine management and Docker's powerful containerization, our deployment workflow is automated with ease and consistency.
## Table of Contents
* [Introduction](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#introduction)
* [Features](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#features)
* [Requirements](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#requiremets)
* [Setup](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#setup)
* [Usage](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#usage)
* [Scripts](https://github.com/CloudOps-Akash/vagrant-docker-deployment/edit/#scripts)
* [Contributing](https://github.com/CloudOps-Akash/vagrant-docker-deployment/#contributing)
* [License](https://github.com/CloudOps-Akash/vagrant-docker-deployment/edit/#license)

## Introduction
Automation is a key component in modern software development and DevOps strategies, effectively improving productivity and reducing the risk of human mistakes. To streamline the deployment process of a web application, this project utilizes Vagrant to set up virtual machines and Docker to containerize the application.

## Features
Automated provisioning of server and client VMs using Vagrant.
Containerization of the web application using Docker.
Secure transfer of Docker images between VMs using SCP.
Scripted deployment process for seamless execution.

## Requirements
Before getting started, ensure you have the following prerequisites installed:

* Vagrant - for VM management.
* VirtualBox - as the VM provider.
* Docker - for containerization.
* SSH client (typically included in Unix-based systems).

## Setup
1. Clone this repository to your local machine:
```bash
git clone https://github.com/CloudOps-Akash/vagrant-docker-deployment
```
2. Navigate to the project directory:
```bash
cd vagrant-docker-deployment
```
## Usage

1. Start the deployment process by running:

```bash
vagrant up
```
2. Once the VMs are up and running, SSH into the server VM:
```bash
vagrant ssh server
```
3. Set up passwordless authentication using ssh-keygen -t rsa for both client1 and client2:
```bash
ssh-keygen -t rsa
```
Follow the prompts to generate SSH keys.

4. Copy the public SSH key to client1 and client2:
```bash
ssh-copy-id vagrant@client1
ssh-copy-id vagrant@client2
```
5. Test SSH connection to client1 and client2:
```bash
ssh vagrant@client1
ssh vagrant@client
```
Ensure you can log in without entering a password.

6. Navigate to the groot directory in the server VM:
```bash
cd Groot
```
7. Execute the secure_transfer.sh script to securely transfer Docker images between VMs:
```bash
./secure_transfer.sh
```
8. Execute the remote_execute.sh script to deploy the web application on client1 and client2:
```bash 
./remote_execute.sh
```
9. Once the deployment is complete, access your web application at the designated IP address.

## Scripts
* **remote_execute.sh**: Script to execute commands remotely on client VMs.
* **secure_transfer.sh**: Script for secure transfer of Docker images between VMs.
* **deploy_app.sh**: Script for deploying the web application on client VMs.

## Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request for any improvements or additional features.

## License
[MIT](https://choosealicense.com/licenses/mit/)
