import json
import urllib.parse
import boto3

print('Loading function')

s3 = boto3.client('s3')

def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))
    #Link per fare la richiesta get: https://qpg95em9xh.execute-api.us-east-1.amazonaws.com/getXML
    # Get the object from the event and show its content type
    bucket = 'xmlresultmarco'
    key = 'Orienteering.xml'
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        print("CONTENT TYPE: " + response['ContentType'])
        return response['Body'].read().decode('utf-8')
        
    except Exception as e:
        print(e)
        print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
        raise e

