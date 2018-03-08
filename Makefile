RELENG=kingdonb
RELVER=2.3.6

UBUNTU_VERSION=16.04

all:	build push

build:	upstream wget ruby bundler	#######	rubygems

upstream:
	docker pull ndoit/ubuntu:${UBUNTU_VERSION}
wget:
	docker build wget-ssl -t ${RELENG}/wget:${UBUNTU_VERSION}
	docker tag ${RELENG}/wget:${UBUNTU_VERSION} ${RELENG}/wget:latest
ruby:
	docker build ruby-${RELVER} -t ${RELENG}/ruby:${RELVER}
	docker tag ${RELENG}/ruby:${RELVER} ${RELENG}/ruby:latest
bundler:
	docker build ruby-bundler -t ${RELENG}/bundler:latest
# gems:
# 	docker build ruby-gems -t ${RELENG}/ruby-gems:latest

push:
	docker push ${RELENG}/ruby:${RELVER}
	docker push ${RELENG}/ruby:latest
	docker push ${RELENG}/ruby-bundler:latest
#	docker push ${RELENG}/ruby-gems:latest
