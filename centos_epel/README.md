**Base:** Centos 6

**Extra:**

    - EPEL
    - tar
    - gosu
    - en_US.UTF-8 locale


**Notes:**

CentOS-Docker official image only includes *en_US* locales,
so if you need to generate a specific locale do this in your image:

    RUN /docker-genlocale.sh locale charmap output-name


Example:

    RUN /docker-genlocale.sh es_ES ISO-8859-15 es_ES@euro



If you want to change the locale override those ENV variables in your image:

    ENV LANG en_US.UTF-8
    ENV LANGUAGE en_US.UTF-8
    ENV LC_ALL en_US.UTF-8


or in your container at running time:

    docker run -d --name app_name -e "LANG=en_US.UTF-8" -e "LANGUAGE=en_US.UTF-8" -e "LC_ALL=en_US.UTF-8" fbiete/centos_epel:6