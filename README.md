# dev_vs_sys

Una aventura conversacional escrita en Lua. En desarrollo.

Requisitos: Love 0.11.2

## Compilar Love 0.11.2 en Debian 9

<pre>
# apt-get install build-essential automake libtool libphysfs-dev 
# apt-get install libsdl1.2-dev libopenal-dev liblua5.1-0-dev libdevil-dev libmodplug-dev
# apt-get install libfreetype6-dev libmpg123-dev libvorbis-dev libmng-dev libxpm-dev 
# apt-get install libxcursor-dev libxxf86vm-dev libtheora-dev libluajit-5.1-dev 
# apt-get install liblua5.2-dev liblua5.3-dev lua5.1 lua5.2 lua5.3 libsdl-gfx1.2-dev libsdl2-dev

$ wget "https://bitbucket.org/rude/love/downloads/love-11.2-linux-src.tar.gz"
$ tar xfvz love-11.2-linux-src.tar.gz
$ cd love-11.2/
$ ./configure --with-lua=lua
$ make
# make install
</pre>

## Clonar repositorio y ejecutar el juego

<pre>
$ git clone https://github.com/fantalavapies/dev_vs_sys/
$ cd dev_vs_sys
$ love .
</pre>
