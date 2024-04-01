users <- RSQLite::dbConnect(RSQLite::SQLite(), fs::path(emtAPI::ROOT, "API", "users.sql"))

users_values <-
  tibble::tribble(
    ~name, ~user, ~password, ~token,
    'Dayton HUB', 'dayton', "y/?&?4i)z", '',
    'Net Zhang', 'net', "Zissou$$$", '',
    'Yogita Karale', 'yogita', "gPi:J]|Q=", '',
    'Srinivasan Sridhar', 'srini', "oFgiO+wA7", ''
  )

RSQLite::dbWriteTable(users, name = 'users', value = users_values)
RSQLite::dbDisconnect(users)
