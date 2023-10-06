FROM ruby:2.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

# 作業ディレクトリを作成&&移動
WORKDIR /product-register
# 複数copyする場合はフォルダじゃないといけないので末尾に/をつけないとエラーになる
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install
