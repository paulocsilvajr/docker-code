FROM ruby:latest
MAINTAINER Paulo C Silva Jr
ENV LANG C.UTF-8
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD ruby ./script.rb

