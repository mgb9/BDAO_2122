
# The codes for connecting to Twitter API are adapted from the sample codes given by Twitterdev through GitHub repository: https://github.com/twitterdev/Twitter-API-v2-sample-code/tree/main/User-Tweet-Timeline
# This code is used to retrieve all the tweets published by a specific Twitter account. For more information, please check: https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/introduction

import requests
import os
import json
import pandas as pd
import csv
import dateutil.parser
import time

# Run the belowing commented code the first time you run this code
os.environ['TOKEN'] = 'PUT YOUR BEARER TOKEN HERE'

bearer_token = os.environ.get("TOKEN")


def bearer_oauth(r):
    """
    Method required by bearer token authentication.
    """

    r.headers["Authorization"] = f"Bearer {bearer_token}"
    r.headers["User-Agent"] = "v2UserTweetsPython"
    return r


def create_url(start_date, end_date, max_results): # If you are retrieving recent tweets, remove "start_date" and "end_date"
	# crete url and set up the query parameters
    user_id = 1545994664 # you can get the user_id through Get_user.py
   
    search_url = "https://api.twitter.com/2/users/{}/tweets?exclude=replies".format(user_id) 
    # I have exluded the replies. If you want to include the replies, then you need to remove "?exclude=replies" from the url

    #change params based on the endpoint you are using
    query_params = {'start_time': start_date,
                    'end_time': end_date,
                    'max_results': max_results,
                    'expansions': 'author_id,in_reply_to_user_id,geo.place_id',
                    'tweet.fields': 'id,text,author_id,in_reply_to_user_id,geo,conversation_id,created_at,lang,public_metrics,referenced_tweets,reply_settings,source',
                    'user.fields': 'id,name,username,created_at,description,public_metrics,verified',
                    'place.fields': 'full_name,id,country,country_code,geo,name,place_type',
                    'next_token': {}}
    return (search_url, query_params)


def connect_to_endpoint(url, params, next_token = None):
    params['next_token'] = next_token   #params object received from create_url function; next_token is the unique ID field for the next page of results
    response = requests.request("GET", url, auth=bearer_oauth, params = params)
    print("Endpoint Response Code: " + str(response.status_code))
    if response.status_code != 200:
        raise Exception(response.status_code, response.text)
    return response.json()


def append_to_csv(json_response, fileName):
	# this code is adapted from Towardsdatascience blog: https://towardsdatascience.com/an-extensive-guide-to-collecting-tweets-from-twitter-api-v2-for-academic-research-using-python-3-518fcb71df2a

    #A counter variable
    counter = 0

    #Open OR create the target CSV file
    csvFile = open(fileName, "a", newline="", encoding='utf-8')
    csvWriter = csv.writer(csvFile)

    #Loop through each tweet
    for tweet in json_response['data']:
        
        # We will create a variable for each since some of the keys might not exist for some tweets
        # You can change the variables based on what you want. Check the available variable from here: https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/tweet
   

        # 1. Author ID
        author_id = tweet['author_id']

        # 2. Time created
        created_at = dateutil.parser.parse(tweet['created_at'])
        
        # 4. Tweet ID
        tweet_id = tweet['id']

        # 5. Conversation ID
        conversation_id = tweet['conversation_id']

        # 6. Tweet metrics
        retweet_count = tweet['public_metrics']['retweet_count']
        reply_count = tweet['public_metrics']['reply_count']
        like_count = tweet['public_metrics']['like_count']
        quote_count = tweet['public_metrics']['quote_count']

        # 7. source
        source = tweet['source']

        # 8. Tweet text
        text = tweet['text']
        
        # Assemble all data in a list
        res = [author_id, created_at, tweet_id, conversation_id, like_count, quote_count, reply_count, retweet_count, source, text]
        
        # Append the result to the CSV file
        csvWriter.writerow(res)
        counter += 1

    # When done, close the CSV file
    csvFile.close()

    # Print the number of tweets for this iteration
    print("# of Tweets added from this response: ", counter)


# If you want to get tweets from multiple time period, here is the instruction to help you write a for loop to get the json reponse and at the time transform them to csv
# set up the timeframe, aiming to get data from Jan 2021 till July 2021

start_list =    ['2021-01-01T00:00:00.000Z',
                 '2021-02-01T00:00:00.000Z',
                 '2021-03-01T00:00:00.000Z',
                 '2021-04-01T00:00:00.000Z',
                 '2021-05-01T00:00:00.000Z',
                 '2021-06-01T00:00:00.000Z',
                 '2021-07-01T00:00:00.000Z',
                 ]

end_list =      ['2021-02-01T00:00:00.000Z',
                 '2021-03-01T00:00:00.000Z',
                 '2021-04-01T00:00:00.000Z',
                 '2021-05-01T00:00:00.000Z',
                 '2021-06-01T00:00:00.000Z',
                 '2021-07-01T00:00:00.000Z',
                 '2021-08-01T00:00:00.000Z',
                 ]


max_results = 100 #This defaults to 10 Tweets and has a maximum of 100. 
#Total number of tweets we collected from the loop
total_tweets = 0


# Create file, you need to put the file name here
csvFile = open("BMW_more_tweets.csv", "a", newline="", encoding='utf-8')
csvWriter = csv.writer(csvFile)

#Create headers for the data
csvWriter.writerow(['author id', 'created_at', 'id','conversation_id', 'like_count', 'quote_count', 'reply_count','retweet_count','source','tweet'])
csvFile.close()

# If you are only retrieving recent tweets, you don't need the for loop, just remove it. But you need some adjustment for the codes especially the function

for i in range(0,len(start_list)):
	# this code is adapted from Towardsdatascience blog: https://towardsdatascience.com/an-extensive-guide-to-collecting-tweets-from-twitter-api-v2-for-academic-research-using-python-3-518fcb71df2a

    # Inputs
    count = 0 # Counting tweets per time period
    max_count = 100 # Max tweets per time period
    flag = True
    next_token = None
    
    # Check if flag is true
    while flag:
        # Check if max_count reached
        if count >= max_count:
            break
        print("-------------------")
        print("Token: ", next_token)
        url = create_url(start_list[i],end_list[i], max_results)
        json_response = connect_to_endpoint(url[0], url[1], next_token)
        result_count = json_response['meta']['result_count']

        if 'next_token' in json_response['meta']:
            # Save the token to use for next call
            next_token = json_response['meta']['next_token']
            print("Next Token: ", next_token)
            if result_count is not None and result_count > 0 and next_token is not None:
                print("Start Date: ", start_list[i])
                append_to_csv(json_response, "BMW_more_tweets.csv") # you need to define the file name here
                count += result_count
                total_tweets += result_count
                print("Total # of Tweets added: ", total_tweets)
                print("-------------------")
                time.sleep(5)                
        # If no next token exists
        else:
            if result_count is not None and result_count > 0:
                print("-------------------")
                print("Start Date: ", start_list[i])
                append_to_csv(json_response, "BMW_more_tweets.csv") # you need to define the file name here
                count += result_count
                total_tweets += result_count
                print("Total # of Tweets added: ", total_tweets)
                print("-------------------")
                time.sleep(5)
            
            #Since this is the final request, turn flag to false to move to the next time period.
            flag = False
            next_token = None
        time.sleep(5)
print("Total number of results: ", total_tweets)
