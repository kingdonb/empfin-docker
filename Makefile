RELENG=kingdonb
RELVER=2.3.6

UBUNTU_VERSION=16.04

all:	build push
fetch:	pull

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

clean:
	docker rmi kingdonb/bundler:latest kingdonb/ruby:{2.3.6,latest} \
	  kingdonb/wget:{16.04,latest} kingdonb/buildpack:ruby \
	  kingdonb/rails:latest

push:
	docker push ${RELENG}/buildpack:ruby
	docker push ${RELENG}/wget:${UBUNTU_VERSION}
	docker push ${RELENG}/ruby:${RELVER}
	docker push ${RELENG}/ruby:latest
	docker push ${RELENG}/bundler:latest
	docker push ${RELENG}/rails:latest

pull:
	docker pull ${RELENG}/buildpack:ruby
	docker pull ${RELENG}/wget:${UBUNTU_VERSION}
	docker pull ${RELENG}/ruby:${RELVER}
	docker pull ${RELENG}/ruby:latest
	docker pull ${RELENG}/bundler:latest
	docker pull ${RELENG}/rails:latest
