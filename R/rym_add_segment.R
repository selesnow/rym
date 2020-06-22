rym_add_segment <-
  function(counter,
           name,
           expression,
           login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # check path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    # compose body
    body <- list(segment = list(
      name = name,
      expression = expression,
      segment_source = "api"
    ))

    answer <- POST(str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/apisegment/segments"),
      body   = body,
      encode = "json",
      add_headers(Authorization = paste0("OAuth ", ym_token))
    )

    stop_for_status(answer)

    raw_data <- content(answer, as = "parsed")

    # check for error
    if (!is.null(raw_data$errors)) {
      stop(raw_data$message)
    }

    cat(
      " Segment add successful\n",
      "id:\t\t\t", raw_data$segment$segment_id, "\n",
      "name:\t\t\t", raw_data$segment$name, "\n",
      "expression:\t\t", raw_data$segment$expression, "\n",
      "status:\t\t", raw_data$segment$status, "\n",
      "segment_source:\t", raw_data$segment$segment_source
    )

    return(TRUE)
  }
