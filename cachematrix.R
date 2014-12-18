## Put comments here that give an overall description of what your
## functions do

## We creat a special list containing a function to get and set the value of the matrix and the inverse of the matrix.
## If we init a matrix in this function, when we use it to get the inverse, 
## if it is not sloved before, it will slove and cache the result in m.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(slove) m <<- slove
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## We can use this function to get the inverse of a matrix and take the advantage of cache.
## The argument x should be the result of makeCacheMatrix(matrix).
## There is a test code below to show how it works

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m        
}

##### test code  #####
# m = makeCacheMatrix(rbind(c(1, -1/4), c(-1/4, 1)))
# print(cacheSolve(m))
# z = cacheSolve(m)
# print(z)

