## makeCacheMatrix provides the setters and getters for the input matrix and its inverted version
## cacheMatrix computes  the inverted versions of a given matrix if a cahced version is not available 


## makeCacheMatrix provides the setters and getters for the input matrix and its inverted version

makeCacheMatrix <- function(x = matrix()) {
  
  inv.matrix <- NULL
  
  set <- function(initial.matrix) {
    x <<- initial.matrix
     ## whenever a matrix is changed . The cached inverse version should be set to null
    inv.matrix <<- NULL
    
  }
  
  get <- function() {
      return(x)
  }
  
  setinverse <- function(inv) {
      inv.matrix <<- inv
  }
  
  getinverse <- function(){
    return(inv.matrix)
    
  } 
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## The function cachesolve returns the inverse of the matrix cacheed.
## Before computing the inverse, It will first check if there is a cached version available


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("returning cached version")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data) ## computing the inverse
  x$setinverse(inv)
  return(inv); ## returning the computed version
}

######################
## unit tests : ######
######################

# m.test <-  matrix(c(2,4,1/2,1/4),2);
#  m.fun <-  makeCacheMatrix(m.test)

#> m.fun$get()
#[,1] [,2]
#[1,]    2 0.50
#[2,]    4 0.25



#first time invocation :
#> cacheSolve(m.fun)
#[,1]       [,2]
#[1,] -0.1666667  0.3333333
#[2,]  2.6666667 -1.3333333

#second time invocation :
##> cacheSolve(m.fun)
##returning cached version
#[,1]       [,2]
#[1,] -0.1666667  0.3333333
#[2,]  2.6666667 -1.3333333