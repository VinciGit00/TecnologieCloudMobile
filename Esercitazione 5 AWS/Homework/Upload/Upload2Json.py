import json
import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket = 'xmlresultmarco'
    
    fileName = 'Prova'+'.json'
    
    uploadByteStream = bytes(json.dumps(event).encode('UTF-8'))
    
    s3.put_object(Bucket = bucket, Key = fileName, Body = uploadByteStream )
    
    return "Upload completato"
