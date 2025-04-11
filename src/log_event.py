import boto3
import uuid
import json

dynamodb = boto3.resource('dynamodb')
log_table = dynamodb.Table('LogTable')

def lambda_handler(event, context):
    event_id = str(uuid.uuid4())
    account = event['account']
    alarm_name = event['alarm_name']
    timestamp = event['timestamp']
    message = event['message']

    log_table.put_item(
        Item={
            'event_id': event_id,
            'account': account,
            'alarm_name': alarm_name,
            'timestamp': timestamp,
            'message': message
        }
    )

    return {
        'event_id': event_id,
        'account': account,
        'alarm_name': alarm_name,
        'timeout_seconds': get_timeout_seconds(account, alarm_name)
    }

def get_timeout_seconds(account, alarm_name):
    config_table = dynamodb.Table('ConfigTable')
    response = config_table.get_item(
        Key={'accountid+alarm_name': f'{account}+{alarm_name}'}
    )
    item = response.get('Item', {})
    timeout = item.get('timeout', '15m')
    return int(timeout[:-1]) * 60  # Convert to seconds
