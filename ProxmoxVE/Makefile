BASE_DIR=/root/dev/Ansible/ansible-resources/ProxmoxVE

backup-vm:
	@ansible-playbook -v \
	--inventory /root/dev/Ansible/ansible-resources/ProxmoxVE/resources/inventory/hosts.ini \
	/root/dev/Ansible/ansible-resources/ProxmoxVE/Backup-VM/backup-vms-playbook.yml 
backup-vm-id:
	@ansible-playbook -v \
	--inventory /root/dev/Ansible/ansible-resources/ProxmoxVE/resources/inventory/hosts.ini \
	/root/dev/Ansible/ansible-resources/ProxmoxVE/Backup-VM/backup-vms-by-ids-playbook.yml