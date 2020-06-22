rym_get_uploadings_offline_conversions <-
  function(counter,
           login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # check path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token



    answer <- GET(
      str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/offline_conversions/uploadings"),
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    stop_for_status(answer)

    raw_data <- content(answer, as = "parsed")

    # check for error
    if (!is.null(raw_data$errors)) {
      stop(raw_data$errors$error_type, ": ", raw_data$errors$message)
    }

    # parse result
    result <- map_df(raw_data$uploadings, purrr::flatten)

    return(result)
  }
