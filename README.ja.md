[![Build Status](https://travis-ci.org/ryuichiueda/ros_setup_scripts_Ubuntu16.04_server.svg?branch=master)](https://travis-ci.org/ryuichiueda/ros_setup_scripts_Ubuntu16.04_server)
（Travis CIでUbuntu 16.04がまだ動かないので小細工しています。）

# ros_setup_scripts_Ubuntu16.04

ROS（Kinetic Kame）をUbuntu 16.04に一発でインストール・セットアップするシェルスクリプトです。

# scripts

## step0.bash

このリポジトリを使う前の処理を書いたシェルスクリプトです。コピペで使用のこと。

## step1.bash

これを実行すると、一度ログアウト（あるいはsource ~/.bashrc）したのちにroscore
が動くようになります。ロケールが設定されていない場合は、

    LANG=C roscore

で動作確認をします。ロケールの設定を行いたい場合、日本語環境でよければ次の
locale.ja.bashを実行してください。

## locale.ja.bash

Ubuntuに日本語環境をセットアップして、roscoreがLANG=C無しで動くようにします。

# 注意

2016年5月29日現在、http://jp.archive.ubuntu.com/ubuntu/pool/universe/r/ros-genpy/
が存在しないため、

    $ sudo apt-get install -y python-roslaunch

でエラーが出ます。

/etc/apt/sources.list内のURLのjp.をus.等に変更をお願いします。


# 環境

以下で検証しました。

* Ubuntu Server 16.04 on VirtualBox

