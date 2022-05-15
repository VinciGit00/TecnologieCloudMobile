import json
import urllib.parse
import boto3
import xmltodict

print('Loading function')
s3 = boto3.client('s3')

def lambda_handler(event. context):
    o = xmltodict.parse(event["body"])
    return json.dumps(o)
