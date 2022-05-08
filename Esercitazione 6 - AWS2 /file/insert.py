import json
import boto3

DEFAULT_BUCKET = 'bucketgare'
s3 = boto3.resource('s3')

def lambda_handler(event, context):
   
    try:
        xmlstring = event['body']
        object_name = event['headers']['race_id'] + '.xml'
    
        put_to_bucket(object_name=object_name, content=xmlstring)
    
        res = {'statusCode': 200, 'body': 'File updloaded.'}
    except Exception as e:
        raise e
        res = {'body': 'errore durante il caricamento dei file'}

    return res


def put_to_bucket(bucket_name=DEFAULT_BUCKET, object_name = "" , content=None):
   
    obj = s3.Object(bucket_name, object_name)
    obj.put(Body=content)
