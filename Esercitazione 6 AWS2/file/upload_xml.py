import json
import boto3
from boto3.dynamodb.conditions import Key
import uuid

DEFAULT_BUCKET = 'bucketgare'
s3 = boto3.resource('s3')

#dynamodb client 
dynamodb = boto3.resource('dynamodb')
# Nome Tabella
table = dynamodb.Table('InfoRace')

def lambda_handler(event, context):
    
  
    try:
        response = table.query(KeyConditionExpression = Key('race_id').eq(event['headers']['race_id']))
    
        flag = 0 
        for item in response['Items']:
            if item['token'] == event['headers']['token']: 
                flag = 1
        
        if flag == 1:
            xmlstring = event['body']
            object_name = event['headers']['race_id'] + '.xml'
    
            put_to_bucket(object_name=object_name, content=xmlstring)
    
            res = {'statusCode': 200, 'body': 'File updloaded.'}
        else:
            res = {'statusCode': 400, 'body': 'File not updloaded, token not valid.'}
    except Exception as e:
        raise e
        res = {'body': 'errore durante il caricamento dei file'}

    return res


def put_to_bucket(bucket_name=DEFAULT_BUCKET, object_name = "" , content=None):
   
    obj = s3.Object(bucket_name, object_name)
    obj.put(Body=content)
