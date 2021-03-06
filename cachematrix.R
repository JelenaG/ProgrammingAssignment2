## Put comments here that give an overall description of what your
## functions do

## This function create a special "matrix"  which is really a list containing a 
## function to: set the value of the matrix, get the value of the matrix,
## set the value of the inverse of matrix, get the value of the inverse of matrix.

makeCacheMatrix=function(x = matrix()){
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse) 
    
}


## This function calculate the inverse of matrix. It first checks to see if the 
## inverse has already been calculated. If so, it gets the inverse from the cache
## and skips the computation. Otherwise, it calculates the inverse of the data 
## and sets the value of the inverse in the cache via the setinverse function.

cacheSolve=function(x, ...){
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    
}