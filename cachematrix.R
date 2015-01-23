
## These two functions create, store and recall a matrix and its inverse in and from cache

## The function makeCacheMatrix creates custom matrix type.

makeCacheMatrix <- function(x = matrix()) {  	
  
  m<-NULL				
  
  set<-function(y){
    x<<-y		##assign value in cache
    m<<-NULL	##reserves value in cache
  }
  
  get<-function() {
    x		##get value
  }
  
  
  
  setmatrix<-function(solve) { 		
    m<<- solve			##assign iverse_matrix function to m in cache	
  }
  
  
  getmatrix<-function() {
    m				##get value from inverse_matrix function assigned to m in cache
  }
  
  
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)	##list setting and getting matrix and inverse
}


## The function cacheSolve take a custom matrix type created by the makeCacheMatrix function
## and calculates the inverse matrix of it.

cacheSolve <- function(x=matrix(), ...) {
  
  m<-x$getmatrix()
  
  if(!is.null(m)){
    
    message("getting cached data")
    return(m)
  }
  
  matrix<-x$get()
  
  m<-solve(matrix, ...)
  
  x$setmatrix(m)
  
  m
}





