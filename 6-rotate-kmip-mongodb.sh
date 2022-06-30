#!/bin/bash

# Following https://www.mongodb.com/docs/manual/tutorial/rotate-encryption-key/

echo "Run the steps in this script manually on the vagrant box"

exit 1

# Kill mongodb

kill $(cat /vagrant/mongodb.pid)

# Restart mongodb with --kmipRotateMasterKey option

mongod --dbpath /tmp/mongodata --enableEncryption --kmipRotateMasterKey --kmipServerName 10.0.2.2 \
    --kmipPort 5696 --kmipServerCAFile /vagrant/ca.pem \
    --kmipClientCertificateFile /vagrant/client.pem > ~/mongodb_rotate.log 2>&1 &

# Restart mongodb assuming kmip master key was rotated..."

mongod --dbpath /tmp/mongodata --enableEncryption --kmipServerName 10.0.2.2 \
    --kmipPort 5696 --kmipServerCAFile /vagrant/ca.pem \
    --kmipClientCertificateFile /vagrant/client.pem > ~/mongodb_post_rotate.log 2>&1 &

