install.packages("ggplot2")
library(ggplot2)

#import data
virus_data <- data.frame(read.csv("Cui_etal2014.csv"))

#number of rows and columns
dim(virus_data)
#33 rows and 13 columns

#visualising the raw data to identify appropriate transformation
ggplot(virus_data, aes(x = Genome.length..kb., y = Virion.volume..nm.nm.nm.)) +
  geom_point() +
  labs(x = "Genome length (kb)", y = "Virion volume (mm3)")
  
#applying log transformation to both genome length and virion volume
ggplot(virus_data, aes(x = Genome.length..kb., y = Virion.volume..nm.nm.nm.)) +
  geom_point() +
  scale_y_continuous(trans='log') +
  scale_x_continuous(trans='log') + 
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (mm3)]")

#fitting linear model
#original equation: V=αL^β
#logV = logα + βlogL
#gradient = β, intercept = logα
virus_model <- lm(log(virus_data$Virion.volume..nm.nm.nm.) ~ log(virus_data$Genome.length..kb.))
summary(virus_model)

#intercept = 7.0748 
#log10(virus_data$Genome.length..kb.) = 1.5152
#logα = 7.0748
α = exp(7.0748)
α
#α = 1181.807, p = 2.28e-10
#β = 1.5152, p = 6.44e-10
#dsDNA row from paper: β = 1.52, α = 1182
#values match up - very close what we calculated vs. paper

#reproducing figure
ggplot(virus_data, aes(x = log(Genome.length..kb.), y = log(Virion.volume..nm.nm.nm.))) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue", se = TRUE) + 
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (mm3)]") + 
  theme_bw() +
  theme(axis.title = element_text(face = "bold"))

#creating function for V
α <- 1181.807
β <- 1.5152

virus_volume_fun <- function(L) {
  V <- (α*(L^β))
  return (V)
}

virus_volume_fun(300)
#6697006
