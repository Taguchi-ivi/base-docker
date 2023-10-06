# セッション10までの基礎部分を記載
# セッション10以降(主に13-)は別フォルダ内に記載

# 作って行く途中は runを細かく分けてcacheを効かせる。最後にまとめるという方法が効率が良い。
# それぞれのコマンドごとにlayerが作られるので、なるべくまとめるのがベストプラクティス
# RUNはコンテナを作るときに実行される。CMDはコンテナを起動するときに実行される。
# RUNはlayerを作るので、なるべくまとめる。CMDはlayerを作らないので、なるべく分ける。
FROM ubuntu:latest
# RUN apt-get update && apt-get install -y \
#     curl \
#     cvs \
#     nginx
# CMD ["pwd"]

# Docker
#  シンプルにコピーしたい時はcopy
#  ファイルをtarにして圧縮して持っていきたいときはadd
# RUN mkdir /new_dir
# COPY something /new_dir
# ADD compressed.tar /

# CMDとENTRYPOINTの違い
# ENTRYPOINTはRun時に上書きできない / CMDは上書きできる
# ENTRYPOINTはコンテナを記載するときはCMDはENTRYPOINTの引数として渡す
# 基本的にはCMDで問題ない。本当にやるならENTRYPOINTで上書きできないように作成する
# RUN touch test
# ENTRYPOINT [ "ls" ]
# CMD [ "--help" ]
# 上記で言うとls --helpが実行される
# lsは上書きできないが、--helpは上書きできる ex docker run -it <image> -la

# ENV
# 書き方が二つ / ENV <key> <value> / ENV <key>=<value> <key>=<value>
# ENV ke1 value1
# ENV key2=value2 key3=value3
# ENV key3="va lue" key4=v\ a\ l\ u\ e
# ENV key5 valu e

# WORKDIR
# RUNは全てroot直下で実行される(RUN cdで移動していてもroot直下)
# RUN mkdir sample_folder
# これで移動してもroot直下にsample_fileが作成される
# RUN cd sample_folder
# 絶対パスの方がわかりやすい(ちなみにmkdirをしなくてもWORKDIRで存在しないフォルダなら作成される)
# WORKDIR /sample_folder
# RUN touch sample_file

# mount
# docker run -v <host_dir>:<container_dir> <image>
# RUN mkdir new_dir

# -uオプション
# docker build .
# docker run -it -u $(id -u):$(id -g) <image> bash

# -pオプション
# docker build .
# docker run -p <host_port>:<container_port> <image>
# docker run -it -p 8888:8888 --rm juptyer/datascience-notebook bash
# コンテナの8888からホストの8888にアクセスできるようになる
# コンテナのportが重要 hostは使われていなければ何でも良い

# コンテナは上限を設定できる。メモリやCPUの使用量を制限できる
# 今回はやらないけど。
# docker run -it --memory 512m --cpus 0.5 <image> bash