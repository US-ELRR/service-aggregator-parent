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
	mkdir source/report-aggregate
	cp report-aggregate/pom.xml source/report-aggregate/pom.xml
	cp pom.xml source/pom.xml
	cp cleanup.xml source/cleanup.xml
	zip -r source.zip source/
