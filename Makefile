.phony: sync, clean, package

sync:
	git submodule init
	git submodule update

clean:
	mvn clean

package: clean
	mvn package
