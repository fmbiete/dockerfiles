FROM centos:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

RUN yum install -y http://mirror.uv.es/mirror/fedora-epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum clean all && yum install -y tar bzip2 yum-utils deltarpm nodejs ImageMagick qt qt-devel qtwebkit qtwebkit-devel xorg-x11-server-Xvfb openldap-devel gcc gcc-c++ make git
RUN yum clean all && yum-builddep -y ruby
RUN yum clean all

WORKDIR cd /usr/local/src

RUN echo 'export RBENV_ROOT="/usr/local/src/rbenv' > /etc/profile.d/rbenv.sh \
&& echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh \
&& echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN git clone git://github.com/sstephenson/rbenv.git \
&& git clone git://github.com/sstephenson/ruby-build.git rbenv/plugins/ruby-build
RUN export MAKE_OPTS="-j$(nproc)" \
&& export CONFIGURE_OPTS="--disable-install-doc" \
&& rbenv install 2.2.0 \
&& rbenv rehash \
&& rbenv global 2.2.0 \
&& echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc" \
&& gem install bundler \
&& rbenv rehash
