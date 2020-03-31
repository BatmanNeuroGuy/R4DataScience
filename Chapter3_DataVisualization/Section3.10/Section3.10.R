# Add position adjustments, stats, coordinate systems, and faceting to our code 
# template
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(
    mapping = aes(<MAPPINGS>),
    stat = <STAT>, 
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
  
Seven parameters, the _bracketed words_ appear in the template
The seven parameters in the template compose the *grammar of graphics*, 
a formal system for building plots.
You can uniquely describe any plot as a combination of a dataset, a geom, 
a set of mappings, a stat, a position adjustment, a coordinate system, 
and a faceting scheme
**FOR A COMPLETE ACCOUNT SEE SECTION 3.10 


