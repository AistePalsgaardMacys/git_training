# API Exercises.
#Exercise 4.

req<- request("http://165.22.92.178:8080") %>%
  req_url_path("responses")%>%
  req_url_query(format = "html") %>%
  req_headers(authorization = "DM_DV_123#!")

response<- req %>%
  req_perform()

response # inspect content type
response %>%
  resp_body_html()

# Exercise 5.

req<-request("http://165.22.92.178:8080") %>%
  req_url_path("lm") %>%
  req_headers(authorization = "DM_DV_123#!") %>%
  req_url_query(format = "json") %>%
  req_body_json(as.list(df))

response<-req %>%
  req_perform()
response %>%
  resp_body_json()
# simulate data, n - 70 , rnorm x1 and x2, y

n<-70
x1<-rnorm(n=n)
x2<-rnorm(n=n)
y<-2*x1+3*x2
df<-round(data.frame(y=y,x1=x1,x2=x2))

# Exercise 6 - 7
p<- "Lietuva yra graži šalis"
df<-data.frame(p=p)
req<- request("https://google-translate1.p.rapidapi.com/language/translate/v2/detect")%>%
  req_headers('content-type'='application/x-www-form-urlencoded',
              'Accept-Encoding'='application/gzip',
              'X-RapidAPI-Key'='fed7ee78f4msh352406e3938e0a8p1b1499jsn11d70edd786d',
              'X-RapidAPI-Host'='google-translate1.p.rapidapi.com')%>%
  req_body_form(as.list(df))

response<-req%>%
  req_perform()
response %>%
  resp_body_string()
