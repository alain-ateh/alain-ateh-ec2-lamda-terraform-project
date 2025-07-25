import boto3
import os
import logging
import json
from datetime import datetime

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    ec2_client = boto3.client('ec2')
    s3_client = boto3.client('s3')
    dynamodb = boto3.resource('dynamodb')
    
    instance_id = os.environ['INSTANCE_ID']
    bucket_name = os.environ['S3_BUCKET']
    table_name = os.environ['DYNAMODB_TABLE']
    table = dynamodb.Table(table_name)
    
    try:
        # Get EC2 instance status
        response = ec2_client.describe_instances(InstanceIds=[instance_id])
        status = response['Reservations'][0]['Instances'][0]['State']['Name']
        timestamp = datetime.utcnow().isoformat()
        
        # Log to CloudWatch
        logger.info(f"EC2 Instance {instance_id} is in state: {status}")
        
        # Write log to S3
        log_data = {
            'InstanceId': instance_id,
            'Status': status,
            'Timestamp': timestamp
        }
        s3_key = f"{context.function_name}/logs/{timestamp}.json"
        s3_client.put_object(
            Bucket=bucket_name,
            Key=s3_key,
            Body=json.dumps(log_data)
        )
        logger.info(f"Wrote log to s3://{bucket_name}/{s3_key}")
        
        # Write to DynamoDB
        table.put_item(
            Item={
                'InstanceId': instance_id,
                'Timestamp': timestamp,
                'Status': status
            }
        )
        logger.info(f"Wrote status to DynamoDB table {table_name}")
        
        return {
            'statusCode': 200,
            'body': f"EC2 Instance {instance_id} is {status}"
        }
    
    except Exception as e:
        logger.error(f"Error processing instance {instance_id}: {str(e)}")
        return {
            'statusCode': 500,
            'body': f"Error: {str(e)}"
        }