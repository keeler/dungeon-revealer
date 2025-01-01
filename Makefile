.PHONY: run
run:
	trap 'kill $$(jobs -p)' SIGTERM SIGQUIT SIGKILL SIGHUP SIGINT; \
	npm run start:server:dev & \
	npm run start:frontend:dev