FROM jenkinsci/blueocean

USER root

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main python3==3.7.5-r1 --update-cache

# intall databricks-cli
RUN pip3 install databricks-cli
#install db-connect
RUN pip3 install -U databricks-connect==6.3.1

# install R
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main R==3.6.0-r1 R-dev==3.6.0-r1 --update-cache
RUN apk add make build-base linux-headers libxml2 libxml2-dev
RUN R --slave --vanilla -e 'install.packages("testthat", repos="https://cran.microsoft.com/snapshot/2019-04-15/")'
RUN R --slave --vanilla -e 'install.packages("devtools", repos="https://cran.microsoft.com/snapshot/2019-04-15/")'
RUN chmod a+rw -R /usr/lib/R/library/	# this allows jenkins to install packages
