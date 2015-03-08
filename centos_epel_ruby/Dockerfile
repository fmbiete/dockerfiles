FROM fbiete/centos_epel:7
MAINTAINER Francisco Miguel Biete <fbiete@gmail.com>

# Define versions
ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.1

# Prepare system
RUN yum install -y \
tar \
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
git \
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
curl \
&& yum clean all

# Compile ruby
RUN mkdir -p /usr/src/ruby \
&& curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
| tar -xjC /usr/src/ruby --strip-components=1 \
&& cd /usr/src/ruby \
&& autoconf \
&& ./configure --disable-install-doc \
&& make -j"$(nproc)" \
&& make install \
&& rm -rf /usr/src/ruby

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:/usr/lib64/qt4/bin:$PATH

RUN gem install bundler \
&& bundle config --global path "$GEM_HOME" \
&& bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

CMD [ "irb" ]
