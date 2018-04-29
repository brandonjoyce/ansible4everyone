define build
	docker build . -t ansible4everyone
endef

build:
	$(call build)

console:
	vagrant up
	$(call build)
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/ansible -it ansible4everyone

deploy:
	ansible-playbook -i inventories/all site.yml --vault-password-file=.vault_password $(ANSIBLE_OPTIONS)

