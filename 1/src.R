# Produced to answer this Stack Overflow question https://stackoverflow.com/questions/67896638/change-each-histogram-color-in-chart/67898239#67898239

# Import ggplot2
library("ggplot2")

# Obtain sample values for histogram
set.seed(1234)
Values = rnorm(n = 1000, mean = 70, sd = 30)
Range = c()

# Get ranges for each value in data
for(i in 1:length(Values)){
  if(Values[i] >= 80){
    Range[i] = "More than 80"
  } else if (Values[i] < 80 & Values[i] >= 60){
    Range[i] = "Between 60 and 79"
  } else if (Values[i] < 60 & Values[i] >= 40){
    Range[i] = "Between 40 and 59"
  } else if (Values[i] < 40 & Values[i] >= 20){
    Range[i] = "Between 20 and 39"
  } else {
    Range[i] = "Less than 20"
  }
}


# Put all data inside a data frame
plot_dat = data.frame(Values, Range)
plot_dat$Range <- factor(plot_dat$Range, levels = c("More than 80", "Between 60 and 79", "Between 40 and 59", "Between 20 and 39", "Less than 20"))

# Produce plot
ggplot(plot_dat, aes(x=Values, fill=Range)) + geom_histogram(binwidth = 5) +  coord_flip() + ggtitle("Sample Histogram")
