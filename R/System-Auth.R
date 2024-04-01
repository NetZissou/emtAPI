#' @importFrom rlang ".data"
validate_user <- function(username, password) {

  users_db <- RSQLite::dbConnect(RSQLite::SQLite(), emtAPI::PATH_USER_DB)

  user_row <-
    dplyr::tbl(users_db, 'users') %>%
    dplyr::filter(.data$user == username) %>%
    dplyr::collect()

  if (nrow(user_row) == 0){
    stop("User not found")
  }

  if (password != user_row$password) {
    stop("Incorrect Password")
  }

  RSQLite::dbDisconnect(users_db)
}

gen_token <- function(username, password) {

  validate_user(username, password)

  token <- paste(sample(c(0:9, letters, LETTERS), size = 24, replace = TRUE), collapse = '')

  users_db <- RSQLite::dbConnect(RSQLite::SQLite(), emtAPI::PATH_USER_DB)
  user_row <-
    dplyr::tbl(users_db, 'users') %>%
    dplyr::filter(.data$user == username) %>%
    dplyr::collect()


  RSQLite::dbExecute(users_db, "UPDATE users SET token = ? where user = ? and password = ?",
                     params = c(token, user_row$user, user_row$password))

  RSQLite::dbDisconnect(users_db)
  return(token)
}

view_token <- function(username, password) {
  validate_user(username, password)

  users_db <- RSQLite::dbConnect(RSQLite::SQLite(), emtAPI::PATH_USER_DB)
  user_row <-
    dplyr::tbl(users_db, 'users') %>%
    dplyr::filter(.data$user == username) %>%
    dplyr::collect()


  token <- user_row$token

  RSQLite::dbDisconnect(users_db)
  return(token)
}

