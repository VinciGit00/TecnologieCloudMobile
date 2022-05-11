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
    
    try: 
        return {
        'statusCode': 200,
        'result': get_races(),
    }
    except Exception as e:
        return {
            'statusCode': 404,
            'body': json.dumps("ERROR on fetching data")
        }
  
 