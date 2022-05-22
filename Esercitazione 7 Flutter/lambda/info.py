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
    xpath_exp = './/ClassResult'
    xpath_query = root.findall(xpath_exp, _ns)
    
    result_classes = {}
            
    for x in xpath_query:
        id = x.find('.//Class/Id', _ns)
        name = x.find('.//Class/Name', _ns)
        length = x.find('.//Course/Length', _ns)
        climb = x.find('.//Course/Climb', _ns)
        
        result_classes[id.text] = {
            "id"     : id.text,
            "name"   : name.text,
            "length" : length.text,
            "climb"  : climb.text,
            }
            
    return {
        'statusCode': 200,
        'body': json.dumps(result_classes)
    }
