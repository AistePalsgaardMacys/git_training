#Example requesting the GET API

install.packages("httr2")
library(httr2)
req<-request("https://planets-by-api-ninjas.p.rapidapi.com/") %>%
  req_url_path("v1/planets") %>%
  req_url_query(name="Venus") %>%
  req_headers('X-RapidAPI-Key'='fed7ee78f4msh352406e3938e0a8p1b1499jsn11d70edd786d',
              'X-RapidAPI-Host'='planets-by-api-ninjas.p.rapidapi.com')

# Sending the request above
req_s<- req %>%
  req_perform()

# interpreting the response as json file

req_s %>%
  resp_body_json()

