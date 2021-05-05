.quad_to_edge <- function(x) {
  if (is.null(x)) return(NULL)
  cbind(x[1:2, ], x[2:3, ], x[c(3, 1)])
}
.tri_to_edge <- function(x) {
  if (is.null(x)) return(NULL)
  cbind(x[1:2, ], x[2:3, ], x[3:4, ], x[c(4, 1), ])

}

mesh_pal <- function(x, col, ..., meshColor = NULL, pal_dim = 3L)  {
  if (missing(col)) {
    col <- hcl.colors(24)
  }
  if (is.null(meshColor)) {
    meshColor <- x$meshColor
  }
  scl <- function(x) {
    x <- c(x)
    x <- x[!is.na(x)]
    (x - min(x))/diff(range(x))
  }

  idx <- TRUE
  if (meshColor == "faces") {
    idx <- c(x$it, x$ib)
    out <- col[1 + scl(x$vb[pal_dim, idx]) * length(col)]

  }
  if (meshColor == "edges") {
    idx <- c(.tri_to_edge(x$it), .quad_to_edge(x$ib))

    out <- col[1 + scl(colMeans(matrix(x$vb[pal_dim, idx], 2))) * length(col)]
  }
  ## else vertices
  out
}
