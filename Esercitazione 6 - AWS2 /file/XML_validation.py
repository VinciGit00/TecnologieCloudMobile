import json
from lxml import etree
import boto3

BUCKET_S3 = 'bucketgare'
s3 = boto3.resource('s3')

def lambda_handler(event, context):
    try:
   
        parser = etree.XMLParser(dtd_validation=True)
        
        schemaname = "xmlschema.xsd"
        schemafile = s3.Object(BUCKET_S3, schemaname)
        xmlstrschema = schemafile.get()['Body'].read()
        
        filename = "20222.xml"
        file =  s3.Object(BUCKET_S3, filename)
        xmlstrfile= file.get()['Body'].read()
        
        schema_root = etree.XML(xmlstrschema)
    
        schema = etree.XMLSchema(schema_root)
        
        parser = etree.XMLParser(schema = schema)
      
        root = etree.fromstring(xmlstrfile, parser)
        print(root)
    
        return {
            'statusCode': 200,
            'body': json.dumps('Codice ben formato')
        }
    except lxml.etree.XMLSyntaxError:
        return {
            'statusCode': 404,
            'body': json.dumps('Errore di sintassi')
        }
    except lxml.etree.DocumentInvalid:
        return {
            'statusCode': 404,
            'body': json.dumps('Documento invalido')
        }
        
