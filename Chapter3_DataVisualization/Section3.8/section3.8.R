# colour a bar chart using either the colour aesthetic, or, more usefully, fill
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut)) # colour aes
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) # fill aes

# Note what happens if you map the fill aesthetic to another variable, 
 #like clarity: the bars are automatically stacked. Each colored rectangle 
# represents a combination of cut and clarity
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity)) # distinct x and fill values

# position = "identity", place each object exactly where it falls in the context
# of the graph
# To see that overlapping we either need to make the bars slightly transparent 
# by setting alpha to a small value, or completely transparent by setting fill = NA.
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +  # fill aes
  geom_bar(alpha = 1/4, position = "identity") # alpha determines how opaque/translucent

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +  #colour aes
  geom_bar(fill = NA, position = "identity") # fill = NA, no fill

# position = "fill" works like stacking, but makes each set of stacked bars the 
# same height. This makes it easier to compare proportions across groups.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position = "dodge" places overlapping objects directly beside one another. 
# This makes it easier to compare individual values.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# When many points overlap = overplotting
# Solution = set position = "jitter" -> adds small amount of random noise to each point
# Spreads points out, slightly
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
# Makes graph more revealing at large scale
# Use geom_jitter
ggplot(data = mpg) + 
  geom_jitter(mapping = aes(x = displ, y = hwy)) # geom_jitter


#####################  Exercises ################################

# 1. What is the problem with this plot? 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()
    # Data points are overlapping, can't see cluster trends in the data -> 
    # overplotted
 # How could you improve it? Add jitter
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()

# 2. What parameters to geom_jitter() control the amount of jittering?
  # width, height


# 3. Compare and contrast geom_jitter() with geom_count()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter() # shows disparate points spread out so as to individuate them
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count() # shows density (count) of values at a given point
    # Both jitter and count are helpful for discrete values and overplotting

# 4. What’s the default position adjustment for geom_boxplot()? 
  # dodge2

#  Create a visualisation of the mpg dataset that demonstrates it.
ggplot(data = mpg, mapping = aes(x = class, y = hwy, colour = class)) + 
  geom_boxplot()








