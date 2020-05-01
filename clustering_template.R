# CLUSTERING IRIS.R
#
#
# Version:  
#
# Date: May 1 
# Author:
#
#TOC> ==========================================================================
#TOC>
#TOC>   Section  Title                                            Line
#TOC> --------------------------------------------------------------------------
#TOC>   1        Packages
#TOC>   2        Dataset exploration
#TOC>   3        Clustering
#TOC>   4        Multidimensional clustering
#TOC> ==========================================================================

# ====    1  Packages  =========================================================

if (!require(ggplot2, quietly = TRUE)) {
    install.packages("ggplot2")
    library(ggplot2)
}

# ====    2 Dataset exploration  ===============================================

iris_data <- iris

# Let's explore the dataset
str(iris_data)

summary(my_data$Petal.Length)

# Let's explore the distribution of petal length across the different species

qplot(
    Petal.Length,
    data = iris_data,
    geom = 'density',
    color = Species,
    fill = Species
)

# ====    3 Clustering  ========================================================

# Can we exctract the different species into clusters using petal lenght?

iris_data2 <- iris_data[,'Petal.Length']

num_clusters <- 3

set.seed(1234)

result <- kmeans(iris_data2, num_clusters, nstart = 20 )

# Let's see how the original species have been assigned into clusters

table(result$cluster, iris_data$Species)

# Let's plot sepal length per cluster

qplot(
    Petal.Length,
    data = iris_data,
    color = factor(result$cluster),
    )


# ====    4 Multidimensional clustering  =======================================

# Can we exctract the different species into clusters using 2 attributes?

iris_multi_data <- iris_data[,c('Petal.Width', 'Petal.Length')]

num_clusters <- 3

set.seed(1234)

result <- kmeans(iris_multi_data, num_clusters, nstart = 20 )

# Let's plot sepal length and petal width per cluster


qplot(Petal.Width,
    Petal.Length,
    data = iris_multi_data,
    color = factor(result$cluster),
)
