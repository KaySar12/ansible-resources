BASE_DIR=/root/dev/Ansible/ansible-resources/guide
FIRST_DEMO			=1-ansible-first-demo
HANDLERS			=2-ansible-handlers
VARIABLES			=3-ansible-variables
ENV					=4-ansible-environment-variable
CONDITIONALS		=5-ansible-conditionals
IMPORT_ROLES		=6-ansible-import-roles
JINJA2_TEMPLATE		=7-ansible-jinja2-template
DEPLOYMENT_STRATEGY	=8-ansible-deployment-strategy
ERROR_HANDLING		=9-ansible-error-handling
VAULT				=10-ansible-vault
DOCKER_CONTAINER	=11-ansible-docker-containers
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

#######################
#Ansible Error Handling
#######################

ansible-error-handling:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${ERROR_HANDLING}/inventory/ansible-error-handling/hosts.ini ${BASE_DIR}/${ERROR_HANDLING}/ansible-error-handling-playbook.yml

###############
#Ansible Vault
###############
ansible-vault-ask-pass:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${VAULT}/inventory/ansible-vault/hosts.ini ${BASE_DIR}/${VAULT}/ansible-vault-playbook.yml \
	-e @${VAULT}/group_vars/my_vault.yml --ask-vault-pass

ansible-vault-pass-file:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${VAULT}/inventory/ansible-vault/hosts.ini ${BASE_DIR}/${VAULT}/ansible-vault-playbook.yml \
	-e @${VAULT}/group_vars/my_vault_with_base64_pass.yml --vault-password-file=${BASE_DIR}/${VAULT}/pass_file/ansible-vault.pass
ansible-vault:
	@ansible-playbook -v  --inventory ${BASE_DIR}/${VAULT}/inventory/ansible-vault/hosts.ini ${BASE_DIR}/${VAULT}/ansible-vault-playbook.yml \
	-e @${VAULT}/group_vars/my_vault_with_base64_pass.yml


###############################
#Ansible With Docker Containers
###############################
ansible-docker-containers:
	@ansible-playbook --inventory ${BASE_DIR}/${DOCKER_CONTAINER}/inventory/ansible-docker-containers/hosts.ini ${BASE_DIR}/${DOCKER_CONTAINER}/network.yml ${BASE_DIR}/${DOCKER_CONTAINER}/dependencies.yml