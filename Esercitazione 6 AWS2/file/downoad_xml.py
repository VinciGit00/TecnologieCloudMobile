import json
import boto3
import base64

s3 = boto3.client('s3')

def lambda_handler(event, context):
    
    bucket = "bucketgare"
    key = event['queryStringParameters']['id']
    
    key = key + '.xml'
    
    try:
        response = s3.get_object(Bucket = bucket, Key = key)
        response = response['Body'].read()

    except s3.meta.client.exceptions.NoSuchKey:    
        return {
            'statusCode': 404,
            'body': json.dumps("Nessun parametro trovato")
        }
        
    except Exception as e:
        print(e)
        return {
            'statusCode': 404,
            'body': json.dumps(str(e))
        }
    
    return {
            'headers': { "Content-Type": "text/xml" },
            'statusCode': 200,
            'body': base64.b64encode(response).decode('utf-8'),
            'isBase64Encoded': True
        }