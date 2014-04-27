# Example usage:
# > x <- matrix(rnorm(4), nrow=2, ncol=2)     // Create a matrix x
# > cx <- makeCacheMatrix()                   // Create cache matrix
# > cx$set(x)                                 // Set Matrix
# > cx$get()                                  // Check the matrix
# > cacheSolve(cx)                            // Return the inverse of x
# > cacheSolve(cx)                            // Call again and it returns cached inverse of x



## Function to cache matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL;
  
  set <- function(y) {
    x <<- y;
    m <<- NULL;
  }
  
  get <- function() x;
  
  setMatrix <- function(matrix) m <<- matrix;
  
  getMatrix <- function() m;
  
  list(set = set, get = get,
       setMatrix = setMatrix,
       getMatrix = getMatrix)
}

## Return a matrix that is the inverse of 'x'

## Retrieve inverse of x from cache
## if found, return
## otherwise, calculate and cache it
cacheSolve <- function(x, ...) {
  inv_x <- x$getMatrix();
  
  if(!is.null(inv_x)) {
    message("getting cached data");
    return(inv_x);
  }
  
  data <- x$get();
  inv_x <- solve(data,...);
  x$setMatrix(inv_x);
  inv_x;
}