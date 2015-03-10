makeCacheMatrix <- function(x = matrix()) 
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

