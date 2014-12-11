test: test-server test-sentinel

test-server:
	docker run -v ${PWD}:/etc/ansible/roles/role -t playlist/ansible /etc/ansible/roles/role/tests/run.sh server

test-sentinel:
	docker run -v ${PWD}:/etc/ansible/roles/role -t playlist/ansible /etc/ansible/roles/role/tests/run.sh sentinel

.PHONY: all
