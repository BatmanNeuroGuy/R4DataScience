# https://r4ds.had.co.nz/data-visualisation.html#statistical-transformations
?diamonds

# On the y-axis, it displays count, but count is not a variable in diamonds! 
# Where does count come from? Many graphs, like scatterplots, plot the raw values 
# of your dataset. Other graphs, like bar charts, calculate new values to plot:
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# bar charts, histograms, and frequency polygons bin your data and then plot bin
# counts, the number of points that fall in each bin.

?geom_bar
# shows that the default value for stat is “count”, which means that geom_bar() 
# uses stat_count(). stat_count() is documented on the same page as geom_bar(), 
# and if you scroll down you can find a section called “Computed variables”. 
# That describes how it computes two new variables: count and prop

# You can generally use geoms and stats interchangeably. For example, you can 
# recreate the previous plot using stat_count() instead of geom_bar():
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))
# This works because every geom has a default stat; and every stat has a default geom

# See section3.7 for explanation of why you should change default stat

# display a bar chart of proportion, rather than count:
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
# To find the variables computed by the stat, look for the help section titled 
# “computed variables”.

# You might want to draw greater attention to the statistical transformation in 
# your code. For example, you might use stat_summary(), which summarises the 
# y values for each unique x value, to draw attention to the summary that you’re 
#computing:
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

##### To see a complete list of stats, try the ggplot2 cheatsheet. #####

############       3.7.1 Exercises #####################
#### 1. What is the default geom associated with stat_summary()? 
?stat_summary
# DEFAULT = 'pointrange'
  # How could you rewrite the previous plot to use that geom function instead of
  # the stat function?
ggplot(data = diamonds) + 
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median,
    stat = "summary"
  )


### 2. What does geom_col() do? 
?geom_col()
    # geom_col() uses a parameter within the data to set the height of the bars
    # geom_bar() uses the frequence (or weight if specified in the aes)

#     How is it different to geom_bar()?
    # geom_col() uses a parameter within the data to set the height of the bars
    # geom_bar() uses the frequence (or weight if specified in the aes)

### 3. Most geoms and stats come in pairs that are almost always used in concert. 
  # Read through the documentation and make a list of all the pairs. 
    # geom_bar(), stat_count() = Bar Charts
    # geom_bin2d(), stat_bin_2d() = Heatmap of 2d bin counts
    # geom_boxplot(), stat_boxplot() = A box and whiskers plot (in the style of Tukey)
    # geom_contour(), stat_contour() = 2d contours of a 3d surface
    # geom_contour_filled(), stat_contour_filled() = 2d contours of a 3d surface
    # geom_count(), stat_sum() = 	Count overlapping points
    # geom_density(), stat_density() = Smoothed density estimates
    # geom_density_2d(), stat_density_2d() = Contours of a 2d density estimate
    # geom_freqpoly(), geom_histogram(), stat_bin() = Histograms of freq polygons
    # geom_qq_line(), stat_qq_line(), geom_qq(), stat_qq() = A quantile-quantile plot
    # geom_quantile(), stat_quantile = Quantile regression
    # geom_smooth(), stat_smooth() = Smoothed conditional means
    # geom_violin(), statydensity() = Violin plot
    # coord_sf(), geom_sf(), geom_sf_label(), geom_sf_text(), stat_sf() = Visualize sf objects

  # What do they have in common?
    # produce the same output--i.e., perform the same statistical transformation
 
### 4. What variables does stat_smooth() compute? 
    # y - predicted value, ymin - lower pointwise CI around the mean, 
    # ymax - upper pointwise CI around the mean, se - standard error
  # What parameters control its behaviour?
    # see https://ggplot2.tidyverse.org/reference/geom_smooth.html for all parameters

### 5. In our proportion bar chart, we need to set group = 1. Why?
     # In other words what is the problem with these two graphs?
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

  # see here: https://stackoverflow.com/questions/39878813/ggplot-geom-bar-meaning-of-aesgroup-1
  # "Group will help the plot to look at the specific rows that contain the 
  #  specific cut and the proportion is found with respect to the whole database 
  #  as in proportion of an ideal cut [compared to] the whole dataset.

  # If group is not used, the proportion is calculated with respect to the data 
  # that contains that field and is ultimately going to be 100% in any case. 
  # For instance, The proportion of an ideal cut in the ideal cut specific data 
  # will be 1.
  
  #SOLUTION
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = 1))









