install.packages('dplyr')
install.packages('base')
install.packages('ggplot2')
install.packages("generics")
install.packages("broom")


library(dplyr)
library(base)
library(stats)
library(ggplot2)
library(broom)
library(caret)

df <- read.csv('C:/Users/aaliy/Documents/incom2024_delay_example_dataset.csv')
head(df)
tail(df)
colnames(df)
sum(is.na(df))
dim(df)
nrow(df)
unique(df)
na.omit(df)

install.packages("dplyr")
library(dplyr)

df <- df %>% select(-latitude, -longitude, -customer_zipcode, -order_item_cardprod_id, -customer_id, -category_id, -department_id, -product_category_id)
head(df)

ggplot(df, aes(x = order_date, y = sales, group = 1)) +
  geom_line(color = "blue") +
  theme_minimal() +
  labs(title = "Sales Over Time", x = "Order Date", y = "Sales")

ggplot(df, aes(x = category_name, y = sales, fill = label)) +
  geom_bar(color = "black") +
  labs(title = "Sales by Category with Labels", x = "Category", y = "Sales")

ggplot(df, aes(x = shipping_mode, y = order_item_total_amount)) +
  geom_boxplot() +
  geom_text(aes(label = label), position = position_jitter(width = 0.2), vjust = -0.5) +
  theme_minimal() +
  labs(title = "Order Item Total Amount by Shipping Mode with Labels", x = "Shipping Mode", y = "Total Amount")

ggplot(df, aes(x = customer_city, y = sales, fill = customer_country)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Sales Distribution by City and Country", x = "Customer City", y = "Sales")

ggplot(df, aes(x = order_region, y = sales, fill = order_region)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Sales by Region", x = "Region", y = "Sales")

ggplot(df, aes(x = order_item_discount_rate, y = sales)) +
  geom_point(aes(color = customer_segment)) +
  theme_minimal() +
  labs(title = "Impact of Discounts on Sales", x = "Discount Rate", y = "Sales")

ggplot(df, aes(x = market, y = sales, fill = market)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Sales Performance by Market", x = "Market", y = "Sales")

ggplot(df, aes(x = order_date, y = sales)) +
  geom_line(color = "blue") +
  theme_minimal() +
  labs(title = "Seasonal Sales Trends", x = "Order Date", y = "Sales")

ggplot(df, aes(x = customer_segment, y = profit_per_order, fill = customer_segment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Profit per Order by Customer Segment", x = "Customer Segment", y = "Profit per Order")
