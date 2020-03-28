library('tidyverse')
mpg
?mpg
dim(mpg)

# Reusable template for graphing data
# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))  

# Plot # of cylinders (x) vs hwy mpg (y)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy)) # inverse relationship
# more cylinders, less mpg

# Plot class (x) vs drive train (y)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv)) 
# not helpful, two discrete vars

########################################################################
# Plot engine size (x) vs hwy mpg (y)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) # inverse relationship
# e.g., the larger the engine the lower mpg

# Add color level to aes to include class as a 3rd variable
# x = displ, y = hwy, z = class
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Map class to the size aes rather than color aesthetic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Map class to the greyscale aes rather than color aesthetic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Map class to the shape aes rather than color aesthetic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Make all data points blue
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue") # color goes
# outside of aes f(x)

########################## 3.3. Exercises ####################################

# 1. What's gone wrong with this code?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue")) 
# color level should be defined outside of aes f(x)

# 2. Which variables in mpg are categorical? Which variables are continuous?
# Categorical = manufacturer, model, displ, cyl, trans, drv, fl, class
#    Continuous = year?, cty, hwy

# 3. Map a continuous variable to color, size, and shape. How do these 
# aesthetics behave differently for categorical vs. continuous variables?
# Color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "cty"))
# Size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = "cty"))
# Shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = "cty"))
# Maps continuous variables to the same parameter of the levels (size, shape, color)
# i.e., does not differentiate continuous variables

# 4. What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = hwy)
# Nothing is plotted

# 5. What does the stroke aesthetic do? What shapes does it work with? 
# (Hint: use ?geom_point)
?geom_point
# Alters the width of the border around a given point 
# e.g.,
ggplot(data = mtcars) +
  geom_point(mapping = aes(wt, mpg), shape = 21, colour = "black", 
             fill = "white", size = 5, stroke = 5)

# 6. What happens if you map an aesthetic to something other than a variable 
# name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy, colour = displ < 5))
# can differentiate values meeting a given condition, e.g., < 5 = distinct color
# also includes a legend dipicting this relationship











