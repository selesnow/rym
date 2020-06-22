rym_add_goal <-
  function(counter,
           name,
           type = c("number", "action", "step", "url"),
           is.retargeting = FALSE,
           flag = c(NA, "basket", "order"),
           conditions = NULL,
           login = getOption("rym.user"),
           token.path = getOption("rym.token_path")) {

    # check path
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    # match args
    type <- match.arg(type)
    flag <- match.arg(flag)

    # compose body
    body <- list(goal = list(
      name = name,
      type = type,
      is_retargeting = as.integer(is.retargeting),
      flag,
      conditions = list(conditions)
    ))



    answer <- POST(str_glue("https://api-metrika.yandex.ru/management/v1/counter/{counter}/goals"),
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
      " Goal add successful\n",
      "id:\t\t\t", raw_data$goal$id, "\n",
      "name:\t\t\t", raw_data$goal$name, "\n",
      "type:\t\t\t", raw_data$goal$type, "\n",
      "is_retargeting:\t", raw_data$goal$is_retargeting, "\n",
      "prev_goal_id:\t\t", raw_data$goal$prev_goal_id
    )

    return(TRUE)
  }
