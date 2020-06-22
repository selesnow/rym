rym_enable_calls <-
  function(counter,
           login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # check path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    answer <- POST(
      str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/offline_conversions/calls_extended_threshold"),
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    # check answer status
    stop_for_status(answer)

    # get answer
    raw_data <- content(answer, as = "parsed")

    # check for error
    if (!is.null(raw_data$errors)) {
      stop(raw_data$message)
    }

    return(raw_data$success)
  }

# ###########################
rym_disable_calls <-
  function(counter,
           login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # check path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    answer <- DELETE(
      str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/offline_conversions/calls_extended_threshold"),
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    # check answer status
    stop_for_status(answer)

    # get answer
    raw_data <- content(answer, as = "parsed")

    # check for error
    if (!is.null(raw_data$errors)) {
      stop(raw_data$message)
    }

    return(raw_data$success)
  }

# ###########################
rym_allow_calls <-
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
      str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/offline_conversions/calls_visit_join_threshold"),
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    # check answer status
    stop_for_status(answer)

    # get answer
    raw_data <- content(answer, as = "parsed")

    # check for error
    if (!is.null(raw_data$errors)) {
      stop(raw_data$message)
    }

    return(raw_data$date)
  }
