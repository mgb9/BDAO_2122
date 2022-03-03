# The folowing code is used to help search tweets with keyword

# The following codes for connecting to Twitter API to get full conversation are adapted from the sample codes given by Twitterdev through GitHub repository: https://github.com/twitterdev/Twitter-API-v2-sample-code/tree/main/Recent-Search

import requests
import os
import json


# Run the belowing commented code the first time
os.environ['TOKEN'] = 'PUT YOUR BEARER TOKEN HERE'

bearer_token = os.environ.get("TOKEN")


def bearer_oauth(r):
    """
    Method required by bearer token authentication.
    """

    r.headers["Authorization"] = f"Bearer {bearer_token}"
    r.headers["User-Agent"] = "v2UserTweetsPython"
    return r


def create_url(keyword, start_time, end_time, max_results): # If you are retrieving recent tweets, remove "start_date" and "end_date" 
    
    search_url = "https://api.twitter.com/2/tweets/search/recent" # collect recent tweets (last 7 days)

    # For understanding of the fields available, please check: https://developer.twitter.com/en/docs/twitter-api/fields
    query_params = {'start_time':start_time,
                    'end_time': end_time,
                    'query': keyword,
                    'max_results': max_results,
                    'expansions': 'author_id,in_reply_to_user_id,geo.place_id',
                    'tweet.fields': 'id,text,author_id,in_reply_to_user_id,geo,conversation_id,created_at,lang,public_metrics,referenced_tweets,reply_settings,source',
                    'user.fields': 'id,name,username,created_at,description,public_metrics,verified',
                    'place.fields': 'full_name,id,country,country_code,geo,name,place_type',
                    'next_token': {}}
    return (search_url, query_params)


def connect_to_endpoint(url,params, next_token = None):
    params['next_token'] = next_token   #params object received from create_url function
    response = requests.request("GET", url, auth=bearer_oauth, params = params)
    print("Endpoint Response Code: " + str(response.status_code))
    if response.status_code != 200:
        raise Exception(response.status_code, response.text)
    return response.json()

# you don't need to define the time, if you only can search for recent tweets
max_results = 10
keyword = 'specialty coffee'
# here is the official documentation to help you understand how to build query with correct operators: https://developer.twitter.com/en/docs/twitter-api/tweets/search/integrate/build-a-query

start_time = '2022-01-01T00:00:00.000Z'
end_time = '2022-01-08T00:00:00.000Z'
# Remember with standard account, you can only retrieve recent 7-day tweets with search_tweet endpoint, so when you are setting the timeframe the earliest date you can set is 7 day before your current date
url = create_url(keyword, start_time, end_time, max_results)
json_response = connect_to_endpoint(url[0], url[1])

print(json.dumps(json_response, indent=4, sort_keys=True))



# If you want to transform the json data into csv, here is the instruction

# First, we build a function to append data from json to csv
# this code is adapted from Towardsdatascience blog: https://towardsdatascience.com/an-extensive-guide-to-collecting-tweets-from-twitter-api-v2-for-academic-research-using-python-3-518fcb71df2a

def append_to_csv(json_response, fileName):
    

    #A counter variable
    counter = 0

    #Open OR create the target CSV file
    csvFile = open(fileName, "a", newline="", encoding='utf-8')
    csvWriter = csv.writer(csvFile)

    #Create headers for the data
    csvWriter.writerow(['author id', 'created_at', 'id','conversation_id', 'like_count', 'quote_count', 'reply_count','retweet_count','source','tweet'])
    # This only need to run at the first time. If you want to append more tweets to the same csv file, you need to comment this line of code to avoid the header being written again.

    #Loop through each tweet
    for tweet in json_response['data']:
        
        # We will create a variable for each since some of the keys might not exist for some tweets
        # You can change the variables based on what you want. Check the available variable from here: https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/tweet
   

        # 1. Author ID
        author_id = tweet['author_id']

        # 2. Time created
        created_at = dateutil.parser.parse(tweet['created_at'])
        
        # 3. Tweet ID
        tweet_id = tweet['id']

        # 4. Conversation ID
        conversation_id = tweet['conversation_id']

        # 5. Tweet metrics
        retweet_count = tweet['public_metrics']['retweet_count']
        reply_count = tweet['public_metrics']['reply_count']
        like_count = tweet['public_metrics']['like_count']
        quote_count = tweet['public_metrics']['quote_count']

        # 6. source
        source = tweet['source']

        # 7. Tweet text
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

# run the function with the json response and set up the file name

append_to_csv(json_response, 'tweets_coffee.csv')