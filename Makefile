.PHONY: build
build:
	npm run build

.PHONY: run
run: build
	trap 'kill $$(jobs -p)' SIGTERM SIGQUIT SIGKILL SIGHUP SIGINT; \
	npm run start:server:dev & \
	npm run start:frontend:dev