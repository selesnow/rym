rym_get_ga <-
function (start.date = "10daysAgo",
                        end.date = "today",
                        counter = NULL,
                        dimensions = "ga:date,ga:sourceMedium",
                        metrics = "ga:sessions,ga:bounces,ga:users",
                        filters = NULL,
                        sort = NULL,
                        sampling.level = "HIGHER_PRECISION",
                        login = NULL,
                        token.path = getwd()){
  
  #Проверка заполнения обязательных аргументов
  if(is.null(counter)){
    stop("Аргументы counter являются обязательным!")
  }
  
  token <- rym_auth(login = login, token.path = token.path)$access_token
  
  #Проверяем функцию StringAsFactor
  if(getOption("stringsAsFactors") == TRUE){
    string_as_factor <- "change"
    options(stringsAsFactors = F)
  } else {
    string_as_factor <- "no change"
  }
  
  #Создаём рещультирующий дата фрейм
  result <- data.frame(stringsAsFactors = F)
  
  #Убираем пробелы из метрик и группировок
  metrics <- gsub(" ", "",metrics)
  
  #Переменные для постраничной выборки
  max_results <- 500
  start_index <- 1
  last_query <- FALSE
  
  packageStartupMessage("Processing", appendLF = F)
  
  while(last_query == FALSE){
    
    #Формируем GET Запрос к API метрики
    #Соединяем GET параметры
    query <- paste0("start-date=",start.date,"&end-date=",end.date,"&metrics=",metrics,"&ids=",counter,"&max-results=",max_results,"&start-index=",start_index,"&oauth_token=",token)
    #По очереди добавляем не обязательные параметры
    if(!is.null(dimensions)) {
      dimensions <- gsub(" ", "",dimensions)
      query <- paste0(query,"&dimensions=",dimensions)}
    if(!is.null(filters)) query <- paste0(query,"&filters=",filters)
    if(!is.null(sort)) query <- paste0(query,"&sort=",sort)
    if(!is.null(sampling.level)) query <- paste0(query,"&samplingLevel=",sampling.level)
    
    #Заменяем спец символы параметров на URL кодировку
    query <- gsub(":","%3a",query)
    #Соединяем URL и GET параметры
    query <- paste0("https://api-metrika.yandex.ru/analytics/v3/data/ga?", query)
    #Отправляем запрос на сервер
    answer <- GET(query)
    #Парсим результат
    rawData <- content(answer, "parsed", "application/json")
    
    #Проверка ответа на ошибки
    if(!is.null(rawData$error)){
      stop(paste0(rawData$error$errors[[1]]$reason," - ",rawData$error$errors[[1]]$message, ", location - ", rawData$error$errors[[1]]$location))
    }
    
    #Парсинг результата
    #Получаем вектор с названием столбцов
    column_names <- unlist(lapply(rawData$columnHeader, function(x) return(x$name)))
    
    #Парсим строки
    rows <- lapply(rawData$rows, function(x) return(x))
    for(rows_i in 1:length(rows)){
      result <- rbind(result, unlist(rows[[rows_i]]))
    }
    #Выводим точку
    packageStartupMessage(".", appendLF = F)
    #Переходим на следующую страницу.
    start_index <- start_index + max_results
    
    #Проверяем последняя ли это страница
    if(rawData$totalResults < start_index){
      last_query <- TRUE
    }
  }
  
  #Задаём имена столбцов
  colnames(result) <- column_names
  
  #Преобразуем тип данных в столбцах
  for(tape_i in 1:length(rawData$columnHeaders)){
    
    if(rawData$columnHeaders[[tape_i]]$columnType == "METRIC"){
      result[,tape_i] <- as.numeric(result[,tape_i])
    }
  }
  
  #Возврашаем опцию преобзования текстовых полей в фактор если меняли её на старте работы
  if(string_as_factor == "change"){
    options(stringsAsFactors = T)
  }
  
  #Выводим сообщение о том что данные загружены
  packageStartupMessage("Done", appendLF = T)
  
  #Выводим общую информацию
  if(rawData$containsSampledData == TRUE){
    packageStartupMessage("При сборе данных было использовано семплирование.", appendLF = T)
    packageStartupMessage(paste0("размер выборки на которой составлен отчёт: ", rawData$sampleSize), appendLF = T)
    packageStartupMessage(paste0("данная выборка составляет : ",  as.integer(rawData$sampleSize) / as.integer(rawData$sampleSpace) * 100, "% от общего количества визитов"), appendLF = T)
    packageStartupMessage(paste0("Общее количество полученных результатов: ", rawData$totalResults), appendLF = T)
  } else {
    packageStartupMessage("При сборе данных не было использовано семплирование.", appendLF = T)
    packageStartupMessage(paste0("Общее количество полученных результатов: ", rawData$totalResults), appendLF = T)
  }
  #Возвращем результат
  return(result)
}
