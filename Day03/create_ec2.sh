#!/bin/bash

# Variables - Update these before running
AMI_ID="ami-04b4f1a9cf54c11d0"    # Replace with your AMI ID
INSTANCE_TYPE="t2.micro"          # Change as per requirement
KEY_NAME="Dev"             # Replace with your Key Pair name
SECURITY_GROUP="sg-0c5be89f8bfeef510" # Replace with your Security Group ID
SUBNET_ID="subnet-05215908c1f678801"  # Replace with your Subnet ID
TAG_NAME="MyEC2Instance1"          # Name tag for your instance

echo "Launching EC2 instance..."

# Run the AWS CLI command to launch an EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 2 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP \
    --subnet-id $SUBNET_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
    --query "Instances[0].InstanceId" \
    --output text)

if [ -z "$INSTANCE_ID" ]; then
    echo "Failed to launch EC2 instance."
    exit 1
fi

echo "EC2 instance launched successfully! Instance ID: $INSTANCE_ID"

# Wait until instance is running
echo "Waiting for instance to be in 'running' state..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

echo "EC2 Instance is now running. Fetching public IP..."

# Get the public IP of the instance
PUBLIC_IP=$(aws ec2 describe-instances \
    --instance-ids $INSTANCE_ID \
    --query "Reservations[0].Instances[0].PublicIpAddress" \
    --output text)

echo "EC2 Instance is up and running!"
echo "Instance ID: $INSTANCE_ID"
echo "Public IP: $PUBLIC_IP"


