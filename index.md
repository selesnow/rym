<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114798296-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-114798296-1');
</script>
</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

<style type="text/css">

ul.nm_ul {
  list-style: none; /*убираем маркеры списка*/
  margin: 0; /*убираем отступы*/
  padding-left: 0; /*убираем отступы*/
  margin-top:25px; /*делаем отступ сверху*/
  background:#DCDCDC; /*добавляем фон всему меню*/
  height: 30px; /*задаем высоту*/
}
a.nm_a {
  text-decoration: none; /*убираем подчеркивание текста ссылок*/
  background:#696969; /*добавляем фон к пункту меню*/
  color:#fff; /*меняем цвет ссылок*/
  padding:0px 5px; /*добавляем отступ*/
  font-family: arial; /*меняем шрифт*/
  line-height:30px; /*ровняем меню по вертикали*/
  display: block; 
  border-right: 1px solid #677B27; /*добавляем бордюр справа*/
  -moz-transition: all 0.3s 0.01s ease; /*делаем плавный переход*/
  -o-transition: all 0.3s 0.01s ease;
  -webkit-transition: all 0.3s 0.01s ease;
}
a.nm_a:hover {
  background:#FF8C00;/*добавляем эффект при наведении*/
}
li.nm_li {
  float:left; /*Размещаем список горизонтально для реализации меню*/
  position:relative; /*задаем позицию для позиционирования*/
}
     
    /*Стили для скрытого выпадающего меню*/
    li.nm_li > ul.nm_ul {
        position:absolute;
        top:5px;
        display:none;   
    }
     
    /*Делаем скрытую часть видимой*/
    li.nm_li:hover > ul.nm_ul {
        display:block; 
        width:280px;  /*Задаем ширину выпадающего меню*/      
    }
   li.nm_li:hover > ul.nm_ul > li.nm_li {
        float:none; /*Убираем горизонтальное позиционирование*/
    }
</style>

<h2>Menu:</h2>
<center>
<ul class="nm_ul">
    <li class="nm_li"><a href="/" class="nm_a">Main</a></li>
    <li class="nm_li"><a href="/" class="nm_a">Пакеты</a>
        <ul class="nm_ul">
            <li class="nm_li"><a href="/galigor" class="nm_a">galigor</a></li>
            <li class="nm_li"><a href="/ryandexdirect" class="nm_a">ryandexdirect</a></li>
            <li class="nm_li"><a href="/rym" class="nm_a">rym</a></li>
            <li class="nm_li"><a href="/rfacebookstat" class="nm_a">rfacebookstat</a></li>
            <li class="nm_li"><a href="/rvkstat" class="nm_a">rvkstat</a></li>
	    <li class="nm_li"><a href="/rmytarget" class="nm_a">rmytarget</a></li>
            <li class="nm_li"><a href="/timeperiodsR" class="nm_a">timeperiodsR</a></li>
	    <li class="nm_li"><a href="/rmixpanel" class="nm_a">rmixpanel</a></li>
	    <li class="nm_li"><a href="/rGitHub" class="nm_a">rGitHub</a></li>
	    <li class="nm_li"><a href="/getProxy" class="nm_a">getProxy</a></li>
        </ul>
    </li>
	<li class="nm_li"><a href="#" class="nm_a">Онлайн Книги</a>
	    <ul class="nm_ul">
            <li class="nm_li"><a href="https://r-for-marketing.netpeak.net/" class="nm_a">Язык R в Интернет Маркетинге</a></li>
	    <li class="nm_li"><a href="/build_telegram_bot_using_r" class="nm_a">Разработка Telegram ботов на языке R</a></li>
            <li class="nm_li"><a href="https://netpeak.net/files/whitepapers/10-fishek-web-analitiki.pdf" class="nm_a">10 фишек Google Analytics</a></li>
        </ul>
	</li>
	<li class="nm_li"><a href="#" class="nm_a">Онлайн Курсы</a>
	    <ul class="nm_ul">
            <li class="nm_li"><a href="https://learn.needfordata.ru/r" class="nm_a">Язык R в Интернет Маркетинге</a></li>
	    <li class="nm_li"><a href="/r4excel_users" class="nm_a">Язык R для пользователей Excel</a></li>
        </ul>
    </li>
    <li class="nm_li"><a href="/library" class="nm_a">Статьи</a></li>
    <li class="nm_li"><a href="https://alexeyseleznev.wordpress.com/" class="nm_a">Ресурсы</a>
    	<ul class="nm_ul">
            <li class="nm_li"><a href="https://www.youtube.com/R4marketing/?sub_confirmation=1" class="nm_a" target="_blank">YouTube канал</a></li>
	    <li class="nm_li"><a href="https://t.me/R4marketing/" class="nm_a" target="_blank">Telegram канал</a></li>
            <li class="nm_li"><a href="https://alexeyseleznev.wordpress.com/" class="nm_a" target="_blank">Блог</a></li>
        </ul>
    </li>
    <li class="nm_li"><a href="/news" class="nm_a">Новости</a></li>
    <li class="nm_li"><a href="/publications" class="nm_a">Архив</a></li>
    <li class="nm_li"><a href="https://secure.wayforpay.com/button/b6dd4a7083fe0" class="nm_a">Поддержать</a></li>
</ul>
</center>
<Br>

