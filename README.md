# DigitalOcean Desktop
## Description
This repository holds the necessary code to initialize a Desktop Server in digital ocean. VNC will be used to connect and interact with the desktop. **I take no responsibility for any costs associated with this code. You will be billed for usage of digital ocean cloud.**
## Setup
### Update Some Values
There are two things that need to be checked before running.
1. Ensure that the ssh_keys value is your own ssh_key id from Digital Ocean.
2. After applying the terraform ensure you update the inventory with the IP address given.
3. Update the `user_pass` value under `ansible/playbooks/roles/desktop/defaults/main.yml`.
#### Certificate Creation
One package is needed to create the necessary encrypted string:
1. ansible
### Create Desktop Server
```
cd terraform
terraform init 
terraform apply
cd ..
```
### Setup and Start VNC
```
cd ansible
ansible-playbook -i ansible_hosts playbooks/desktop.yml --ask-vault-pass
```
## Cleanup
You will need to destroy the environment to stop being billed for the infrastructure. Run the following from the respository:
```
cd terraform
terraform destroy
```
This will clean up all objects created in digital ocean.
## Automation
This process is automated in the makefile.
### Build Droplet and Install VNC
`make build`
### Delete Droplet and Other Infrastructure
`make destroy`
## Connection
To connect to the desktop server you will need to forward a port to port 5901 on the remote server.  
```
ssh -L 59001:localhost:5901 root@<serveriphere> &
```  
Then connect to vnc using the value: `localhost:59001`.