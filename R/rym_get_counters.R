rym_get_counters <-
  function(login = getOption("rym.user"),
           token.path = getOption("rym.token_path"),
           search.string = NULL) {
    if (is.null(token.path)) {
      token.path <- getwd()
    }

    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token

    result <- data.frame()

    limit <- 1000
    offset <- 1
    total <- list(
      value = 0,
      first_query = TRUE
    )


    while (total$value >= offset || total$first_query) {
      answer <- GET("https://api-metrika.yandex.ru/management/v1/counters",
        query = list(
          per_page = limit,
          offset = offset,
          search_string = search.string
        ),
        add_headers(Authorization = paste0("OAuth ", ym_token))
      )

      stop_for_status(answer)

      raw_data <- content(answer, as = "parsed")

      if (total$first_query) {
        total$value <- raw_data$rows
        total$first_query <- FALSE
      }

      res <- list()

      for (counter in seq_along(1:length(raw_data$counters))) {
        res[[counter]] <- data.frame(
          id = ifelse(is.null(raw_data$counters[[counter]]$id), NA, raw_data$counters[[counter]]$id),
          status = ifelse(is.null(raw_data$counters[[counter]]$status), NA, raw_data$counters[[counter]]$status),
          owner_login = ifelse(is.null(raw_data$counters[[counter]]$owner_login), NA, raw_data$counters[[counter]]$owner_login),
          name = ifelse(is.null(raw_data$counters[[counter]]$name), NA, raw_data$counters[[counter]]$name),
          code_status = ifelse(is.null(raw_data$counters[[counter]]$code_status), NA, raw_data$counters[[counter]]$code_status),
          site = ifelse(is.null(raw_data$counters[[counter]]$site), NA, raw_data$counters[[counter]]$site),
          permission = ifelse(is.null(raw_data$counters[[counter]]$permission), NA, raw_data$counters[[counter]]$permission),
          type = ifelse(is.null(raw_data$counters[[counter]]$type), NA, raw_data$counters[[counter]]$type),
          gdpr_agreement_accepted = ifelse(is.null(raw_data$counters[[counter]]$gdpr_agreement_accepted), NA, raw_data$counters[[counter]]$gdpr_agreement_accepted)
        )
      }


      result <- rbind(result, do.call("rbind", res))

      offset <- offset + limit
    }

    return(result)
  }
