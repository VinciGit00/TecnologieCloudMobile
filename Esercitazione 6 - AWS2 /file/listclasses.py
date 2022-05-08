import json
import xml.etree.ElementTree as ET
import boto3
import base64

s3 = boto3.resource('s3')
DEFAULT_BUCKET = "bucketgare"

def lambda_handler(event, context):

    #object_name = event['queryStringParameters']['id']
    #object_name = object_name +'.xml'
    object_name = "1859bf00-4cc7-4325-a347-174decbf284b.xml"
    obj = s3.Object(DEFAULT_BUCKET, object_name)
    #return obj
    xmlstr = obj.get()['Body'].read()
    return {
            'headers': { "Content-Type": "text/xml" },
            'statusCode': 200,
            'body': base64.b64encode(xmlstr).decode('utf-8'),
            'isBase64Encoded': True
        }
   