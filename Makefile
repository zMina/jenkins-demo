deploy: package
	echo
	echo Deploying program
	(cd /tmp && tar xzvf - ) < build.tar.gz
	(cd /tmp && ./program)

package: check
	echo
	echo Packaging program
	tar cvzf build.tar.gz program

check:  program
	echo
	echo Checking program
	./program | grep Hello.World
	ant test

program: program.c
	cc -o program program.c
	ant test

clean:
	git clean -xffd

