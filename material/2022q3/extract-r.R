library(knitr)
require(markdown) #required for md to html

purl('session01.Rmd')
knit('session01.Rmd','session01.md')
markdownToHTML('session01.md','session01.html')
