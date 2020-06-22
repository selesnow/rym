rym_users_grants <-
  function(counter, login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # token path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    answer <- GET(
      str_glue("https://api-metrika.yandex.ru/management/v1/counter/{counter}/grants"),
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    stop_for_status(answer)

    raw_data <- content(answer, as = "parsed")

    res <- list()

    for (row in seq_along(1:length(raw_data$grants))) {
      res[[row]] <- data.frame(
        user_login = raw_data$grants[[row]]$user_login,
        perm = raw_data$grants[[row]]$perm,
        created_at = raw_data$grants[[row]]$created_at,
        comment = raw_data$grants[[row]]$comment,
        partner_data_access = raw_data$grants[[row]]$partner_data_access
      )
    }


    result <- do.call("rbind", res)
    return(result)
  }
