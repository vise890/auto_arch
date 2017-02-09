default:

test: up2date test_aur test_lang_pkgs test_pkgs test_sh test_systemd

up2date:
	@echo "==> building up to date base image"
	docker build . --tag archlinux:latest -f ./test/Dockerfile_up2date

test_aur:
	@echo "==> testing AUR"
	@echo "==> FIXME: implement me!"
	#docker build . -f ./test/Dockerfile_aur

test_lang_pkgs:
	@echo "==> testing lang_pkgs"
	docker build . -f ./test/Dockerfile_lang_pkgs

test_pkgs:
	@echo "==> testing pkgs"
	docker build . -f ./test/Dockerfile_pkgs

test_sh:
	@echo "==> testing sh"
	docker build . -f ./test/Dockerfile_sh

test_systemd:
	@echo "==> testing systemd"
	docker build . -f ./test/Dockerfile_systemd

