#!/bin/bash

mongod --dbpath /tmp/mongodata --enableEncryption --kmipServerName 10.0.2.2 \
    --kmipPort 5696 --kmipServerCAFile /vagrant/ca.pem \
    --kmipClientCertificateFile /vagrant/client.pem > ~/mongodb.log 2>&1 &

echo $! > /vagrant/mongodb.pid