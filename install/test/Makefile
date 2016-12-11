packer_template="./template.json"
default:
	mkdir auto_arch
	cp ../*.sh ./auto_arch
	tar -zcf auto_arch.tar.gz ./auto_arch
	packer-io build $(packer_template) || packer build $(packer_template)
	@echo "==> starting up box"
	vagrant box add renegade_arch ./renegade_arch.box
	vagrant up

clean:
	vagrant box remove renegade_arch || true
	vagrant destroy --force || true
	rm -rf auto_arch.tar.gz
	rm -rf auto_arch
	rm -rf output-virtualbox-iso
