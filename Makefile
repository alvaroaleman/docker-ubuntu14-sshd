containername = ubuntu14sshdtest
imagename = ubuntu14sshd:test
hostport = 4444
registryimagename = alvaroaleman/ubuntu14-sshd:latest

clean:
	- sudo docker kill $(containername)
	- sudo docker rm $(containername)

build:
	sudo docker build -t $(imagename) .

pull:
	sudo docker pull $(registryimagename)

run: clean pull
	sudo docker run -d -p $(hostport):22 --name $(containername) $(registryimagename)

testrun: clean build
	sudo docker run -d -p $(hostport):22 --name $(containername) $(imagename)

enter: testrun
	sudo docker exec -it $(containername) bash
