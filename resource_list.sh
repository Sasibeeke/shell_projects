#!/bin/bash
########################
# Author : Sasiram Beeke
# Date : 18-08-2024
# This script will report the AWS resource usage with region
# Script to automate the process of listing all the resources in an AWS account
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS


# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
# Usage: ./resource_list.sh  <aws_region> <aws_service>
# Example: ./resource_list.sh us-east-1 ec2
########################

#check if the require no of arguments are passed or not ?
if [ $# -ne 2 ]
then
    echo "Usage: ./resource_list.sh  <aws_region> <aws_service>"
    echo "Example: ./resource_list.sh us-east-1 ec2"
exit 1
fi

if ! command -v aws &> /dev/null 
then
    echo "aws is not installed"
    exit 1
fi


if [ ! -d ~/.aws ]
then
    echo "Aws is not Configured"
    exit 1
fi



aws_region=$1
aws_service=$(echo "$2" | awk '{print tolower($0)}')
#echo "EC2" | awk '{print tolower($0)}'

echo "aws region is $1"
echo "aws service is $aws_service $2"

case $aws_service in 
ec2)
echo "Listing EC2 Instances in $aws_region"
aws ec2 describe-instances --region "$aws_region"
;;
s3)
echo "Listing s3 Instances in $aws_region"
aws s3api list-buckets --region "$aws_region"
;;
 rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region "$aws_region"
        ;;
cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region "$aws_region"
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region "$aws_region"
        ;;        

    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region "$aws_region"
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region "$aws_region"
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region "$aws_region"
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region "$aws_region"
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region "$aws_region"
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region "$aws_region"
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region "$aws_region"
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region "$aws_region"
        ;;        
iam)
echo "Listing IAM Users in $aws_region"
aws iam list-users --region "$aws_region"
;;
roles)
echo "Listing of Iam roles in $aws_region"
aws iam list-roles --region "$aws_region"
;;

*)
echo "Invalid service. Please enter a valid service."
exit 1
;;
esac







