install.packages("rvest")
library("rvest")
url<-"https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)"
webpage<-read_html(url)
country_data_html<-html_nodes(webpage,"td:nth-child(1) tr+ tr td:nth-child(2)")
country_data<-html_text(country_data_html)
country_data<-as.character(country_data)
gdp_html<-html_nodes(webpage,"td:nth-child(1) td~ td+ td")
gdp_data<-html_text(gdp_html)
gdp_df<-data.frame(Country=country_data,GDP=gdp_data)
str(gdp_df)
library(xlsx)
write.xlsx(gdp_df,"D:/gdpextracted.xlsx")
install.packages("blscrapeR")
library("blscrapeR")
# Grab the Unemployment Rate (U-3)
df <- quick_unemp_rate()
head(df, 5)
df <- bls_api(c("LNS12000000", "LNS13000000", "LNS14000000"),
              startyear = 2008, endyear = 2017, Sys.getenv("BLS_KEY")) %>%
  # Add time-series dates
  dateCast()
