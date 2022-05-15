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
            id = x.find('.//Person/Id',_ns)
            family = x.find('.//Person/Name/Family',_ns)
            given = x.find('.//Person/Name/Given',_ns)
            bib = x.find('.//Result/BibNumber',_ns)
            category = root.find('.//Person[Id="' + id.text + '"]/../../Class/Name', _ns)
            status = x.find('.//Result/Status',_ns)
            nat = x.find('.//Organisation/Country',_ns)
            score = x.find('.//Result/Score',_ns)
            time = x.find('.//Result/Time',_ns)
            position = x.find('.//Result/Position',_ns)
            names.append(family.text + ' ' + given.text)
            print(id.text + ' ' + family.text, ' ', given.text, ' ' + bib.text, ' ' + category.text, ' ' + status.text + ' ' + nat.text + ' ' + score.text + ' ' + time.text + ' ' + position.text)
            
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
        
    
    
