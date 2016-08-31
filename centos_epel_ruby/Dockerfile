FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

# Define versions
ENV RUBY_MAJOR 2.3
ENV RUBY_VERSION 2.3.1

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:/usr/lib64/qt4/bin:$PATH
# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

# Prepare system
# Compile ruby
#   skip installing gem documentation
RUN yum clean all \
&& yum install -y \
bzip2 \
nodejs \
ImageMagick \
qt \
qt-devel \
qtwebkit \
qtwebkit-devel \
xorg-x11-server-Xvfb \
openldap-devel \
bison \
gcc \
gcc-c++ \
make \
patch \
rrdtool-devel \
mariadb-devel \
sqlite-devel \
autoconf \
gdbm-devel \
libdb-devel \
libffi-devel \
libyaml-devel \
ncurses-devel \
readline-devel \
systemtap-sdt-devel \
tk-devel \
openssl-devel \
&& yum clean all \
&& mkdir -p /usr/local/src/ruby \
&& curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" | tar -xjC /usr/local/src/ruby --strip-components=1 \
&& cd /usr/local/src/ruby \
&& autoconf \
&& ./configure --disable-install-doc \
&& make -j"$(nproc)" \
&& make install \
&& cd \
&& rm -rf /usr/local/src/ruby \
&& echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc" \
&& gem install bundler \
&& bundle config --global path "$GEM_HOME" \
&& bundle config --global bin "$GEM_HOME/bin"


CMD [ "irb" ]
