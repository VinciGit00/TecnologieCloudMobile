import json
import boto3
import base64
import xml.etree.ElementTree as ET

s3 = boto3.resource('s3')

def lambda_handler(event, context):
    try:
        bucket = "bucketgare"
        key = event['queryStringParameters']['id']
        
        key = key+".xml"
        org = event['queryStringParameters']['organisation']
        
        obj = s3.Object(bucket, key)
        response = obj.get()['Body'].read()
        
        root = ET.fromstring(response)
        _ns = {'':'http://www.orienteering.org/datastandard/3.0'}
        xpath_exp = './/PersonResult/Organisation[Id="' + str(org) + '"]/../Person/Name'
        xpath_query = root.findall(xpath_exp, _ns)
    
        names = []
        for x in xpath_query:
            family = x.find('.//Family',_ns)
            given = x.find('.//Given',_ns)
            names.append(family.text + ' ' + given.text)
            print(family.text, ' ', given.text)
            
        names = list( dict.fromkeys(names)) #remove duplicates by turning into dic and back to list
        
        #return response
        
        return {
            'statusCode': 200,
            'body': json.dumps(names)
        }
    
    except s3.meta.client.exceptions.NoSuchKey:
        return {
            'statusCode': 404,
            'body': json.dumps("ERROR: Race ID not found.")
        }
    except KeyError:
        return {
            'statusCode': 400,
            'body': json.dumps("ERROR: id parameter not specified.")
        }
        
    
    
