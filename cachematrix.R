makeCacheMatrix <- function(x = matrix()) 
# makeCacheMatrix makes a matrix that can cache its inverse
{
  
  xinv <- NULL 
  
  set <- function(y) 
  {
    x <<- y
    xinv <<- NULL 
  }
  
  get <- function() x 
  setInv <- function(inv) xinv <<- inv 
  getInv <- function() xinv 
 
  list(setInv = setInv,
       getInv = getInv,
       set = set, 
       get = get)
}



cacheSolve <- function(x, ...) 
# cacheSolve calculates the inverse of the  matrix resulting from the code above, makeCacheMatrix
{
  mat <- x$getInv() 
  if(!is.null(mat)) 
  { 
    message("calculating...")
    return(mat)
  }
  d01 <- x$get() 
  mat <- solve(d01) 
  x$setInv(mat) 
  mat 
}

