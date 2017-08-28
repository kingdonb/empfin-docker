RELENG=yebyen
RELVER=ft

all:	build push

build:
	docker build docker-jnlp-slave -t ${RELENG}/docker-jnlp-slave
	docker build jenkins-ruby-slave-base -t ${RELENG}/jenkins-ruby-slave-base
	docker build jenkins-ruby-slave -t ${RELENG}/jenkins-ruby-slave:${RELVER}

push:
	docker push ${RELENG}/docker-jnlp-slave
	docker push ${RELENG}/jenkins-ruby-slave-base
	docker push ${RELENG}/jenkins-ruby-slave:${RELVER}
