FROM amazonlinux:2017.12.0.20180330

# パッケージインストール
RUN yum -y update && yum clean all && \
    yum -y install \
    wget \
    git \
    awscli \
    openssh \
    openssh-server \
    tar \
    gcc \
    make \
    zlib-devel \
    openssl-devel \
    which \
    zip \
    unzip \
    glibc-langpack-ja \
    bzip2 \
    readline \
    SQLite3

# タイムゾーン
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 環境変数
ENV HOME /root

# pyenv インストール
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

# Python 3.6.6 インストール
RUN pyenv install 3.6.6

# Python 3.6.6 をグローバルに適用
RUN pyenv global 3.6.6

# pythonのバージョンをインストールしたものに変更
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN eval "$(pyenv init -)"

RUN pyenv versions
RUN python -V
RUN which python
RUN echo $PATH

# # pip インストール
# RUN wget https://bootstrap.pypa.io/get-pip.py
# RUN python get-pip.py

# # Django インストール
# RUN pip install django
# RUN pip install -r requirements.txt -t lib/

# # nginx インストール
# RUN yum install -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
# RUN yum install -y --enablerepo=nginx nginx
# RUN yum swap -y fakesystemd systemd && yum clean all

# # nginx 起動
# RUN systemctl enable nginx
# ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
# EXPOSE 80

# COPY ./html/index.html /usr/share/nginx/html/index.html

# # set LANG
# ENV LANG ja_JP.UTF-8

# WORKDIR /root
# CMD ["/bin/bash"]