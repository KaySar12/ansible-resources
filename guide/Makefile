BASE_DIR=/root/dev/Ansible/ansible-resources/guide
FIRST_DEMO=1-ansible-first-demo
HANDLERS=2-ansible-handlers
VARIABLES=3-ansible-variables
ENV=4-ansible-environment-variable
CONDITIONALS=5-ansible-conditionals
ansible-first-demo:
	@ansible-playbook --inventory ${BASE_DIR}/${FIRST_DEMO}/inventory/vm-setup-playbook/hosts.ini ${BASE_DIR}/${FIRST_DEMO}/vm-setup-playbook.yml --list-tasks
ansible-handlers:
	@ansible-playbook  --inventory ${BASE_DIR}/${HANDLERS}/inventory/vm-setup-playbook/hosts.ini ${BASE_DIR}/${HANDLERS}/vm-setup-playbook.yml 

####################
#Ansible Variables
####################
ansible-variables:
	@ansible-playbook  --inventory ${BASE_DIR}/${VARIABLES}/inventory/ansible-variables-playbook/hosts.ini ${BASE_DIR}/${VARIABLES}/ansible-variables-playbook.yml
ansible-runtime-variables:
	@ansible-playbook  --inventory ${BASE_DIR}/${VARIABLES}/inventory/ansible-variables-playbook/hosts.ini ${BASE_DIR}/${VARIABLES}/ansible-variables-playbook.yml \
	--extra-vars '{"version":"1.0","other_variable":"foo"}'
ansible-runtime-file-variables:
	@ansible-playbook  --inventory ${BASE_DIR}/${VARIABLES}/inventory/ansible-variables-playbook/hosts.ini ${BASE_DIR}/${VARIABLES}/ansible-variables-playbook.yml \
	--extra-vars '@ansible-variables/my-vars.yml'

##############################
#Ansible Environment Variable
##############################

ansible-env-variables:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${ENV}/inventory/ansible-environment-variable/hosts.ini ${BASE_DIR}/${ENV}/ansible-env-variable-playbook.yml

##############################
#Ansible Conditionals
##############################

ansible-conditionals:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${CONDITIONALS}/inventory/ansible-conditionals/hosts.ini ${BASE_DIR}/${CONDITIONALS}/ansible-conditionals-playbook.yml