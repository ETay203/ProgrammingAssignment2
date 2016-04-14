## Two functions makeCacheMatrix and cacheSolve that take a matrix, and returns its inverse
## the inverse is cached, so that if it already exists, it will not be re-evaluated but 
## retrieved from the cached value.

## makeCacheMatrix
## Returns a list of functions that are used as input to cacheSolve.R in order to 
## inverse a square matrix and cache that inverse.

## This function assumes that the matrix supplied is always invertible

## uses `<<-` to assign a value to an object in an environment 
## different from the current environment.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                ##set the matrix
                x <<- y
                i <<- NULL
        }
        get <- function() x  ##get the matrix
        setinverse <- function(inverse) i <<- inverse  ##set the inverse matrix
        getinverse <- function() i                     ##get the inverse matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve:
## returns a matrix, the inverse of "x" 
## first input matrix using makeCacheMatrix()

cacheSolve <- function(x, ...) {
        ## retrieves any inverse already cached 
        i <- x$getinverse()
        
        ## checks if inverse exists and returns it
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        ##if no inverse has been cached already, evaluate the new inverse
        data <- x$get()
        i <- solve(data, ...)
        
        ##set the inverse evaluated, i.e. cache it
        x$setinverse(i)
        i
}