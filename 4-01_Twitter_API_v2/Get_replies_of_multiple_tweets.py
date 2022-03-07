
# If you want to get replies of multiple tweets, see the instruction below

import requests
import os
import json
import pandas as pd
import csv
import dateutil.parser
import time

# Basically we got the conversation IDs of all the tweets through user timeline search and next we are creating a list which contains all the conversation IDs and this list will act as keyword list as params when connecting to the API endpoints
df = pd.read_excel("your_tweets_file") # put the name of the tweet file that you have retrieved
replies_list = df.conversation_id.tolist()
print(replies_list[0])

# Create all the conversion_ids as keywords and put into a list
keyword_list = []
for k in replies_list:
    a = "conversation_id:"+str(k)
    keyword_list.append(a)

print(keyword_list[0])


# The following codes for connecting to Twitter API to get full conversation are adapted from the sample codes given by Twitterdev through GitHub repository: https://github.com/twitterdev/Twitter-API-v2-sample-code/tree/main/Recent-Search


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


def create_url(keyword, start_date, end_date, max_results): # If you are retrieving recent tweets, remove "start_date" and "end_date"
    
    search_url = "https://api.twitter.com/2/tweets/search/recent" # collect recent tweets (last 7 days)

    # For understanding of the fields available, please check: https://developer.twitter.com/en/docs/twitter-api/fields
    query_params = {'query': keyword,
                    'start_time': start_date, 
                    'end_time': end_date,
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

# you don't need to define the time, if you only can search for recent tweets
start_time = "2021-01-01T00:00:00.000Z"
end_time = "2021-08-01T00:00:00.000Z"
max_results = 500

#Total number of tweets we collected from the loop
total_tweets = 0


# Create file, you need to put the file name here
csvFile = open("File_name.csv", "a", newline="", encoding='utf-8')
csvWriter = csv.writer(csvFile)

#Create headers for the data you want to save, in this example, we only want save these columns in our dataset
csvWriter.writerow(['author id', 'created_at', 'id','conversation_id', 'like_count', 'quote_count', 'reply_count','retweet_count','source','tweet'])
csvFile.close()

for i in range(0,len(keyword_list)): # create for loop for your conversation_ids
    # this code is adapted from Towardsdatascience blog: https://towardsdatascience.com/an-extensive-guide-to-collecting-tweets-from-twitter-api-v2-for-academic-research-using-python-3-518fcb71df2a

    # Inputs
    count = 0 # Counting tweets per time period
    max_count = 100 # Max tweets per time period, you can adjust it to higher number
    flag = True
    next_token = None
    
    # Check if flag is true
    while flag:
        # Check if max_count reached
        if count >= max_count:
            break
        print("-------------------")
        print("Token: ", next_token)
        url = create_url(keyword_list[i],start_time, end_time, max_results) # we create for loops to search every conversation ID and get the replies
        # If you are retrieving recent tweets, remove "start_time" and "end_time"
        json_response = connect_to_endpoint(url[0], url[1], next_token)
        result_count = json_response['meta']['result_count']

        if 'next_token' in json_response['meta']:
            # Save the token to use for next call
            next_token = json_response['meta']['next_token']
            print("Next Token: ", next_token)
            if result_count is not None and result_count > 0 and next_token is not None:
                print("conversation_id: ", keyword_list[i])
                append_to_csv(json_response, "File_name.csv")
                count += result_count
                total_tweets += result_count
                print("Total # of Tweets added: ", total_tweets)
                print("-------------------")
                time.sleep(5)                
        # If no next token exists
        else:
            if result_count is not None and result_count > 0:
                print("-------------------")
                print("conversation_id: ", keyword_list[i])
                append_to_csv(json_response, "File_name.csv")
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




