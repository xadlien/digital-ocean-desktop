vpn_file ?= wg0-client.conf
client ?= wg0-client

build:
	cd terraform && terraform init && terraform apply
	bash update-ansiblehosts.sh
	sleep 30
	cd ansible && ansible-playbook -i ansible_hosts_automated playbooks/desktop.yml --ask-vault-password
destroy:
	cd terraform && terraform destroy --auto-approve

