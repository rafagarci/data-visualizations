# Homework 1 | SI 649 | LEC 101 | WINTER 2022

library(ggplot2)

## Read data

# Data obtained from https://en.wikipedia.org/wiki/Obesity_in_the_United_States
# Using https://wikitable2csv.ggor.de/

obesity = read.csv('data.csv')

## transform to numeric

obesity$Obese.adults..mid.2000s. = as.numeric(sub('%', '', obesity$Obese.adults..mid.2000s.))/100
obesity$Obese.adults..2020. = as.numeric(sub('%', '', obesity$Obese.adults..2020.))/100
obesity$Overweight..incl..obese..adults..mid.2000s. = as.numeric(sub('%', '', obesity$Overweight..incl..obese..adults..mid.2000s.))/100
obesity$Obese.children.and.adolescents..mid.2000s. = as.numeric(sub('%', '', obesity$Obese.children.and.adolescents..mid.2000s.))/100

## Remove empty cases

obesity = obesity[complete.cases(obesity), ]

## Change col names

colnames(obesity) = c('US_territory',
                     'obesity_rank',
                     'obese_adults_mid_2000',
                     'obese_adults_mid_2020',
                     'obese_and_overweight_adults_mid_2000',
                     'obese_young_mid_2000')

## Create plot

require(reshape2)

ggplot(data = melt(obesity[, c(3, 4, 6)]), aes(x=variable, y=value)) +
  ggtitle('Obesity Rates in US Territories') +
  ylab('Obesity Rate') +
  geom_boxplot(aes(fill=variable), outlier.shape = NA) +
  labs(caption = 'Each point represents a particular obesity rate in a US territory.') +
  geom_jitter(alpha = 0.5, size = 0.3) +
  theme(axis.text.x = element_blank()) +
  theme(axis.ticks.x = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(plot.caption = element_text(hjust=0)) +
  scale_fill_manual(name = 'Variable',
                    values = c('#3e8672', '#ffa93a', '#af3f23'),
                    labels = c('Obese adults (Mid 2000 data)',
                               'Obese adults (Mid 2020 data)',
                               'Obese young (Mid 2000 data)'
                               )
                    )

