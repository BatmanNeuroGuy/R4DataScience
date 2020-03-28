library(tidyverse)
# A geom is the geometrical object that a plot uses to represent data. 
# People often describe plots by the type of geom that the plot uses. 
# For example, bar charts use bar geoms, line charts use line geoms, 
#boxplots use boxplot geoms, and so on

# To change the geom in your plot, change the geom function that you add to 
# ggplot().

# scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# line graph
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) 

# both
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))

# you could set the linetype of a line. geom_smooth() will draw a different line, 
# with a different linetype, for each unique value of the variable that you map 
# to linetype
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
# Here geom_smooth() separates the cars into three lines based on their drv value, 
# which describes a car’s drivetrain

#  overlaying the lines on top of the raw data and then coloring everything 
# according to drv
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# Many geoms, like geom_smooth(), use a single geometric object to display 
# multiple rows of data. For these geoms, you can set the group aesthetic 
# to a categorical variable to draw multiple objects. ggplot2 will draw a 
# separate object for each unique value of the grouping variable.
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, color = drv))

# Avoid repeating parameters when assigning multiple geoms by passing a 
# set of mappings to ggplot()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# If you place mappings in a geom function, ggplot2 will treat them as local 
# mappings for the layer. It will use these mappings to extend or overwrite 
# the global mappings for that layer only. This makes it possible to display 
# different aesthetics in different layers
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# Use the above idea to specify different data for each layer
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE) # fits 
  # line only to subcompact data

######### 1. What geom would you use to draw a line chart? geom_smooth
# A boxplot? geom_boxplot
ggplot(data = mpg, mapping = aes(x = hwy, y = displ, color = class)) + 
  geom_boxplot()
# A histogram? 
ggplot(data = mpg, mapping = aes(x = hwy)) + 
  geom_histogram(binwidth = 1)

# An area chart? = geom_area()
ggplot(data = mpg, mapping = aes(year, hwy, fill = class)) + 
  geom_area()


######### 2. Run this code in your head and predict what the output will look 
# like. Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE) #prediction was accurate


########### 5. Will these two graphs look different? 
# Why/why not? No, because the geoms will reference the global parameters in the 
# mapping in the first script, and the local parameters in the second which are
# the same as the global parameters in the first
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

####### 6. Recreate the R code necessary to generate the following graphs.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 3) +
  geom_smooth(size = 1, se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 3) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy, group = drv),
                                        se = FALSE, legend = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point(size = 3) +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv), size = 3) +
  geom_smooth(size = 2, se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv), size = 3) +
  geom_smooth(aes(linetype = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy, colour = drv)) + 
  geom_point(size = 3, stroke = 3, fill = 'white')

?geom_point






