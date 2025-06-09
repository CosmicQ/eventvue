import json
import os
import urllib.request

def lambda_handler(event, context):
    slack_webhook_url = os.environ.get('SLACK_WEBHOOK_URL')

    if not slack_webhook_url:
        print("Error: SLACK_WEBHOOK_URL environment variable is not set.")
        return {
            'statusCode': 500,
            'body': json.dumps('Slack webhook URL not configured.')
        }

    # Customize your message here
    message = {
        "text": "Hello from your Lambda function!",
        "attachments": [
            {
                "color": "#36a64f",
                "pretext": "Optional: Add some context here",
                "title": "Lambda Notification",
                "text": "This is a detailed message from your Lambda.",
                "fields": [
                    {
                        "title": "Field 1",
                        "value": "Value 1",
                        "short": False
                    },
                    {
                        "title": "Field 2",
                        "value": "Value 2",
                        "short": True
                    }
                ],
                "footer": "Lambda Bot",
                "ts": 1678880000 # Unix timestamp (optional)
            }
        ]
    }

    # Convert the message to a JSON string
    slack_message_json = json.dumps(message).encode('utf-8')

    # Create the HTTP request
    req = urllib.request.Request(
        slack_webhook_url,
        data=slack_message_json,
        headers={'Content-Type': 'application/json'}
    )

    try:
        # Send the request
        response = urllib.request.urlopen(req)
        response_body = response.read().decode('utf-8')
        print(f"Slack API response: {response_body}")
        return {
            'statusCode': 200,
            'body': json.dumps('Message sent to Slack successfully!')
        }
    except Exception as e:
        print(f"Error sending message to Slack: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps(f'Error sending message to Slack: {e}')
        }