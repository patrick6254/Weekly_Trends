library(readxl)
library(scales)
library(ggplot2)
Tickets <-read_excel("//Users/patrickmiller/Desktop/resolved.xlsx")
Time_Date_Conversion_Created <-as.POSIXct(Tickets$'Created Date Time')
Tickets$`Created Date Time` <- as.Date(Tickets$`Created Date Time`,"%Y-%m-%d %H:%M:%S")
Tickets$Month <- as.Date(cut(Tickets$`Created Date Time`,breaks = "month"))
Tickets$Week <- as.Date(cut(Tickets$`Created Date Time`,breaks = "week",start.on.monday = FALSE))


ggplot(data = Tickets,
       aes(Month,Priority)) +
       stat_summary(fun.y = sum,
                    geom = "bar")
       scale_x_date(
         labels = date_format("%Y-%m"),
         breaks = "1 month")
       