#import requests
import json
import boto3

def lambda_handler(event, context):
    # Get the service resource.
    dynamodb = boto3.resource('dynamodb')

    # Instantiate a table resource object without actually.
    table = dynamodb.Table('myDB')

    # Update DB
    table.update_item(
    Key={
        'id': 'id',
    },
    UpdateExpression='SET pageViews = pageViews + :incr',
    ExpressionAttributeValues={
       ':incr': 1
    }
)
    #Get info from DB
    response = table.get_item(
    Key={
        'id': 'id',
    }
)
    test = response['Item']['pageViews']
    pageCounter = "<html><body><h1> Page view is:" + str(test)  +"</h1></body></html>"
    # Print out some data about the table.
    # This will cause a request to be made to DynamoDB and its attribute
    # values will be set based on the response.
    print(response)
    return {
        "statusCode": 200,
        "body": json.dumps(pageCounter),
        "headers": {
        'Content-Type': 'text/html',
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "OPTIONS,POST,GET,PUT",
        
        }
    }