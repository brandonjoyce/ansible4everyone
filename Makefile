define build
	docker build . -t ansible4everyone
endef

default:
	ansible-playbook -i inventories/default site.yml --vault-password-file=.vault_password --skip-tags "rebuild" $(ANSIBLE_OPTIONS)

console:
	vagrant up
	$(call build)
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/ansible -it ansible4everyone

secrets:
	ansible-vault edit roles/common/vars/secrets/secrets.yml --vault-password=.vault_password
