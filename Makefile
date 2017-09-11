CONTAINER=cfn-flip

.PHONY: install install_exe install_test_exe test
install:
	docker pull callmeradical/$(CONTAINER)
	docker tag callmeradical/$(CONTAINER):latest $(CONTAINER):latest

install_exe:
	if [[ ! -d $(HOME)/bin ]]; then mkdir -p $(HOME)/bin; fi
	echo "docker run -itP -v \$$PWD:/root $(CONTAINER) \"\$$@\"" > $(HOME)/bin/$(CONTAINER)
	chmod u+x usr/local/bin/$(CONTAINER)

install_test_exe:
	if [[ ! -d $(HOME)/bin ]]; then mkdir -p $(HOME)/bin; fi
	echo "docker run -itP -v \$$PWD:/root $(CONTAINER)-test \"\$$@\"" > /usr/local/bin/$(CONTAINER)
	chmod u+x /usr/local/bin/$(CONTAINER)

test:
	docker build -t $(CONTAINER)-test .

push:
	docker build -t callmeradical/$(CONTAINER):latest .
	docker push callmeradical/$(CONTAINER):latest 
