## Script for interfacing with Twitter, via the OPA Analytics app (as of 12/18/2014).

## Install needed, or at least relevant packages; twitteR installed directly from the twitteR admin's github repo.
install.packages("httr")
install.packages("jsonlite")
install.packages("RCurl")
install.packages("ROAuth")
install.packages("devtools")
install_github("twitteR", username="geoffjentry")

## Load packages
library(httr)
library(jsonlite)
library(RCurl)
library(ROAuth)
library(devtools)
library(twitteR)

## Authenticate the app (include quotations)
api_key = "[insert here]"
api_secret = "[insert here]"
access_token = "[insert here]"
access_secret = "[insert here]"
setup_twitter_oauth(api_key,api_secret,access_token,access_secret)

## Hypothetical tweet search, searching for the text (case-sensitive) "Saints", within 20 miles of a NOLA geo-coordinate:
Tweetsaints<-searchTwitter('Saints',geocode='30.0,-90.0,20mi',n=5000,retryOnRateLimit=1)

## Convert and view as data frame
Saintsdf<-twListToDF(Tweetsaints)
View(Saintsdf)
