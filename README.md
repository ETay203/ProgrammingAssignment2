## cacheMatrix.R
cacheMatrix.R contains two functions:
* makeCacheMatrix()
* cacheSolve()

They will take a matrix and return its inverse and that inverse is cached, so that if it already exists, it will not be re-evaluated from scratch but retrieved from the cached value.

## An example of how to run the functions makeCacheMatrix and cacheSolve given in cacheMatrix.R
First either load an existing, or create an invertable square matrix, for this example lets make a reasonably big one:
> my_matrix<-matrix(rnorm(1000000), nrow = 1000, ncol = 1000)

load cacheMatrix.R
> source("cacheMatrix.R")

run the functions on our matrix to invert it
> cacheSolve(makeCacheMatrix(my_matrix))

That's it!  but if you want to see the power of caching in action, you can compare the time it takes to retrieve a cached version of the inverted matrix to re-calculating it from scratch. Copy and paste the following function to achieve that.

## A function to calculate the time difference:

```
cacheTimeDif = function(my_matrix){

        x = makeCacheMatrix(my_matrix)
        
        ##Records start and end time, when cacheSolve is first used to generate a matrix
        ##from scratch
        start.time = Sys.time()
        cacheSolve(x)
        time_from_scratch = Sys.time() - start.time

        
        ##Re-runs cacheSolve, again recording start and end time, but cached value will 
        ##already be there from the previous run
        start.time = Sys.time()
        cacheSolve(x)
        time_from_cache = Sys.time() - start.time

        
        ##Time difference between inverting matrix from scratch and retrieving cached value")
        TimeDif <- time_from_scratch - time_from_cache
        print(TimeDif)
}
```
