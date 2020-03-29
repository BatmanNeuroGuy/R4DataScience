library(tidyverse)
# coord_flip() switches the x and y axes. This is useful (for example), 
# if you want horizontal boxplots. It’s also useful for long labels: 
# it’s hard to get them to fit without overlapping on the x-axis
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() # Labels don't fit on x axis
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip() # Solution is to flip the x and y axes

# coord_quickmap() sets the aspect ratio correctly for maps. 
# This is very important if you’re plotting spatial data with ggplot2 
# (which unfortunately we don’t have the space to cover in this book).
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap() # sets aspect ratio correctly

# coord_polar() uses polar coordinates.
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar() # Polar coordinates reveal an interesting connection between
# a bar chart and a Coxcomb chart

###########################  Exercises #################################3
# 1. Turn a stacked bar chart into a pie chart using coord_polar()
dmd_bar <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

dmd_bar + coord_polar() # clarity as a ratio of n within each cut

dmd_bar1 <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

dmd_bar1 + coord_polar() # clarity as ratio as a percent (all pies equal size)

# 2. What does labs() do? Read the documentation.
  # labs() modifies the chart labels, can change variable and axes labels

# 3. What’s the difference between coord_quickmap() and coord_map()?
  # As elucidated here: https://ggplot2.tidyverse.org/reference/coord_map.html
  # "coord_map projects a portion of the earth, which is approximately spherical, 
  # onto a flat 2D plane using any projection defined by the mapproj package. 
  # Map projections do not, in general, preserve straight lines, so this 
  # requires considerable computation. coord_quickmap is a quick approximation 
  # that does preserve straight lines. It works best for smaller areas closer 
  # to the equator.

# 4. What does the plot below tell you about the relationship between city and highway mpg? 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
  # Why is coord_fixed() important? 
    # this parameter ensures that the x and y axes are on the same scale,
    # i.e., ensures that one unit on the x-axis is the same length as one 
    # unit on the y-axis

  # What does geom_abline() do?
    # adds a reference line, when y int and slope are not specified, defaults
    # to y-int = 0, slope = 1








