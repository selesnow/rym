# rym - R пакет для работы с API Яндекс Метрики <a href='https:/selesnow/github.io/rym'><img src='https://raw.githubusercontent.com/selesnow/rym/master/inst/logo/rym.png' align="right" height="139" /></a>
[![Rdoc](http://www.rdocumentation.org/badges/version/rym)](http://www.rdocumentation.org/packages/rym)
[![rpackages.io rank](http://www.rpackages.io/badge/rym.svg)](http://www.rpackages.io/package/rym)
[![](https://cranlogs.r-pkg.org/badges/rym)](https://cran.r-project.org/package=rym)

## ru
Пакет rym предназначен для работы со следующими API интерфейсами Яндекс Метрики:

1. [API управления](https://tech.yandex.ru/metrika/doc/api2/management/intro-docpage/), с помощью которого можно получить список доступных вам счётчиков Яндекс Метрики, а так же списки насроенных целей, фильтров и сегмент, и получить список пользователей у которыз есть доступ к счётчику, с информацией об уровне доступа.

2. [API отчётов](https://tech.yandex.ru/metrika/doc/api2/api_v1/intro-docpage/), позволяет загружать статистические данные из Яндекс Метрики.

3. [API совместимый с Core API Google Analytics v3](https://tech.yandex.ru/metrika/doc/api2/ga/intro-docpage/), с помощью которого вы можете запрашивать статистические данные используя такие же названия полей как и при работе с Core API Google Analytics.

4. [Logs API](https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/) с помощью которого можно получить сырые, не сгруппированные данные о просмотрах или визитах на ваш сайт со всеми доступными параметрами.

Пакет изначально разрабатывался согласно политике CRAN, поэтому установить его можно как с репозитория на GitHub, так и напрямую с CRAN.

Установка с CRAN: `install.packages("rym")`
Установка с GitHub: `devtools::install_github("selesnow/rym")`

### Пример кода для работы с пакетом rym
```r
install.packages('rym')
library(rym)

# переходим в рабочую директорию
setwd("C:\\webinars\\cybermarketing-2018")

# авторизаци под двумя разными аккаунтами
rym_auth(login = "vipman.netpeak", token.path = "metrica_token")
rym_auth(login = "selesnow", token.path = "metrica_token")


# API Управления
# получить список счЄтчиков
selesnow.counters <- rym_get_counters(login      = "selesnow",
                                      token.path = "metrica_token")

vipman.counters   <- rym_get_counters(login      = "vipman.netpeak",
                                      token.path = "metrica_token")

# получить список целей
my_goals <- rym_get_goals(counter = 10595804,
                          login      = "vipman.netpeak",
                          token.path = "metrica_token")

# получить список фильров
my_filter <- rym_get_filters(counter = 10595804,
                             login      = "vipman.netpeak",
                             token.path = "metrica_token")

# получить список сегментов
my_segments <- rym_get_segments(counter = 10595804,
                                login      = "vipman.netpeak",
                                token.path = "metrica_token")

# получить список пользователей счЄтчика
users <- rym_users_grants(counter = 10595804,
                          login      = "vipman.netpeak",
                          token.path = "metrica_token")

# API отчЄтов
reporting.api.stat <- rym_get_data(counters   = "23660530,10595804",
                                   date.from  = "2018-08-01",
                                   date.to    = "yesterday",
                                   dimensions = "ym:s:date,ym:s:lastTrafficSource",
                                   metrics    = "ym:s:visits,ym:s:pageviews,ym:s:users",
                                   sort       = "-ym:s:date",
                                   login      = "vipman.netpeak",
                                   token.path = "metrica_token",
                                   lang = "en")

# Logs API
logs.api.stat      <- rym_get_logs(counter    = 23660530,
                                   date.from  = "2018-08-01",
                                   date.to    = "2018-08-05",
                                   fields     = "ym:s:date,
                                                 ym:s:lastTrafficSource,
                                                 ym:s:referer",
                                   source     = "visits",
                                   login      = "vipman.netpeak",
                                   token.path = "metrica_token")

# API —овместимый с Core API Google Analytics v3
ga.api.stat        <- rym_get_ga(counter    = "ga:22584910",
                                 dimensions = "ga:date,ga:source",
                                 metrics    = "ga:sessions,ga:users",
                                 start.date = "2018-08-01",
                                 end.date   = "2018-08-05",
                                 sort       = "-ga:date",
                                 login      = "selesnow",
                                 token.path = "metrica_token")
```

### Ссылки
1. [Официальная документация](https://selesnow.github.io/rym) к пакету `rym`.
2. [Вебинар](https://www.youtube.com/watch?v=sCp2D6068es) посвящённый работе с пакетом `rym`.
3. [Страница](https://CRAN.R-project.org/package=rym) пакета на CRAN.

## Статьи:
- [Как работать с API Яндекс.Метрики с помощью языка R](https://netpeak.net/ru/blog/kak-rabotat-s-api-yandeks-metriki-s-pomoshch-yu-yazyka-r/), *Алексей Селезнёв*
- [Как использовать Rscript в качестве источника данных в Microsoft Power BI на примере Яндекс.Метрики](https://www.mediaguru.ru/blog/kak-ispolzovat-rscript-v-kachestve-istochnika-dannyh-v-microsoft-power-bi-na-primere-yandeks-metriki/), *Павел Мрыкин*
- [Построение поведенческих воронок на языке R, на основе данных полученных из Logs API Яндекс.Метрики](https://habr.com/ru/post/462279/), *Алексей Селезнёв*
- [Обзор R пакетов для интернет маркетинга, часть 1](https://habr.com/ru/post/425425/), *Алексей Селезнёв*
- [Насколько безопасно использовать R пакеты для работы с API рекламных систем](https://habr.com/ru/post/430888/), *Алексей Селезнёв*
- [Как массово удалить в интернет-магазине страницы товаров, которые не приносят трафик](https://netpeak.net/ru/blog/kak-massovo-udalit-v-internet-magazine-stranitsy-tovarov-kotoryye-ne-prinosyat-trafik/), *Богдан Неряхин*

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>telegram channel: [R4marketing](https://t.me/R4marketing)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://facebook.com/selesnow)
<Br>linkedin: [linkedin.com/in/selesnow](https://linkedin.com/in/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
