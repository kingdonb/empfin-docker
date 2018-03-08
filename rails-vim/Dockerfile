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
RUN yes n|rails new .

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
        BUNDLE_BIN="$GEM_HOME/bin" \
        BUNDLE_SILENCE_ROOT_WARNING=1 \
        BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

CMD [ "rails", "c" ]
