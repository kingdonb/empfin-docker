FROM kingdonb/bundler:latest

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		vim ; \
	rm -rf /var/lib/apt/lists/*

RUN rm -f /usr/local/bundler/bin/bundler \
	&& gem install bundler --version "$BUNDLER_VERSION" --force \
	&& rm -r /root/.gem/

COPY Gemfile /app/
WORKDIR /app
RUN bundle install
RUN yes|rails new .

CMD [ "rails c" ]
