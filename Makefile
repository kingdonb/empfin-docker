RELENG=kingdonb
RELVER=2.3.6

UBUNTU_VERSION=16.04

all:	build push

build:	upstream buildpack wget ruby bundler rails

upstream:
	docker pull ndoit/ubuntu:${UBUNTU_VERSION}
buildpack:
	docker build buildpack-ruby -t ${RELENG}/buildpack:ruby
wget:
	docker build wget-ssl -t ${RELENG}/wget:${UBUNTU_VERSION}
	docker tag ${RELENG}/wget:${UBUNTU_VERSION} ${RELENG}/wget:latest
ruby:
	docker build ruby-${RELVER} -t ${RELENG}/ruby:${RELVER}
	docker tag ${RELENG}/ruby:${RELVER} ${RELENG}/ruby:latest
bundler:
	docker build ruby-bundler -t ${RELENG}/bundler:latest
rails:
	docker build rails-vim -t ${RELENG}/rails:latest

push:
	docker push ${RELENG}/buildpack:ruby
	docker push ${RELENG}/wget:${UBUNTU_VERSION}
	docker push ${RELENG}/ruby:${RELVER}
	docker push ${RELENG}/ruby:latest
	docker push ${RELENG}/ruby-bundler:latest
	docker push ${RELENG}/rails:latest
