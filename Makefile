define build
	docker build . -t ansible4everyone
endef

console:
	$(call build)
	docker run -v ${PWD}:/ansible -it ansible4everyone

deploy:
	ansible-playbook -i inventories/all example.yaml --vault-password-file=.vault_password $(ANSIBLE_OPTIONS)
	#ansible-playbook example.yaml --vault-password-file=.vault_password $(ANSIBLE_OPTIONS)
