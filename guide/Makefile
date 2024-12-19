BASE_DIR=/root/dev/Ansible/ansible-resources/guide
FIRST_DEMO			=1-ansible-first-demo
HANDLERS			=2-ansible-handlers
VARIABLES			=3-ansible-variables
ENV					=4-ansible-environment-variable
CONDITIONALS		=5-ansible-conditionals
IMPORT_ROLES		=6-ansible-import-roles
JINJA2_TEMPLATE		=7-ansible-jinja2-template
DEPLOYMENT_STRATEGY	=8-ansible-deployment-strategy
VAULT				=10-ansible-vault
ansible-first-demo:
	@ansible-playbook --inventory ${BASE_DIR}/${FIRST_DEMO}/inventory/vm-setup-playbook/hosts.ini ${BASE_DIR}/${FIRST_DEMO}/vm-setup-playbook.yml --list-tasks

####################
#Ansible Handlers
####################
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

##############################
#Ansible Import Roles
##############################

ansible-import-roles:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${IMPORT_ROLES}/inventory/ansible-import-roles/hosts.ini ${BASE_DIR}/${IMPORT_ROLES}/ansible-import-roles-playbook.yml

##############################
#Ansible Jinja2  Template
##############################

ansible-jinja2-template:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${JINJA2_TEMPLATE}/inventory/ansible-jinja2-template/hosts.ini ${BASE_DIR}/${JINJA2_TEMPLATE}/ansible-jinja2-template-playbook.yml

#####################################
#Ansible Deployment strategy Template
#####################################

ansible-deploy-dev:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${DEPLOYMENT_STRATEGY}/inventory/ansible-deployment-strategy/hosts.ini ${BASE_DIR}/${DEPLOYMENT_STRATEGY}/ansible-deployment-strategy-playbook.yml \
	--limit dev-node
ansible-deploy-prod:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${DEPLOYMENT_STRATEGY}/inventory/ansible-deployment-strategy/hosts.ini ${BASE_DIR}/${DEPLOYMENT_STRATEGY}/ansible-deployment-strategy-playbook.yml \
	--limit prod-node

###############
#Ansible Vault
###############
ansible-vault-ask-pass:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${VAULT}/inventory/ansible-vault/hosts.ini ${BASE_DIR}/${VAULT}/ansible-vault-playbook.yml \
	-e @/root/dev/Ansible/ansible-resources/guide/10-ansible-vault/group_vars/my_vault.yml --ask-vault-pass

ansible-vault-pass-file:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${VAULT}/inventory/ansible-vault/hosts.ini ${BASE_DIR}/${VAULT}/ansible-vault-playbook.yml \
	-e @/root/dev/Ansible/ansible-resources/guide/10-ansible-vault/group_vars/my_vault_with_base64_pass.yml --vault-password-file=/root/dev/Ansible/ansible-resources/guide/10-ansible-vault/pass_file/ansible-vault.pass