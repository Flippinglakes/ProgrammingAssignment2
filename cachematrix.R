## The functions makeCacheMatrix and cachesolve work together to calculate and cache, or retrieve,  the inverse of a matrix


## Makes a matrix object which can be used to cache the inverse of a matrix

makeCacheMatrix<-function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setsolve<-function(solve)m<<-solve
  getsolve<-function() m
  list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}

## Calculates the inverse of a matrix and stores it in the makeCacheMatrix environment. 
## If the inverse has already been cached in makeCacheMatrix cachesolve will retrieve it.

cacheSolve<-function(x,...){
  m<-x$getsolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,... = )
  x$setsolve(m)
  m  ## Return a matrix that is the inverse of 'x'
}
