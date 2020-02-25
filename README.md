This repo points at other repositories which are dependant container images, built using the Makefile included in this directory.

You are on the empfin-pzaforms-2.6.5 branch of `git@github.com:kingdonb/empfin-docker.git`.

This is a map to the child repos and instruction for how to prepare for the `make build`:

```
git clone git@github.com:kingdonb/docker-slave.git;
git clone git@github.com:kingdonb/docker-jnlp-slave \
  -b empfin-pzaforms-2.6.5;
git clone git@github.com:kingdonb/jnlp-slave-ruby \
  -b empfin-pzaforms-2.6.5	jenkins-ruby-slave-base;
git clone git@github.com:kingdonb/docker-jnlp-slave-ruby-runtime \
  -b empfin-pzaforms-2.6.5	jenkins-ruby-slave;

```

The images are tagged for push to a release engineer's Docker Hub repo, based on a variable at the top of the make file, `RELENG=yebyen` – by typing `make build` with an unmodified Makefile, you will build images called:

```
yebyen/docker-slave:latest
yebyen/docker-jnlp-slave:latest
yebyen/jenkins-ruby-slave-base:2.6.5
yebyen/jenkins-ruby-slave:pzaforms-v8-2.6.5
```

You should update RELENG and RELVER to reflect correct information regarding a particular downstream app target of your own and the maintainer.
