#!/bin/bash
echo 'Downloading awscli'
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

echo 'Symlinking aws'
sudo ln -s /usr/local/bin/aws2 /usr/local/bin/aws

echo 'We need to setup your AWS credentials'
aws configure

echo 'Downloading macOS bundle'
aws s3 cp s3://com.bstis.it.resources/macOS/macos.tar.gz macos.tar.gz
gunzip -c macos.tar.gz | tar xopf -
