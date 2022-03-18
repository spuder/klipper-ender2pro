deploy:
	ansible-playbook -i inventory playbook.yaml -c paramiko --ask-pass