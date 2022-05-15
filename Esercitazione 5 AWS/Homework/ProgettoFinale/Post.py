import json
import urllib.parse
import boto3

print('Loading function')

s3 = boto3.client('s3')

def lambda_handler(event, context):
    
    bucket = "xmlresultmarco"
    filename = "test" + ".xml"
    #encoded = bytes(base64.encodebytes(event.toString()))
    byte = bytes(str(event), encoding='utf8')
    
    s3.put_object(Bucket = bucket, Key = filename, Body = byte)
   
    return "caricamento completato"
