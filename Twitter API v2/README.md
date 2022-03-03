# This folder is providing you guidance on how to retrieve Twitter data through Twitter API v2. 

Twitter API v2 is the newest version released recently and provide some new and advancced features. For example, we will be able to retrieve replies of the tweets and access more fields and metrics via Twitter API v2.

Here is the table which maps the Twitter API v2 endpoints to the corresponding standard v1.1, premium v1.1, and enterprise endpoints: https://developer.twitter.com/en/docs/twitter-api/migrate/twitter-api-endpoint-map

To understand what data objects are available for you to request, please check the Twitter API v2 data dictionary: https://developer.twitter.com/en/docs/twitter-api/data-dictionary/introduction. Currently, there are 7 ojects available across the Twitter API endpoint, namely Tweets, Users, Spaces, Lists, Media, Polls, Places. There is also expanded objects which you can request using the expansions query parameter. Each GET endpoint will have a top-level resource and object, such as Tweets in recent search and filtered stream, and users in users lookup. Within each data object, there are available fileds to request through end point. To see what fields are available, please check: https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/.

In this tutorial, you will learn how to retrieve tweets posted by specified users using "User Tweet timeline" endpoint (https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/introduction), get tweets based on keywords using "Search Tweets" endpoint (https://developer.twitter.com/en/docs/twitter-api/tweets/search/introduction) and get user (Twitter account) information using "Users lookup" endpoint (https://developer.twitter.com/en/docs/twitter-api/users/lookup/introduction).

Before accessing Twitter API, you need to:

1) sign up for a developer account using this link (https://developer.twitter.com/en/portal/petition/essential/basic-info). This will direct you to sign in to Twitter (if you don't have a Twitter account, you need to register one with an email). 
2) And then you need to apply for a developer account by providing some information about your research or plan of using API through this link:https://developer.twitter.com/en/apply-for-access.
3) Once you have access to developer account, you need to sign in to the developer portal dashboard (https://developer.twitter.com/en/portal/dashboard) and create a new project with name, description and your goal.After the project is created, you need to create an app added to the project in order to get your access keys and tokens (this will be used to access the API)
4) Once you created your app, you will see your keys and tokens. Please save your API keys and bearer tokens in a save place (if you don't save it, you need to regenerate it later because it only show you once), and we are going to use the bearer token to make request to the Twitter API.
5) In the script, you can see there is one line "os.environ['TOKEN'] = 'PUT YOUR BEARER TOKEN HERE'. What you need to do is to put your bearer token inside the quotation mark.

If you have gone through all the steps above, congratulation! Now you are able to make your first request.

Here are six script provided to you. 
First, you can search tweets with keywords using the script called "Search_tweets.py"; second, you can get replies of sigle tweet or multiple tweets with the scripts "Get_replies_of_single_tweet.py" and "Get_replies_of_multiple_tweets.py"; third, you can get twitter account info with the script "Get_user.py"; lastly you can get the tweets/retweets/replies posted by one specific user with the scripts "User_timeline_simple.py" and "User_timeline_large.py".

I have put detailed comments in the script, and you need to put your bearer token as we mentioned above and you might need to change some of the variables based on the instruction given. Please check the script carefully before you run the script.

There are multiple ways to run the script once you make sure you have made the changes to the script.

Option 1: open "command prompt" or "anaconda prompt" in your machine. And change the working directory (cd) to the folder where you put your script. Then input "python script_name.py (put the name of the script that you want to run)". For example, python Get_user.py.

Option 2: open the script with Python IDE, such as PyCharm, Spyder. And make changes to the script and click run.

Option 3: copy the script to Jupyter notebook and run the script as you usually do.

If you still have no ideas about the script, please reach out to me: liping.zheng.1@warwick.ac,uk. And I will explain to you.

# Hope you enjoy this project!
