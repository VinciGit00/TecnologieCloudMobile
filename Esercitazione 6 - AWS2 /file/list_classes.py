import json
import xml.etree.ElementTree as ET
import boto3

BUCKET_S3 = 'bucketgare'

def lambda_handler(event, context):

    try:
        s3 = boto3.resource('s3')
        raceid = event['queryStringParameters']['id']  
        bucket_name = BUCKET_S3
        object_name = str(raceid) + '.xml'
        obj = s3.Object(bucket_name, object_name)
        xmlstr = obj.get()['Body'].read()

    except s3.meta.client.exceptions.NoSuchKey:
        return {
            'statusCode': 404,
            'body': json.dumps("ERROR: Race ID not found")
        }
    except KeyError:
        return {
            'statusCode': 400,
            'body': json.dumps("ERROR: id parameter not specified")
        }
    
    # parsing
    root = ET.fromstring(xmlstr)
    _ns = {'':'http://www.orienteering.org/datastandard/3.0'}
    class_names_elements = root.findall('./ClassResult/Class/Name', _ns)
    classes = [x.text for x in class_names_elements]

    return {
        'statusCode': 200,
        'body': json.dumps(classes)
    }