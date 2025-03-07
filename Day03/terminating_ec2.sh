#!/bin/bash

# Ask for the EC2 instance ID
read -p "Enter the EC2 Instance ID to terminate: " INSTANCE_ID

# Confirm before terminating
read -p "Are you sure you want to terminate instance $INSTANCE_ID? (yes/no): " CONFIRM

if [[ "$CONFIRM" == "yes" ]]; then
    echo "Terminating instance $INSTANCE_ID..."
    
    # Terminate the instance
    aws ec2 terminate-instances --instance-ids $INSTANCE_ID
    
    echo "Termination request sent. Use 'aws ec2 describe-instances' to check status."
else
    echo "Termination cancelled."
fi

