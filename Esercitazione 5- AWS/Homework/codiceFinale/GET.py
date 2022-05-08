import json
import boto3
import urllib.parse
import xml.etree.ElementTree as ET


print('Loading function')

s3 = boto3.client('s3')


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))

    # Get the object from the event and show its content type
    bucket = 'xmlresultmarco'
    key = 'example.json'
    
    response = s3.get_object(Bucket=bucket, Key=key)

    return response['Body'].read().decode('utf-8')
    r = response['Body'].read().decode('utf-8')
    

