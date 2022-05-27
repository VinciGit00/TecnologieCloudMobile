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
        ClassName = event['queryStringParameters']['class']
        
        obj = s3.Object(bucket, key)
        response = obj.get()['Body'].read()
        
        root = ET.fromstring(response)
        _ns = {'':'http://www.orienteering.org/datastandard/3.0'}
        xpath_exp = './/ClassStart/Class[Name="' + ClassName + '"]/../PersonStart'
        xpath_query = root.findall(xpath_exp, _ns)

        grid = {}

        for x in xpath_query:
            family = x.find('.//Person/Name/Family',_ns)
            given = x.find('.//Person/Name/Given',_ns)
            start = x.find('.//Start/StartTime',_ns)
            org = x.find('.//Organisation/Name',_ns)
            country = x.find('.//Organisation/Country', _ns)
            bib = x.find('.//Start/BibNumber',_ns)
            print( family.text, given.text, start.text, org.text, country.text)

            grid[family.text + ' ' + given.text + ' ' +  start.text] = {
                            "name" : family.text + ' ' + given.text,
                            "start" : start.text,
                            "org" : org.text,
                            "country" : country.text,
                            "bib" : bib.text              
                                }
                
        #return response
        
        return {
            'statusCode': 200,
            'body': json.dumps(grid)
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
        
    
    
