FROM rockylinux:8

MAINTAINER praveen@gmail.com

# Install packages
RUN dnf install -y httpd git && dnf clean all

RUN git clone https://github.com/cloudacademy/static-website-example.git
# Copy the zip file  container
RUN cp -rvf static-website-example/* /var/www/html/

WORKDIR /var/www/html

# Copy contents of markups-kindle directory to current directory
#RUN cp -rvf static-website-example/ &&
RUN rm -rf static-website-example  __MACOSX

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
