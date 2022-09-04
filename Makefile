klipper:
	ansible-playbook -i inventory playbooks/klipper_config.yaml --ask-pass -c paramiko
	# ansible-playbook -i inventory playbooks/klipper_config.yaml
moonraker:
	ansible-playbook -i inventory playbooks/moonraker_config.yaml --ask-pass -c paramiko
	# ansible-playbook -i inventory playbooks/moonraker_config.yaml
webcam:
	ansible-playbook -i inventory playbooks/webcam_config.yaml --ask-pass -c paramiko
	# ansible-playbook -i inventory playbooks/webcam_config.yaml
input_shaper:
	ansible-playbook -i inventory playbooks/input_shaper.yaml
all:
	ansible-playbook -i inventory playbooks/all.yaml