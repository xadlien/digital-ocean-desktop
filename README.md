# DigitalOcean Desktop
## Description
This repository holds the necessary code to initialize a Desktop Server in digital ocean. RDP will be used to connect and interact with the desktop. **I take no responsibility for any costs associated with this code. You will be billed for usage of digital ocean cloud.**
## Setup
### Update Some Values
There are two things that need to be checked before running.
1. Ensure that the ssh_keys value is your own ssh_key id from Digital Ocean.
2. After applying the terraform ensure you update the inventory with the IP address given.
3. Update the `userpass` value under `ansible/playbooks/roles/desktop/defaults/main.yml`.
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
### Build Droplet and Install xRDP
`make build`
### Delete Droplet and Other Infrastructure
`make destroy`
## Connection
To connect to the desktop server you will need an RDP client. I recommend Remmina.
There are some settings you may want to update.
1. Click on the hamburger menu on the main window and go to Preferences > Options Screen Resolutions and click Set Up. You can add in any resolution you want in the form LxH, i.e. 1920x1080.
2. Then go back to the main screen and in the top left click the +. 
3. Add the server address/username/password
4. Scroll down to 'Resolution' and click 'Custom'. 
5. Select your custom resolution. 
6. Then click 'Save and Connect'

This should connect you right in.