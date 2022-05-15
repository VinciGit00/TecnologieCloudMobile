import boto3

# Table name 
table_name = 'InfoRace'

#dynamodb client 
dynamodb_client = boto3.client('dynamodb') 

print('Loading function')

def lambda_handler(event, context):
    #item of the movie
    iteminsert = {
        "race_id": {
        "S": "marco"
        }
    }
    
    try:
       dynamodb_client.put_item(TableName = table_name, Item = iteminsert)
       
    except Exception as e:
        print(e)
        raise e


