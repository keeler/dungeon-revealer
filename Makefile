.PHONY: build
build:
	npm run build

.PHONY: run
run: build
	trap 'kill $$(jobs -p)' SIGTERM SIGQUIT SIGKILL SIGHUP SIGINT; \
	npm run start:server:dev & \
	npm run start:frontend:dev

.PHONY:
qrcode-link:
	echo "http://$(hostname -I | awk '{print $1}'):4000/" \
		| qrencode -s 30 -o link.png \
		&& feh link.png