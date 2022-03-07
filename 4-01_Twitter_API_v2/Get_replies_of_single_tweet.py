# First you need to know the conversation ID of the tweet from which you can want to search replies
# You can get the conversation_id through search_tweets or user_timeline
# And then the whole logic is similar to search_tweets because we are going to use conversation_id as query keyword

conversation_id = '1497939577687920642'

# The following codes for connecting to Twitter API to get full conversation are adapted from the sample codes given by Twitterdev through GitHub repository: https://github.com/twitterdev/Twitter-API-v2-sample-code/tree/main/Recent-Search

import requests
import os
import json


# Run the belowing commented code the first time
os.environ['TOKEN'] = ''

bearer_token = os.environ.get("TOKEN")


def bearer_oauth(r):
    """
    Method required by bearer token authentication.
    """

    r.headers["Authorization"] = f"Bearer {bearer_token}"
    r.headers["User-Agent"] = "v2UserTweetsPython"
    return r


def create_url(keyword, max_results): # If you are retrieving recent tweets, remove "start_date" and "end_date"
    
    search_url = "https://api.twitter.com/2/tweets/search/recent" # collect recent tweets (last 7 days)

    # For understanding of the fields available, please check: https://developer.twitter.com/en/docs/twitter-api/fields
    query_params = {'query': keyword,
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
keyword = 'conversation_id:1497939577687920642'

url = create_url(keyword, max_results)
json_response = connect_to_endpoint(url[0], url[1])

print(json.dumps(json_response, indent=4, sort_keys=True))