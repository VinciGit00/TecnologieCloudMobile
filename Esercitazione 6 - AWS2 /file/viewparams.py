import json

def lambda_handler(event, context):
    
    variabile = event['queryStringParameters']
    chiavi = variabile.keys()
    
    c = {}
    
    for elements in chiavi:
        c[elements] = variabile[elements] 
        
    return c
