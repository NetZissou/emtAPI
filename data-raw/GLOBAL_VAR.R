## code to prepare `GLOBAL_VAR` dataset goes here
ROOT <- fs::path(
  "/fs/ess/PAS2531/emthub"
)

PATH_USER_DB <- fs::path(
  ROOT, "API", "users.sql"
)


usethis::use_data(ROOT, overwrite = TRUE)
usethis::use_data(PATH_USER_DB, overwrite = TRUE)
