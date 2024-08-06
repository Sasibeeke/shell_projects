#!/bin/bash

##########################

# Author : Sasiram Beeke
# Date : 06-08-2024
# Version : v1
# This script will report the AWS resource usage 
##########################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# List s3 Buckets
echo "Print all s3 buckets" > resource_tracker
aws s3 ls >> resource_tracker

# List  EC2 instances
echo "Print all Ec2 Instances" >> resource_tracker
aws ec2 describe-instances >> resource_tracker

# List  Lambda Functions
echo "Print all Lambda Functions" >> resource_tracker
aws lambda list-functions >> resource_tracker

# List Iam Users
echo "Print all Iam Users" >> resource_tracker
aws iam list-users >> resource_tracker

