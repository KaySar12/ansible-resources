BASE_DIR=/root/dev/Ansible/ansible-resources/NextZen-Automation
RESOURCES=resources
INITIALIZE=1-initialize
nextzen-initialize:
	@ansible-playbook -v \
	--inventory ${BASE_DIR}/${RESOURCES}/inventory/hosts.ini \
	${BASE_DIR}/${INITIALIZE}/initialize.yml \
	-e @${BASE_DIR}/resources/database/secret/credentials.yml \
	--vault-password-file=${BASE_DIR}/resources/pass/credentials.pass