import json
import uuid

GET_RAW_PATH = "/getPerson"
CREATE_RAW_PATH = "/createPerson"

def lambda_handler(event, context):
    print(event)
    print('Received getPerson request')
    personId = event['queryStringParameters']['personId']
    print("with param personId=" + personId)
    return { "firstName": "Daniel " + personId, "lastName": "G", "email": "myEmail@gmail.com" }
