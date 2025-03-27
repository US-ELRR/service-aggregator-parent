.phony: sync, clean, build

sync:
	git submodule init
	git submodule update

clean:
	mvn clean

build: clean
	mvn package
