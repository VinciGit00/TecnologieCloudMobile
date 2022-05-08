import json
import boto3

def get_races():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('InfoRace')
    resp = table.scan()
    print(resp['Items'])
    resp = json.dumps(resp['Items'])
    return json.loads(resp.replace("\'", '"'))
    
def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'result': get_races(),
    }