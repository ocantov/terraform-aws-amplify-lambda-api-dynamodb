import json
import boto3
from datetime import datetime
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('DYNAMODB_TABLE_NAME', 'DefaultTableName')

def lambda_handler(event, context):
    headers = event.get('headers', {})
    source_ip = event.get('requestContext', {}).get('identity', {}).get('sourceIp', 'Unknown')
    user_agent = headers.get('User-Agent', 'Unknown')
    browserInfo = headers.get('browserInfo', "Unknown")

    # Save to DynamoDB
    table = dynamodb.Table(table_name)
    response = table.put_item(
        Item={
        'id': str(datetime.utcnow()),
        'source_ip': source_ip,
        'user_agent': user_agent,
        'headers': headers,
        'browser_info': browserInfo
    })
    return {
        'statusCode': 200,
        'body': json.dumps('Data collected successfully!')
    }
