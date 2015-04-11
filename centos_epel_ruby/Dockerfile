FROM fbiete/centos_epel:6
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

# Define versions
ENV RUBY_MAJOR 1.8
ENV RUBY_VERSION 1.8.7-p374
ENV RUBYGEM_VERSION 1.6.2

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
&& mkdir -p /usr/local/src/rubygem \
&& curl -LS http://production.cf.rubygems.org/rubygems/rubygems-$RUBYGEM_VERSION.tgz | tar -xzC /usr/local/src/rubygem --strip-components=1 \
&& cd /usr/local/src/rubygem \
&& ruby setup.rb \
&& cd \
&& rm -rf /usr/local/src/rubygem
&& gem install bundler \
&& bundle config --global path "$GEM_HOME" \
&& bundle config --global bin "$GEM_HOME/bin"


CMD [ "irb" ]
