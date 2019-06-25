# rym
[![Rdoc](http://www.rdocumentation.org/badges/version/rym)](http://www.rdocumentation.org/packages/rym)
[![rpackages.io rank](http://www.rpackages.io/badge/rym.svg)](http://www.rpackages.io/package/rym)
[![](https://cranlogs.r-pkg.org/badges/rym)](https://cran.r-project.org/package=rym)

<p align="center">
<img src="https://raw.githubusercontent.com/selesnow/rym/master/inst/logo/rym.png" height="200">
</p>

## ru
Пакет rym предназначен для работы со следующими API интерфейсами Яндекс Метрики:

1. [API управления](https://tech.yandex.ru/metrika/doc/api2/management/intro-docpage/), с помощью которого можно получить список доступных вам счётчиков Яндекс Метрики, а так же списки насроенных целей, фильтров и сегмент, и получить список пользователей у которыз есть доступ к счётчику, с информацией об уровне доступа.

2. [API отчётов](https://tech.yandex.ru/metrika/doc/api2/api_v1/intro-docpage/), позволяет загружать статистические данные из Яндекс Метрики.

3. [API совместимый с Core API Google Analytics v3](https://tech.yandex.ru/metrika/doc/api2/ga/intro-docpage/), с помощью которого вы можете запрашивать статистические данные используя такие же названия полей как и при работе с Core API Google Analytics.

4. [Logs API](https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/) с помощью которого можно получить сырые, не сгруппированные данные о просмотрах или визитах на ваш сайт со всеми доступными параметрами.

Пакет изначально разрабатывался согласно политике CRAN, пожтому установить его можно как с репозитория на GitHub, так и напрямую с CRAN.

Установка с CRAN: install.packages("rym")
Установка с GitHub: devtools::install_github("selesnow/rym")

На данный момент ещё готов русскоязычный мануал по работе с пакетом, но он появится в ближайшее время, пока можно использовать англоязычную справочку на Rdocumentation - https://www.rdocumentation.org/packages/rym/versions/..

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>telegram channel: [R4marketing](https://t.me/R4marketing)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://facebook.com/selesnow)
<Br>linkedin: [linkedin.com/in/selesnow](https://linkedin.com/in/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
