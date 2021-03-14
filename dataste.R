rm(list=ls())
# load library
library(httr)
library(jsonlite)
library(lubridate)
library(tidyverse)
library(plyr)

date_to_download <- as.character(Sys.Date() - 4 ) 
date_to_download

client_id <- "22C5KN"
secret    <- "04b4f34b9be4ec35bc582cb158341749"
outpath   <- "path"



#dir.create(file.path(outpath, "plot"))
#dir.create(file.path(outpath, "data"))

fbr <- oauth_app('flyinyou@gmail.com',client_id, secret)
accessTokenURL <- 'https://api.fitbit.com/oauth2/token'
authorizeURL   <- 'https://www.fitbit.com/oauth2/authorize'




fitbit <- oauth_endpoint(authorize = authorizeURL, access = accessTokenURL)


token <-  oauth2.0_token(fitbit,fbr, scope = c("activity", "heartrate", "sleep"), use_basic_auth = TRUE, cache=FALSE)
#tokens = readRDS('token/tokens.rds')
#token = tokens[[1]];

conf <- config(token = token)





resp <- GET(paste0(
  "https://api.fitbit.com/1/user/-/activities/heart/date/",
  date_to_download,
  "/1d/1sec/time/00:00/23:59.json"), 
  config=conf)

cont <- content(resp, "text")
data <- fromJSON(cont)

hr <- data$"activities-heart-intraday"$dataset
hr






auth.code = paste("22C5KN", "04b4f34b9be4ec35bc582cb158341749")
# get intreday heartrate

query.response <- GET("https://api.fitbit.com/1/user/22C5KN/activities/heart/date/today/1d.json", 
                     add_headers(Authorization = auth.code)
                     )
json.heartrate <- content(query.response, "parsed")

heartrate.dataset <- json.heartrate$`activities-heart-intraday`$dataset
heartrate.dataset

