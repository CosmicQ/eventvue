import boto3
import time

dynamodb = boto3.resource('dynamodb')
lock_table = dynamodb.Table('LockTable')

def lambda_handler(event, context):
    event_id = event['event
