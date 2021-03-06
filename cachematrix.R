## Function makeCacheMatrix make a special matrix which is a list containing a function to 
  #1 Set the value of the matrix
  #2 Get the value of the matrix
  #3 Set the Inverse of the matrix
  #4 Get the Inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    set.inverse <- function(inverse) m <<- inverse
    get.inverse <- function() m
    list(set = set, get = get,
         set.inverse = set.inverse,
         get.inverse = get.inverse)
}


## Computes the Inverse of the special “matrix” created with the above function. 
## But, it first checks to see if the Inverse of the matrix has already been computed. 
## If so, it gets the Inverse from the cache without repeating the computatuion again. 
## Otherwise, it conmputes the Inverse of the matrix and sets the value of the Inverse in the cache via the set.Inverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$get.inverse()
  if(!is.null(m)){
    message("getting cached matrix")
    return(m)
  }
  Matrix <- x$get()
  m <- solve(Matrix,...)
  x$set.inverse(m)
  m
}

