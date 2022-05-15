import json
#This function understand if a user is allowed or not to insert 

def lambda_handler(event, context):
    
    #We gonna log the event
    #1 - Log the event
    print('*********** The event is: ***************')
    print(event)
    
    #2 - See if the person's token is valid
    if event['authorizationToken'] == 'abc123':
        auth = 'Allow'
    else:
        auth = 'Deny'
    
    #Construction of the response
    #3 - Construct and return the response
    # You need to change the id account and id of the lambda function
    authResponse = { "principalId": "abc123", "policyDocument": { "Version": "2012-10-17", "Statement": [{"Action": "execute-api:Invoke", "Resource": ["arn:aws:execute-api:us-east-1:807692992940:y3od21zbh9/*/*"], "Effect": auth}] }}
    return authResponse
