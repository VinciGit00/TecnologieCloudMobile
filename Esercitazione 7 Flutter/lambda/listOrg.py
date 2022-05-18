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
        
        obj = s3.Object(bucket, key)
        response = obj.get()['Body'].read()
        
        root = ET.fromstring(response)
        _ns = {'':'http://www.orienteering.org/datastandard/3.0'}
        xpath_exp = './/PersonResult/Organisation'
        xpath_query = root.findall(xpath_exp, _ns)

        org = {}
        for x in xpath_query:
            id = x.find('.//Id',_ns)
            name = x.find('.//Name',_ns)
            Country = x.find('.//Country',_ns)
            
            org[id.text] = {
                            "id" : id.text,
                            "name" : name.text,
                            "country" : Country.text    
                                }
                            
        
        #return response
        
        return {
            'statusCode': 200,
            'body': json.dumps(org)
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
        
    
    
