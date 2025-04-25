.phony: sync, clean, package

sync:
	git submodule init
	git submodule update

clean:
	mvn clean
	rm -rf source*

package: clean
	mvn package

source:
	mkdir source
	cp -R elrrserviceentities/ source/elrrserviceentities/
	rm -rf source/elrrserviceentities/.github
	rm -rf source/elrrserviceentities/target
	cp -R elrrservices/ source/elrrservices/
	rm -rf source/elrrservices/target
	rm -rf source/elrrservices/.github
	cp pom.xml source/pom.xml
	zip -r source.zip source/
