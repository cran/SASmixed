# Ensure that the nlme package is available.
.onLoad <- function(lib, pkg) {
    require("nlme", character = TRUE, quietly = TRUE)
}