# rym - пакет для работы с API Яндекс Метрик <a href='https:/selesnow/github.io/rym'><img src='https://raw.githubusercontent.com/selesnow/rym/master/inst/logo/rym.png' align="right" height="139" /></a>

# Поддержать проект
Вы можете поддержать проект любой произвольной суммой воспользовавшись кнопкой или перейдя по этой [ссылке](https://secure.wayforpay.com/button/b6dd4a7083fe0).

<script type="text/javascript" id="widget-wfp-script" src="https://secure.wayforpay.com/server/pay-widget.js?ref=button"></script>
<script type="text/javascript">function runWfpWdgt(url){var wayforpay=new Wayforpay();wayforpay.invoice(url);}</script>
<button type="button" onclick="runWfpWdgt('https://secure.wayforpay.com/button/b6dd4a7083fe0');" style="display:inline-block!important;background:#2B3160 url('https://s3.eu-central-1.amazonaws.com/w4p-merch/button/bg1x2.png') no-repeat center right;background-size:cover;width: 256px!important;height:54px!important;border:none!important;border-radius:14px!important;padding:18px!important;box-shadow:3px 2px 8px rgba(71,66,66,0.22)!important;text-align:left!important;box-sizing:border-box!important;" onmouseover="this.style.opacity='0.8';" onmouseout="this.style.opacity='1';"><span style="font-family:Verdana,Arial,sans-serif!important;font-weight:bold!important;font-size:14px!important;color:#ffffff!important;line-height:!important;vertical-align:middle!important;">Оплатить</span></button>

# Ссылки
* [Документация](https://selesnow.github.io/rym/)
* [Отчёт об ошибках и доработках](https://github.com/selesnow/rym/issues)
* [Список релизов](https://github.com/selesnow/rym/releases)
* [Группа в Вконтакте](https://vk.com/data_club)
* [RDocumentation](https://www.rdocumentation.org/packages/rym/)

# CRAN
[![Rdoc](http://www.rdocumentation.org/badges/version/rym)](http://www.rdocumentation.org/packages/rym)
[![rpackages.io rank](http://www.rpackages.io/badge/rym.svg)](http://www.rpackages.io/package/rym)
[![](https://cranlogs.r-pkg.org/badges/rym)](https://cran.r-project.org/package=rym)

# Содержание ReadMe пакета rym

* [Краткое описание](#краткое-описание-пакета-rym)
* [Пример кода](#пример-кода)
* [Безопасность использования пакета rym](безопасность-использования-пакета-rym)
* [Запись вебинара по работе с пакетом rym](#запись-вебинара-по-работе-с-пакетом-rym)
* [Синтаксис пакета](#синтаксис-пакета)
* [Установка пакета](#установка-rym)
* [Авторизация в API Яндекс.Метрики](#авторизация-в-api-яндексметрики)
* Функции для работы с API Яндекс.Метрики
  * [Функции для работы с API управления](#работа-с-api-управления)
  * [Функции для работы с API отчётов](#работа-с-api-отчётов)
  * [Функции для работы с API совместимым с Core Reporting API Google Analytics](#работа-с-api-совместимым-с-core-reporting-api-google-analytics)
  * [Функции для работы с Logs API](#работа-с-logs-api-яндексметрики)
  * [Функции для загрузки данных в Яндекс.Метрику](#загрузка-данных-в-яндексметрику)
   
## Краткое описание пакета rym

`rym` является R интерфейсом для работы с API Яндекс Метрики, его функции позволяют вам взаимодействовать со следующими API:

1. [API Управления](https://tech.yandex.ru/metrika/doc/api2/management/intro-docpage/) - позволяет получить таблицы с такими объектами как достуные счётчики Яндекс.Метрики, список настроенных целей, фильтров и сегментов, а так же список пользователей у которых есть доступ к счётчику.
2. [API Отчётов](https://tech.yandex.ru/metrika/doc/api2/api_v1/intro-docpage/) - позволяет получать информацию о статистике посещений сайта и другие данные, не используя интерфейс Яндекс.Метрики.
3. [API совместимый с Core API Google Analytics (v3)](https://tech.yandex.ru/metrika/doc/api2/ga/intro-docpage/) - позволяет запрашивать статистические данные используя при этом название полей такие же как и при работе с Core Reporting API v3.
4. [Logs API](https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/) - позволяет получить сырые, несгруппированные данные о посещении вашего сайта из Яндекс.Метрики.

## Пример кода

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
## Безопасность использования пакета rym

Вопрос безопасности использования разработанных мной пакетов я подробно описал в стать ["Насколько безопасно использовать R пакеты для работы с API рекламных систем"](https://habr.com/post/430888/), которую опубликовал на Хабре.

Авторизация в API Яндекс.Метрики осуществляется по протоколу [OAuth2](https://tech.yandex.ru/oauth/), если коротко этот протокол позволяет вам использовать сторонние приложения для управления своими рекламными материалами не передавая свои учётные данные, логин и пароль орт входа в аккаунт.

В пакете rym для авторизации предназначена функция `rym_auth`. При использовании данной функции процесс авторизации идёт по описанной [тут](https://tech.yandex.ru/oauth/doc/dg/reference/auto-code-client-docpage/) схеме, единственным уязвимым местом в данном случае является период от момента генерация кода подтверждения до ввода его в консоль R. 

Объясню почему, вот как отображаются в Google Analytics данные о посещении страницы генерации **кода подтверждения**.

![](http://img.netpeak.ua/alsey/154297434082_kiss_39kb.png)

Т.е. код идёт после знака ‘?’, и считается GET параметром, который фиксирует счётчик Google Analytics, но срок жизни такого кода подтверждения заканчивается сразу после его использования, т.е. сразу после того, как вы ввели его в консоль R. Максимальный срок жизни такого кода - 10 минут.

При этом сам токен генерируется не на сайте, а запрашивается непосредственно из R у сервера oauth.yandex.ru в обмен на авторизационный код, и через данный сайт он вообще не проходит.

**ВАЖНО** никому не передавайте полученные с помощью пакета rym авторизационные токены, т.к. передав токен вы предоставите доступ к управлению вашими счётчиками Яндекс.Метрики, при этом доступ к ним вы не потеряете в любом случае.

Сами токены храняться на стороне сервера oauth.yandex.ru и они недоступны человеку зарегистрировшему приложение, подробно о том как проходит авторизация на стороне Яндекса можно узнать из официальной документации в разделе ["Авторизация"](https://tech.yandex.ru/metrika/doc/api2/intro/authorization-docpage/).

Пакет rym был опубликован в основной, официальный репозиторий хранения пакетов для языка R - [CRAN](https://CRAN.R-project.org/package=rym). Перед публикацией на этом репозитории пакеты проходят модерацию командой специалистов, что так же гарантирует вам безопасность его использования.

Весь код пакета rym открыт, и перед его использованием вы можете ознакомиться с ним на [GitHub](https://github.com/selesnow/rym/tree/master/R).


## Запись вебинара по работе с пакетом rym
<iframe width="560" height="315" src="https://www.youtube.com/embed/sCp2D6068es" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

* Презентация [SliseShare](https://fr.slideshare.net/Netpeak/kak-avtomatizirovat-rabotu-s-dannymi-y-andeks-metriki), [Google Диск](https://www.youtube.com/redirect?v=sCp2D6068es&event=video_description&redir_token=aZtyUXEnftbPlt_iwWLb1H3mWu18MTU0NDc5NDUxNkAxNTQ0NzA4MTE2&q=https%3A%2F%2Fdrive.google.com%2Ffile%2Fd%2F1V9_z_H3E9ReBofuiOerCmP2CBU45JrCL%2Fview)
* [Рассмотренный в вебинаре пример кода](https://www.youtube.com/redirect?v=sCp2D6068es&event=video_description&redir_token=aZtyUXEnftbPlt_iwWLb1H3mWu18MTU0NDc5NDUxNkAxNTQ0NzA4MTE2&q=https%3A%2F%2Fgithub.com%2Fselesnow%2Fpublications%2Fblob%2Fmaster%2Fcode_example%2Fcybermarketing-2018%2Fyandex-metrica.R)

## Синтаксис пакета

Для удобства работы, и быстрого поиска функций, все функция пакета `rym` начинаются с префикса `rym`. 
Имена функций заданы в змеином_регистре (snake_case), т.е. название пишутся в нижнем регистре, и разделяются нижним подчёркиванием, *(прим. rym_get_data)*.
Имана аргументов, так же пишутся в нижнем регистре, но разделяются точкой *(прим. token.path)*.

## Установка rym

Пакет `rym` можно установить как из основного репозитория для хранения R пакетов CRAN, так и dev версию из GitHub.
Установка с CRAN осуществляется стандартноой командой: `install.packages("rym")`.

Для установки `rym` из GitHub вам потребуется пакет `devtools`.

```r
install.packages("devtools")
devtools::install_github("selesnow/rym")
```

## Виньетки

Виньетки это набор статей, которые состовляют документацию к пакету написанную в произвольной форме. На данный момент к пакету `rym` написанны следующие виньетки:

* [Введение в Пакет rym](https://selesnow.github.io/rym/inst/doc/intro-to-rym.html)
* [API отчётов Яндекс.Метрики](https://selesnow.github.io/rym/inst/doc/rym-reporting-api.html)
* [API Яндекс.Метрики совместимым с Core Reporting API Google Analytics](https://selesnow.github.io/rym/inst/doc/rym-ga-api.html)
* [Logs API Яндекс.Метрики](https://selesnow.github.io/rym/inst/doc/rym-logs-api.html)
* [API управления Яндекс.Метрики](https://selesnow.github.io/rym/inst/doc/rym-management-api.html)
* [Загрузка данных о расходах в Яндекс Метрику](https://selesnow.github.io/rym/inst/doc/rym-load-expense.html)
* [Загрузка оффлайн конверсий в Яндекс.Метрику](https://selesnow.github.io/rym/inst/doc/rym-load-offline-conversion.html)
* [Загрузка информации о звонках в Яндекс.Метрику](https://selesnow.github.io/rym/inst/doc/rym-calls.html)

## Авторизация в API Яндекс.Метрики

Для работы с API Яндекс.Метрики изначально вам необходимо пройти [авторизацию](https://tech.yandex.ru/metrika/doc/api2/intro/authorization-docpage/), в `rym` для этого существует отдельная функция `rym_auth`. Но в целом нет необходимоси проходить авторизацию с помощью данной функции т.к. при любом обращении к API, с помощью любой из достпных в пакете функций будет запущен процесс авторизации, который в `rym` происходит по следующей схеме.

1. При запуске любой функции пакета, изначально осуществляется поиск файла с учётными данными в папке, указанной в аргументе token.path. Имя файла состоит из login.rymAuth.RData, где login — значение, указанное в одноимённом аргументе. Таким образом, в ходе одной R-сессии вы можете работать со счётчиками, доступными под любым количеством пользовательских аккаунтов.
2. Если ранее вы уже прошли процесс авторизации и дали разрешение на запись полученных учётных данных в локальный файл, то учётные данные подгрузятся оттуда.
3. Если вы впервые проходите авторизацию или в аргументе token.path указали папку, в которой ранее не был сохранён файл с учётными данными, вас перенаправит в браузер, в котором необходимо разрешить доступ к данным вашего аккаунта. После этого вы перейдете на страницу, где будет сгенерирован семизначный код для подтверждения авторизации. Скопируйте и вставьте его в R-консоль в ответ на запрос «Enter authorize code:».
4. Далее у вас запросят разрешение на создание полученных учётных данных в локальный файл «Do you want save API credential in local file token.path/login.rymAuth.RData for use it between R sessions?». На запрос необходимо ответить одним из таких значений: yes, ok или save.
5. После чего в папке, указанной в аргументе token.path, сохранится файл login.rymAuth.RData и при следующих обращениях к API, в случае если вы укажите ту же папку в аргументе token.path, учётные данные для обращения к API будут загружены из файла  login.rymAuth.RData.

При этом, для возможности работать в одной R сессии с различными аккаунтами Яндекс.Метрики, во всех функциях пакета вам доступны следующие аргументы:

* **login** — логин пользователя, под которым вам доступен счётчик Яндекс.Метрики, из которого вы будете запрашивать данные;
* **new.user** — признак того, что у пользователя обязательно нужно запросить разрешение на доступ к аккаунту (даже если пользователь уже разрешил доступ данному приложению). Получив этот параметр, Яндекс.OAuth предложит пользователю разрешить доступ приложению и выбрать нужный аккаунт Яндекса;
* **token.path** — путь к папке, в которой будет создан файл для хранения ваших учётных данных для работы с API Яндекс.Метрики.

Используя данные аргументы вы можете организовать работу сразу с несколькими пользовательскими аккаунтами в рамках одного R скрипта.

### Пример кода для прохождения процесса авторизации
```r
library(rym)
rym_auth(login      = "ваш логин",
         token.path = "C:/my_tokens/")
```

Перед использованием данного кода замените "ваш логин", на логин пользователя Яндекс.Метрики под которым достпен нужный вам счёчик.

## Работа с API управления

Для работы с API управления в `rym` вам доступны следующие функции:

* `rym_get_counters` — список доступных счётчиков Яндекс.Метрики;
* `rym_get_filters` — список настроенных фильтров в счётчике;
* `rym_get_segments` — список настроенных сегмнтов в счётчике Яндекс.Метрики;
* `rym_get_goals` — список настроенных целей в Яндекс.Метрике;
* `rym_users_grants` — список пользователей, у которых есть доступ к счётчику Яндекс.Метрики, с указанием уровня доступа;
* `rym_add_goal()` - создать цель в Яндекс Метрике;
* `rym_add_segment()` - создать сегмент в API Яндекс Метрики.

Набор аргументов для всех перечисленных выше функций одинаков:

* **counter** — Id счётчика Яндекс.Метрики;
* **login** — имя пользователя, под которым доступен нужный счётчик Яндекс.Метрики. Используется при авторизации и при поиске файла, в котором хранятся учётные данные пользователя;
* **token.path** — путь к папке, в которой хранится файл с учётными данными.

### Описание полей возвращаемых функциями API управления
#### Списоок полей возвращаемых функцией `rym_get_counters`

* *id* - Номер счётчика Яндекс.Метрики.
* *status* - Статус счетчика. Active — Счетчик активен, Deleted — Счетчик удален.
* *owner_login* - Логин владельца счетчика.
* *name* - Наименование счетчика.
* *code_status* - Статус установки кода счетчика. Возможные значения:
  * CS_ERR_INFECTED — не удалось проверить (сайт, на котором установлен счетчик или одно из его зеркал находится в списке зараженных сайтов).
  * CS_NOT_FOUND — Не установлен.
  * CS_ERR_OTHER_HTML_CODE — установлен другой счетчик.
  * CS_ERR_CONNECT — не удалось проверить (ошибка соединения).
  * CS_ERR_TIMEOUT — не удалось проверить (превышено время ожидания).
  * CS_OK — Корректно установлен.
* *site* - Полный домен сайта.
* *permission* - Уровень доступа к счетчику. Возможные значения:
  * view — гостевой счетчик с уровнем доступа «только просмотр»;
  * edit — гостевой счетчик с уровнем доступа «полный доступ»;
  * own — счетчик, принадлежащий пользователю.
* *type* - Тип информера. Возможные значения:
  * ext — расширенный (по умолчанию).
  * simple — простой;
* *gdpr_agreement_accepted* - Принято соглашение gdpr.

#### Списоок полей возвращаемых функцией `rym_get_filters`

* *id* - Идентификатор фильтра. 
* *attr* - Тип данных, к которым применяется фильтр. Возможные значения:
	* referer — реферер;
	* uniq_id — специальный атрибут для фильтра «не учитывать мои визиты»;
	* client_ip — IP-адрес;
	* title — заголовок страницы;
	* url — URL страницы.
* *type* - Отношение или действие для фильтра. Возможные значения:
	* equal — равно;
	* contain — содержит;
	* me — мои посещения, используется только с типом данных attr = uniq_id;
	* start — начинается с;
	* interval — в интервале, используется только с типом данных «IP-адрес» (attr = client_ip);
	* only_mirrors — только сайт и зеркала, используется только для типа данных «URL страницы» (attr = url) и типа фильтра «оставить только трафик» (action = include), а также при условии, что для счетчика заданы зеркала.
* *value* - Значение фильтра.
* *action* - Тип фильтра. include — оставить только трафик, exclude — исключить трафик.
* *status* - Статус фильтра. Возможные значения:
	* active — фильтр используется;
	* disabled — фильтр отключен (без удаления).
* *with_subdomains* - Фильтровать по поддоменам.
* *start_ip* - Первый IP-адрес диапазона.
* *end_ip* - Последний IP-адрес диапазона.

#### Списоок полей возвращаемых функцией `rym_get_segments`

* *id* - Идентификатор сегмента.
* *counter_id* - Идентификатор счетчика.
* *name* - Название сегмента.
* *expression* - Выражение, которое соответствует [значению параметра filters](https://tech.yandex.ru/metrika/doc/api2/api_v1/segmentation-docpage/).
* *is_retargeting* - Является ли данный сегмент ретаргетинговым
* *segment_source* - Источник сегмента. Указывает на способ его создания. Принимает значение api — используются сегменты, созданные с помощью API.

#### Списоок полей возвращаемых функцией `rym_get_goals`

* *id* - Идентификатор цели.
* *name* - Наименование цели.
* *type* - Тип цели. Возможные значения.
	* number — просмотр N страниц;
	* action — цель типа событие.
	* step — составная цель;
	* url — совпадение по URL страницы;
* *is_retargeting* - Является ли цель ретаргетинговой.
* *conditions* - Cписок структур с условиями цели. Состоит из параметров *type* и *url*:
	* *type* - Тип условия. Возможные значения:
		* regexp — удовлетворяет регулярному выражению;
		* contain — содержит;
		* start — начинается с;
		* exact — совпадает;
		* action — специальный тип условия для целей типа action.
	* *url* - Адрес страницы или части страницы для условия.

#### Списоок полей возвращаемых функцией `rym_users_grants`

* *user_login* - Логин пользователя, которому выдано разрешение на управление счетчиком. Параметр содержит пустую строку, если к статистике счетчика предоставлен публичный доступ (perm = public_stat)
* *perm* - Уровень доступа. Возможные значения:
	* view — только просмотр;
	* edit — полный доступ;
	* public_stat — публичный доступ к статистике.
* *created_at* - Дата предоставления доступа в формате YYYY-MM-DD'T'hh:mm:ssZ.
* *comment* - Произвольный комментарий. Количество символов не должно превышать 255.
* *partner_data_access* - Является и доступ партнёрским.

### Пример работы с API управления

*При использовании приведённого нже примера замените *"ваш логин"* на логин пользователя Яндекса, под которым есть доступ к нужному вам счётчику Яндекс.Метрики, вместо *000000000* введите номер нужного вам счётчика.*

```r
library(rym)

# список доступных счётчиков
my_counters <- rym_get_counters(login      = "ваш логин",
                                token.path = "metrica_token")

# список целей
my_goals <- rym_get_goals(counter    = 000000000,
                          login      = "ваш логин",
                          token.path = "metrica_token")

# список фильтров
my_filter <- rym_get_filters(counter    = 000000000,
                             login      = "ваш логин",
                             token.path = "metrica_token")

# список сегментов
my_segments <- rym_get_segments(counter    = 000000000,
                                login      = "ваш логин",
                                token.path = "metrica_token")

# список пользователей
users <- rym_users_grants(counter    = 000000000,
                          login      = "ваш логин",
                          token.path = "metrica_token")
```


## Работа с API отчётов

Для работы с API отчётов в `rym` предназначена функция `rym_get_data`. На данный момент `rym_get_data` принимает следующие аргументы:

* **direct.client.logins** - Логины клиентов Яндекс.Директа, через запятую. 
* **counters** - Идентификаторы счетчиков, через запятую. 
* **metrics** - Список метрик, разделенных запятой. Лимит: 20 метрик в запросе. Актуальный список поддерживаемых метрик можно найти в [официальной документации](https://tech.yandex.ru/metrika/doc/api2/api_v1/metrics/visits/basic-docpage/).
* **dimensions** - Список группировок, разделенных запятой. Лимит: 10 группировок в запросе. Актуальный список поддерживаемых группировок можно найти в [официальной документации](https://tech.yandex.ru/metrika/doc/api2/api_v1/attributes/visits/source-docpage/).
* **filters** - [Фильтр сегментации](https://tech.yandex.ru/metrika/doc/api2/api_v1/segmentation-docpage/), при фильтрации вы можете сочетать фильтры с помощью логических выражений AND и OR, а так же задавать приоритет выражений с помощью скобок пример: ` "ym:s:regionCityName=='Киев'"`, `ym:s:regionCityName=='Москва' OR ym:s:regionCityName=='Санкт-Петербург'`, `(ym:s:regionCityName=='Москва' OR ym:s:regionCityName=='Санкт-Петербург') AND ym:s:lastTrafficSource=='Переходы по рекламе'`.
* **sort** - Список группировок и метрик, разделенных запятой, по которым осуществляется сортировка.
* **date.from** - Дата начала периода выборки в формате YYYY-MM-DD. Также используйте значения: today, yesterday, ndaysAgo.
* **date.to** - Дата окончания периода выборки в формате YYYY-MM-DD. Также используйте значения: today, yesterday, ndaysAgo.
* **accuracy** - Точность вычисления результата. Позволяет управлять [семплированием](https://tech.yandex.ru/metrika/doc/api2/api_v1/sampling-docpage/) (количеством визитов, использованных при расчете итогового значения). Возможные значения:
	* low — возвращает быстрый результат на основе сокращенной выборки данных.
	* medium — возвращает результат на основе выборки, сочетающей скорость и точность данных.
	* high — возвращает наиболее точное значение, используя наибольшую выборку данных. Этот режим может потребовать дополнительное время и замедлить обработку запроса.
	* full — возвращает все данные.
	* 1 — отсутствует семплирование (соответствует значению full).
	* 0.1 или 0.01 — доля возвращаемых данных (10%, 1%). Любое значение (например, 0.42) будет округляться до ближайшей степени числа 10.
* **include_undefined** - Включает в ответ строки, для которых значения группировок не определены. 
* **lang** - Язык, по умолчанию 'ru'.
* **timezone** - Часовой пояс в формате ±hh:mm в диапазоне [-23:59; +23:59] (знак плюса нужно нужно передавать как %2B), в котором будут расчитан период выборки запроса, а также связанные с датой и временем группировки. 
* **pretty** - Задает форматирование результата.
* **login** - Логин пользователя Яндекс.Метрики.
* **token.path** - Путь к директории в которой хранится файлс с учётными данными, для текущего пользователя Яндекс.Метрики, указанного в аргументе *login*.

### Пример работы с API отчётов

```r
reporting.api.stat <- rym_get_data(counters   = "00000000,111111111",
                                   date.from  = "2018-08-01",
                                   date.to    = "yesterday",
                                   dimensions = "ym:s:date,ym:s:lastTrafficSource",
                                   metrics    = "ym:s:visits,ym:s:pageviews,ym:s:users",
                                   filters    = "ym:s:trafficSourceName=='Переходы из поисковых систем' AND ym:s:isNewUser=='Yes'",
                                   sort       = "-ym:s:date",
                                   accuracy   = "full",
                                   login      = "ваш логин",
                                   token.path = "metrica_token",
                                   lang       = "ru")
```

*Как и в прошлом примере вам необходимо указать номера своиз счётчиков, логин и путь к папке для хранения файла с учётными данными.*


## Работа с API совместимым с Core Reporting API Google Analytics

Если вы ранее работали с Core Reporting API Google Analytics, то именно данный API будет для вас наиболее удобен, т.к. он позволяет запрашивать данные используя такие же имена полей. Для работы с этим API в `rym` существует функция `rym_get_ga`.

Аргументы функции `rym_get_ga`:

* **start.date** - Дата начала отчетного периода. Вы можете указывать дату в формате YYYY-MM-DD или использовать относительные временные значения: today, yesterday, NdaysAgo. 
* **end.date** - Дата окончания отчетного периода. Вы можете указывать даты в формате YYYY-MM-DD или использовать относительные временные значения: today, yesterday, NdaysAgo.
* **counter** - Номер счетчика, данные которого необходимо получить. Перед номером счетчика необходимо указать префикс ga:.
* **dimensions** - Группировки объединяют данные по критериям. В состав одного запроса может входить не более 7 группировок. Актуальный справочник поддерживаемых группировок можно найти по [ссылке](https://tech.yandex.ru/metrika/doc/api2/ga/ga/implemented/metrika_dim-docpage/).
* **metrics** - Метрики позволяют получать данные о статистике посещаемости и активности пользователей сайта. Если в запросе вы не укажете ни одной группировки, то API вернет общее значение метрики для выбранного временного интервала без разделения его на какие-либо группы. В состав одного запроса может входить не более 10 метрик.  Актуальный справочник поддерживаемых метрик можно найти по [ссылке](https://tech.yandex.ru/metrika/doc/api2/ga/ga/implemented/metrika_dim-docpage/).
* **sort** - В качестве сортировки собранных данных может быть использован список метрик и группировок. По умолчанию используется сортировка по возрастанию. Чтобы использовать сортировку по убыванию, укажите знак «-» в запросе перед списком метрик и группировок. В качестве значения параметра sort вы можете использовать только те значения группировок и метрик, по которым были получены данные.
* **sampling.level** - Используйте данный параметр для указания уровня семплирования (количества визитов, использованных при расчете итогового значения). Возможные значения:
	* HIGHER_PRECISION — возвращает наиболее точное значение, используя наибольшую выборку данных. Этот режим может потребовать дополнительное время и замедлить обработку запроса.
	* FASTER — возвращает быстрый результат на основе сокращенной выборки данных.
	* DEFAULT — возвращает результат на основе выборки, сочетающей скорость и точность данных.
* **login** - Логин пользователя Яндекс.Метрики.
* **token.path** - Путь к директории в которой хранится файлс с учётными данными, для текущего пользователя Яндекс.Метрики, указанного в аргументе *login*.

### Пример работы с API совместимым с Core API Google Analytics

```r
ga.api.stat        <- rym_get_ga(counter    = "ga:00000000",
                                 dimensions = "ga:date,ga:source",
                                 metrics    = "ga:sessions,ga:users",
                                 start.date = "2018-08-01",
                                 end.date   = "20daysAgo",
                                 filters    = "ga:source==google.ru",
                                 sort       = "-ga:date",
                                 login      = "ваш логин",
                                 token.path = "metrica_token")
```

*Перед использованием данного примера замените значения аргументов *counter* и *login* на ваши.*

## Работа с Logs API Яндекс.Метрики

Logs API предназначен для получения несгруппированных данных из Яндекс.Метрики, на самом деле вы можете получить данные в двух группировках:

* просмотры - 1 строка будет хранить информацию об одном действии одного пользователя сайта
* визиты - 1 строка содержит информацию о всех просмотрах в рамках одной пользовательской сессии

Для загрузки данных из Logs API можно использовать функцию `rym_get_logs`, которая принимает следующий набор аргументов.

* **counter** - Номер счётчика Яндекс Метрики.
* **date.from** - Дата начала отчетного периода в формате YYYY-MM-DD.
* **date.to** - Дата окончания отчетного периода в формате YYYY-MM-DD (не может быть текущим днем).
* **fields** - Список полей через запятую. Актуальный список полей можно найти в официальной справке, [список полей для просмотров](https://tech.yandex.ru/metrika/doc/api2/logs/fields/hits-docpage/), [список полей для визитов](https://tech.yandex.ru/metrika/doc/api2/logs/fields/visits-docpage/).
* **source** - Источник логов. hits — просмотры, visits — визиты.
* **login** - Логин пользователя Яндекс.Метрики.
* **token.path** - Путь к директории в которой хранится файлс с учётными данными, для текущего пользователя Яндекс.Метрики, указанного в аргументе *login*.

### Пример работы с Logs API Яндекс.Метрики.

```r
logs.api.stat      <- rym_get_logs(counter    = 00000000,
                                   date.from  = "2018-08-01",
                                   date.to    = "2018-08-05",
                                   fields     = "ym:s:date,
                                                 ym:s:lastTrafficSource,
                                                 ym:s:referer",
                                   source     = "visits",
                                   login      = "ваш логин",
                                   token.path = "metrica_token")
```

*Перед использованием данного примера замените значения аргументов counter и login на ваши.*

## Загрузка данных в Яндекс.Метрику
### Загрузка данных о расходах на рекламу в Яндекс.Метрику

Более подробно о загрузке данных по расходам из рекламных систем в Яндекс.Метрику вы можете узнать из виньетки ["rym: Загрузка данных о расходах в Яндекс.Метрику"](https://selesnow.github.io/rym/inst/doc/rym-load-expense.html).

Для загрузки данных о расходах вам понадобятся следующие функции:

* `rym_upload_expense()` - Загрузка расходов в Яндекс.Метрику
* `rym_delete_uploaded_expense()` - Удаление данных о расходах из Яндекс.Метрики
* `rym_get_uploadings_expense()` - Список загрузок расходов

**Аргументы функций для загрузки данных о расходах**

* counter - номер счётчика в который необходимо загрузить данные
* data - data.frame, содержащий данные о расходах на рекламу которые требуется загрузить в Яндекс.Метрику
* comment - комментарий к загрузке (не обязательно)
* login - ваш лошин в яндексе
* token.path - путь к папке в которой хранятся учётные данные

#### Пример кода для загрузки расходов в Яндекс.Метрику

```r
# данные для загрузки
expense <- data.frame(Date        = c("2020-06-01",
                                      "2020-06-02"),
                      UTMSource   = c("test_s_1",
                                      "test_s_2"),
                      Expenses    = c(88.12,
                                      92.11),
                      UTMMedium   = c("cpc",
                                      "cpm"),
                      UTMCampaign = c("camp1",
                                      "camp2"),
                      UTMTerm     = c("term1",
                                      "term2"),
                      UTMContent  = c("cont1",
                                      "cont2"),
                      Currency    = c("RUB", 
                                      "RUB"),
                      Clicks      = c(11, 15))

# отправка данных в Яндекс.Метрику
rym_upload_expense(counter = 11111, 
                   data    = expense,
                   login   = 'yandex_login', 
                   token.path = "D:/packlab/rym")

# Удаление данных из Яндекс.Метрики
rym_delete_uploaded_expense(counter = 11111, 
                            data    = expense,
                            login   = 'yandex_login', 
                            token.path = "D:/packlab/rym")

# получение списка загрузок
loaded <- rym_get_uploadings_expense(counter = 11111, 
                                     login   = 'yandex_login', 
                                     token.path = "D:/packlab/rym")
```

### Загрузка оффлайн конверсий в Яндекс.Метрику
Более подробно о загрузке оффлайн конверсий в Яндекс.Метрику вы можете узнать из виньетки ["rym: Загрузка данных о расходах в Яндекс.Метрику"](https://selesnow.github.io/rym/inst/doc/rym-load-offline-conversion.html).

Функции для загрузки оффлайн конверсий в метрику:
* `rym_enable_offline_conversion()` - Включить учёт оффлайн конверсий
* `rym_disable_offline_conversion()` - Выключить учёт оффлайн конверсий
* `rym_allow_offline_conversion()` - Возвращает дату и время, начиная с которого конверсии могут быть привязаны к визитам для указанного счетчика.
* `rym_get_uploadings_offline_conversions()` - Возвращает список загрузок оффлайн конверсий
* `rym_upload_offline_conversion()` - Загрузка оффлайн конверсий в Яндекс.Метрику

#### Структура данных для загрузки оффлайн конверсий
Перед загрузкой, данные по оффлайн конверсии необходимо привести к нужной структуре.

Датафрейм должен содержать следующие столбцы:

##### Обязательные поля
* UserId | ClientId | Yclid - Идентификатор посетителя сайта или рекламной кампании в Директе *(пример: 12345)*.
* Target - Идентификатор цели, заданный при создании цели *(пример: order_confirmed)*.
* DateTime - Время, в которое произошла конверсия в формате Unix Time Stamp. Указывайте время в часовом поясе UTC+0. *(пример: 1481718166)*.

##### Необязательные поля
* Price - Ценность цели *(пример: 1000)*.
* Currency - Трехбуквенный [код валюты по ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) *(пример: RUB)*.

#### Пример кода для загрузки оффлайн конверсийх в Яндекс.Метрику
```r
library(rym)

# создаём цель для оффлайн конверсий
rym_add_goal(123456789, 
             name = 'Заказ оплачен',
             type = 'action',
             conditions = list(type = 'exact', 
                               url  = 'order_confirmed'),
             login = 'yandex_login')

# включаем учёт оффлайн конверсий
rym_enable_offline_conversion(123456789, 
                              login = 'yandex_login') 
			      
# проверка можно ли загружать данные и за какой период
rym_allow_offline_conversion(123456789, 
                             login = 'yandex_login')

# загружаем в метрику данные по оффланй конверсиям
rym_upload_offline_conversion(12345, 
                              data = conv_data,
                              client.id.type = "CLIENT_ID",
                              login = 'yandex_login')
			
# получаем список загрузок оффлайн конверсий
uploads <- rym_get_uploadings_offline_conversions(
              counter = 123456789,
              login   = 'yandex_login')
```

### Загрузка данных о звонках в Яндекс.Метрику
Более подробно о загрузке оффлайн конверсий в Яндекс.Метрику вы можете узнать из виньетки ["rym: Загрузка данных о расходах в Яндекс.Метрику"](https://selesnow.github.io/rym/inst/doc/rym-calls.html).

Функции для загрузки данных о звонках в метрику:
* `rym_enable_calls()` - Включить учёт звонков
* `rym_disable_calls()` - Выключить учёт звонков
* `rym_allow_calls()` - Возвращает дату и время, начиная с которого звонки могут быть привязаны к визитам для указанного счетчика.
* `rym_upload_calls()` - Загрузка информации о звонках в Яндекс.Метрику
* `rym_get_uploadings_calls()` - Возвращает список загрузок звонков

#### ПОдготовка данных о звонках для загрукзи
Перед загрузкой, данные о звонках необзодимо привести к нужной структуре:

##### Обязательные поля
* UserId | ClientId | Yclid - Идентификатор посетителя сайта или рекламной кампании в Директе *(пример: 12345)*.

##### Необязательные поля
* StaticCall - является ли звонок статическим (1 — статический, 0 — динамический).
* Price - цена цели, десятичным разделителем является точка (.).
* Currency -  валюта в трехбуквенном формате ISO 4217.
* PhoneNumber - номер телефона без пробелов (с указанием кода страны и города). Например, +70123456789.
* TalkDuration - длительность звонка в секундах.
* HoldDuration - длительность ожидания звонка в секундах.
* CallMissed - пропущен ли звонок (1 — пропущенный, 0 — отвеченный).
* Tag - произвольная метка. Может использоваться для отметки качества звонка или его итоге и т. д. Например, «клиента не устроила цена».
* FirstTimeCaller - первичность (1 — первичный звонок, 0 — вторичный звонок).
* URL - URL, с которого был звонок (ассоциированная с событием страница). Например, это может быть лэндинг для рекламной кампании, на котором указан номер телефона (PhoneNumber).
* CallTrackerURL - URL перехода в интерфейс колл-трекера.

#### Пример кода для загрузки данных о звонках в Яндекс.Метрику
```r
library(rym)

# включаем учёт данных о звонках
rym_enable_calls(123456789, 
                 login = 'yandex_login') 
		 
# проверка можно ли загружать данные и за какой период
rym_allow_calls(123456789, 
                login = 'yandex_login')

# загружаем данные о звонках в метрику
rym_upload_calls(12345, 
                 data = conv_data,
                 client.id.type = "CLIENT_ID",
                 login = 'yandex_login')

# просмотр списка загрузок
uploads <- rym_get_uploadings_calls(
              counter = 123456789,
              login   = 'yandex_login')
```
