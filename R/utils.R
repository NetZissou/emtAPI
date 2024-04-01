generatePassword <- function(length = 9) {
  # Define the character sets
  lowerLetters <- paste(letters, collapse = "")
  upperLetters <- paste(toupper(letters), collapse = "")
  numbers <- paste(0:9, collapse = "")
  specialChars <- "!@#$%^&*()_+-=[]{}|;:'\",.<>/?"

  # Combine all characters
  allChars <- paste(lowerLetters, upperLetters, numbers, specialChars, sep = "")

  # Generate the password
  password <- character(length)
  for (i in 1:length) {
    password[i] <- substr(sample(strsplit(allChars, "")[[1]], 1), 1, 1)
  }

  # Return the password as a string
  return(paste(password, collapse = ""))
}


#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL
