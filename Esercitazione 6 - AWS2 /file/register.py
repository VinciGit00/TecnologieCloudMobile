import boto3
import uuid
import json

# Table name 
table_name = 'InfoRace'

#dynamodb client 
dynamodb = boto3.resource('dynamodb')
# Nome Tabella
dbtable = dynamodb.Table('InfoRace')

print('Loading function')

def lambda_handler(event, context):
    
    #Generazione dei codici per l'utente
    race_id = uuid.uuid4()
    token = uuid.uuid4()
    
    nome_gara = event['headers']['race_name']
    data_gara = event['headers']['race_date']
    email = event['headers']['email']

    variabile = event['queryStringParameters']
    
    #item of the race
    iteminsert = {
        "race_id": str(race_id),
        "token": str(token),
        "race_name": str(nome_gara),
        "race_date": str(data_gara),
        "email": str(email),
    }
    
    variabile = event['queryStringParameters']
    
    chiavi = variabile.keys()
    for x in chiavi:
       iteminsert[x] = variabile[x]  
       
    try:
        dbtable.put_item(Item =iteminsert)
       
        return {
           "codice": 200,
           "token": str(token), 
           "race_id": str(race_id)
        }
       
    except Exception as e:
        print(e)
        raise e


