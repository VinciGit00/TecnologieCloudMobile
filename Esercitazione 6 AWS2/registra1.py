import boto3
import uuid
import json

# Table name 
table_name = 'InfoRace'

#dynamodb client 
dynamodb_client = boto3.client('dynamodb') 

print('Loading function')

def lambda_handler(event, context):
    
    #Generazione dei codici per l'utente
    race_id = uuid.uuid4()
    token = uuid.uuid4()
    
    nome_gara = event['headers']['race_name']
    data_gara = event['headers']['race_date']
    email = event['headers']['email']

    #item of the race
    iteminsert = {
        "race_id": {
        "S": str(race_id)
        },
        "token": {
        "S": str(token)
        },
        "race_name": {
        "S": str(nome_gara),
        },
        "race_date": {
        "S": str(data_gara)
        },
        "email": {
        "S": str(email)
        }
    }
    
    try:
       dynamodb_client.put_item(TableName = table_name, Item = iteminsert)
       
       return {
           "codice": 200,
           "token": str(token), 
           "race_id": str(race_id)
       }
       
    except Exception as e:
        print(e)
        raise e


