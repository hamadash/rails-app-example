# ref. https://matsuand.github.io/docs.docker.jp.onthefly/samples/rails/

# syntax=docker/dockerfile:1
FROM ruby:3.1.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rails-app-example
COPY Gemfile /rails-app-example/Gemfile
COPY Gemfile.lock /rails-app-example/Gemfile.lock
RUN bundle install

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]
