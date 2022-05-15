import json

def lambda_handler(event, context):
    country = json.loads(event['body'])['country']
    message = 'I love {}'.format(country)
    
    return message
   
