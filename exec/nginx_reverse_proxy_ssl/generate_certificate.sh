#!/usr/bin/env bash

openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout ./conf.d/key.pem -out conf.d/cert.pem -days 365
