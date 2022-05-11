
import json
import xml.etree.ElementTree as ET
import boto3
import botocore


BUCKET_NAME = "bucketgare"
s3 = boto3.resource('s3')

def lambda_handler(event, context):
    try:
        classifica = []
        
        ##
        ### Recupero Headers
        ##
        
        # id della gara, corrispondente al nome del file xml nel bucket
        race_id_param = event["queryStringParameters"]["id"] 
        # categoria di cui voglio la  classifica
        categoria_param = event["queryStringParameters"]["class"]
        
        race_id_param = race_id_param + ".xml"
        
        
        ##
        ### Recupero File XML 
        ##

        # Creo oggetto bucket prendendo il file indicato nella header
        s3obj = s3.Object(BUCKET_NAME, race_id_param)
        
        # Leggo string dell' xml dal bucket
        xmlstring = s3obj.get()['Body'].read().decode('ISO-8859-1')
        
        # Genero albero xml
        xml = ET.fromstring(xmlstring)
        
        
        ##
        ### Recupero elementi della cateogoria desiderata
        ##
        
        _ns = {
            "":'http://www.orienteering.org/datastandard/3.0'
        }
        
        # Id
        ids = xml.findall("./ClassResult/Class[Name ='" + categoria_param +  "']/../PersonResult/Person/Id", _ns)
       
        # Nome
        names = xml.findall("./ClassResult/Class[Name ='" + categoria_param +  "']/../PersonResult/Person/Name/Family", _ns)
        
        # Cognome
        surnames = xml.findall("./ClassResult/Class[Name ='" + categoria_param +  "']/../PersonResult/Person/Name/Given", _ns)
        
        # Time  Behind
        timeBehind = xml.findall("./ClassResult/Class[Name ='" + categoria_param +  "']/../PersonResult/Result/TimeBehind", _ns)
       
        # Time
        time = xml.findall("./ClassResult/Class[Name ='" + categoria_param +  "']/../PersonResult/Result/Time", _ns)
      
       
        for x in range(len(ids)):
            # per il primo giocatore mostro il time e non il timeBehind che tanto sarebbe sempre 0
            if x == 0:
                classifica.append({
                    "rank": x+1,
                    "id": ids[x].text,
                    "name" : names[x].text,
                    "surname" : surnames[x].text,
                    "time" : time[x].text
                })
                continue
            
            # In alcuni xml, timebehind non è disponibile, quindi controllo se ce l'ho a disposizione.
            if len(timeBehind) < len(ids):
                classifica.append({
                    "rank": x+1,
                    "id": ids[x].text,
                    "name" : names[x].text,
                    "surname" : surnames[x].text
                })
                
            else:
                classifica.append({
                    "rank": x+1,
                    "id": ids[x].text,
                    "name" : names[x].text,
                    "surname" : surnames[x].text,
                    "timeBehind" : timeBehind[x].text
                })

        return {
            'statusCode': 200,
            'body': json.dumps(classifica)
        }
        
        
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