import json
import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket = 'xmlresultmarco'
    transactionToUpload = {}
    transactionToUpload['transactionId'] = '12345'
    
    fileName = 'Prova'+'.json'
    
    uploadByteStream = bytes(json.dumps(transactionToUpload).encode('UTF-8'))
    
    s3.put_object(Bucket = bucket, Key = fileName, Body = uploadByteStream )
    
    print("Upload fatto correttamente")
