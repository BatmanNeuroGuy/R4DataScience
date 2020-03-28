# split your plot into facets, subplots that each display one subset of the data
# To facet your plot by a single variable, use facet_wrap()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) # divides plot into multiple charts based on 
                                # the class variable, and into 2 rows

# To facet your plot on the combination of two variables, add facet_grid() 
# to your plot call. The first argument of facet_grid() is also a formula. 
# This time the formula should contain two variable names separated by a ~
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# If you prefer to not facet in the rows or columns dimension, use a . instead 
# of a variable name, e.g. + facet_grid(. ~ cyl).
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(cyl~ .) # or facet_grid(.~ cyl) to avoid faceting rows

############################# EXERCISES ####################################

# 1. What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cty, nrow = 2) 
# Produces n (# of unique data ponts) plots, i.e.treats as categorical variable

# 2. What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they 
#    relate to this plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# They are instances where no cases exist, e.g., there are cars that have 
# 5 cylinders and that are 4 wheel drive

# 3. What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .) # merges along the x axis (e.g., the displ var)
                      # continuous horizontal (abcissa) axis
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl) # merges along the y axis (e.g. the hwy var)
                      # continuous vertical (ordinate) axis

# 4. Take the first faceted plot in this section:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# What are the advantages to using faceting instead of the colour aesthetic? 
#     Discrete plots for each value of the 3rd variable rather than all vars
#     presented on the same plot--easier to interpret (cleaner)

#What are the disadvantages? 
#     May be harder to see interactions (overlap/distinctions), take up more space,
#     more information to interpret--may take more time to interpret

# How might the balance change if you had a larger dataset?
#   Would definitely prefer the faceted plot as a large dataset would get
#   convoluted very quickly--i.e., difficult to interpret

# 5. Read ?facet_wrap. 
?facet_wrap
# What does nrow do? 
# determines how many rows to divide the plots into

# What does ncol do?
# Determines how many cols to divide the plots into

# What other options control the layout of the individual panels? 
# see ?facet_wrap

#Why doesn’t facet_grid() have nrow and ncol arguments?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = model)) + 
  facet_grid()
#  is used to visualize 2 categorical vars, so will always be divided into 
#  nrows = x var, ncols = y var


# 6. When using facet_grid() you should usually put the variable with more 
# unique levels in the columns. Why?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = model, y = class)) + 
  facet_grid()
# Impossible to read the x axis labels when too many vars are listed along the
# abscissa








