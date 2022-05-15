import json
import urllib.parse
import boto3
import xmltodict

print('Loading function')

s3 = boto3.client('s3')

def lambda_handler(event, context):

    bucket = "xmlresultmarco"
    filename = "example" + ".json"
    
    o = xmltodict.parse(event["body"])

    byte = bytes(json.dumps(o), encoding='utf8')

    s3.put_object(Bucket = bucket, Key = filename, Body = byte)

    return "caricamento completato"
        

