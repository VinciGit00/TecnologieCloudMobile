import json
import urllib.parse
import boto3
import xmltodict

print('Loading function')

s3 = boto3.client('s3')

def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))

    # Get the object from the event and show its content type
    #Name of the bucket
    bucket = 'xmlresultmarco'
    #Name of the file
    key = 'Orienteering.xml'
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        print("CONTENT TYPE: " + response['ContentType'])
        o = xmltodict.parse(response['Body'].read().decode('utf-8'))
        return json.dumps(o)
        
    except Exception as e:
        print(e)
        print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
        raise e
