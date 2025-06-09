# Eventvue Test Suite

This cloudformation stack "test_alarm.yml" is a simple CloudFormation template that creates a CloudWatch alarm for EventVue, with an EventBridge rule and Log Group. Because this can be used to verify that EventVue is running correctly, it is intended to be deployed with the original install and "test_alarm_flipper" to toggle the status of the CloudWatch alarm which will trigger the EventBridge rule.  Slack notifications will be sent by default when this rule is triggered.

Use 'deploy_stack' to deploy the test alarm and eventbridge rule.

Use 'delete_stack' to delete the test alarm and eventbridge rule.

Use 'test_alarm_flipper' to toggle the status of the CloudWatch alarm.

