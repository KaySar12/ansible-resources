BASE_DIR=/root/dev/Ansible/ansible-resources/NextZen-Automation
RESOURCES=resources
INITIALIZE=1-initialize
nextzen-initialize:
	@ansible-playbook -v \
	--inventory ${BASE_DIR}/${RESOURCES}/inventory/hosts.ini \
	${BASE_DIR}/${INITIALIZE}/initialize.yml \
	-e @${BASE_DIR}/resources/database/secret/credential.yml \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass

encrypt-credential-vault: 
	@ansible-vault encrypt \
	${BASE_DIR}/resources/database/secret/credential.yml  \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass

decrypt-credential-vault: 
	@ansible-vault decrypt \
	${BASE_DIR}/resources/database/secret/credential.yml \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass 

edit-credential-vault:	
	@ansible-vault edit \
	${BASE_DIR}/resources/database/secret/credential.yml \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass

view-credential-vault:
	@ansible-vault view \
	${BASE_DIR}/resources/database/secret/credential.yml \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass