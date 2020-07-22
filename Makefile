RELENG=yebyen
RELVER=pa-v8-2.6.6

all:	build push

build:	slave jnlp ruby-base ruby-runtime

slave:
	docker build docker-slave -t ${RELENG}/docker-slave
jnlp:
	docker build docker-jnlp-slave -t ${RELENG}/docker-jnlp-slave
ruby-base:
	docker build jenkins-ruby-slave-base -t ${RELENG}/jenkins-ruby-slave-base:2.6.6
ruby-runtime:
	docker build jenkins-ruby-slave -t ${RELENG}/jenkins-ruby-slave:${RELVER}

push:
	docker push ${RELENG}/docker-slave
	docker push ${RELENG}/docker-jnlp-slave
	docker push ${RELENG}/jenkins-ruby-slave-base
	docker push ${RELENG}/jenkins-ruby-slave:${RELVER}
