# ADR-001 - Wybór frameworka

## Kontekst i wymagania

**1. Kontekst**

Monitorowanie ukończenia kursów. Brak uporządkowanej ewidencji utrudnia przegląd informacji i podejmowanie decyzji.

**2. Wymagania**

|                       **ID - Wymaganie**                        |                                               **Wpływ na implementację**                                                |
| :-------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------: |
|             **MOB-020-FR-01 - Pełny CRUD modułów**              |     Należy przygotować formularz tworzenia i edycji, listę modułów, widok szczegółów oraz usuwanie z potwierdzeniem     |
|             **MOB-020-FR-10 - Obliczanie postępu**              | Postęp należy wyliczać na podstawie aktualnej liczby ukończonych i wszystkich modułów. Trzeba obsłużyć kurs bez modułów |
|               **MOB-020-FR-11 - Trwałość danych**               |     Kursy, moduły i ich relacje muszą być zapisane w lokalnej bazie danych tak aby przetrwały ponowne uruchomienie      |
| **MOB-020-FR-(05-07) - Wyszukiwanie, filtrowanie i sortowanie** |                          Potrzebne są wyszukiwanie po nazwie, filtrowanie po kursie i statusie                          |
|                  **MOB-020-FR-08 - Walidacje**                  |    Formularze muszą blokować puste nazwy, niepoprawne wartości liczbowe i numery kolejności spoza przyjętego zakresu    |

## Rozważone alternatywy

|            _Potrzeba projektu_             |              **Flutter**              |                     **React Native**                      |
| :----------------------------------------: | :-----------------------------------: | :-------------------------------------------------------: |
|         **Formularze i walidacja**         |        Bardzo dobre dopasownie        |                 Bardzo dobre dopasowanie                  |
|     **Lokalna relacyjna baza danych**      |       Bardzo dobre dopasowanie        |    Dobre dopasowanie - zależne od wybranej biblioteki     |
| **Wyszukiwanie, filtrowanie i sortowanie** |       Bardzo dobre dopasowanie        |                 Bardzo dobre dopasowanie                  |
|      **Testowanie reguł biznesowych**      |       Bardzo dobre dopasowanie        |                 Bardzo dobre dopasowanie                  |
|    **Prostota stacku technologicznego**    | Dobra - Dart, Flutter i pakiet SQLite | Dobra - TypeScript, React Native i biblioteka bazy danych |
|         **Kontrola nad wyglądem**          |             Bardzo dobra              |     Dobra, z możliwością rozbudowanej personalizacji      |

## Decyzja

![Flutter](https://docs.flutter.dev/assets/images/flutter-logo-sharing.png)

## Uzasadnienie

**1. Możliwość realizacji logiki biznesowej -** Flutter umożliwia oddzielenie interfejsu od logiki aplikacji i operacji na danych, co ułatwia implementację wymaganych funkcji CRUD, walidacji modułów, kontroli unikalności ich kolejności oraz obliczania postępu kursu.

**2. Spójny i czytelny interfejs użytkownika -** Widgety Fluttera umożliwiają przygotowanie wymaganych ekranów list, szczegółów i formularzy, a także na spójne prezentowanie komunikatów walidacyjnych, wyników wyszukiwania i postępu nauki.

**3. Obsługa lokalnego przechowywania danych -** Flutter umożliwia wykorzystanie lokalnej bazy SQLite, dzięki czemu można trwale zapisywać kursy i moduły wraz z ich relacjami, bez konieczności tworzenia backendu i wdrażania synchronizacji z chmurą.

**4. Możliwość rozwoju własnych umiejętności -** Lubię uczyć się nowych rzeczy, dlatego chcę podjąć się wyzwania i wykorzystać projekt CourseTracker do poszerzania wiedzy o Flutterze i języku Dart oraz do zdobycia praktycznego doświadczenia w tworzeniu aplikacji mobilnych

## Konsekwencje i ryzyka

**1. Konieczność nauki języka Dart -** Wybór Fluttera wiąże się z koniecznością poznania nowego języka programowania i sposobu budowania interfejsu za pomocą widżetów co może wydłużyć początkowy etap pracy nad projektem ale pozwoli zdobyć nowe umiejętności

**2. Biblioteki -** Obsługa lokalnej bazy SQLite i innych funkcji może wymagać dodatkowych pakietów, których zgodnośc z używaną wersją Fluttera trzeba sprawdzić, a nieodpowiedni wybór bibliotek może powodować problemy z implementacją lub utrzymaniem aplikacji

**3. Konieczność prawidłowego zarządzania danymi i relacjami -** Sam Flutter nie zapenia automatycznie poprawności danych więc trzeba odpowiednio zaprojektować bazę SQLite, żeby zabezpieczyć reguły biznesowe projektu

## Warunki ponownego rozpatrzenia dezycji

**1. Problemy z realizacją wymagań projektu -** Ponownie rozważyłbym wybór Fluttera, gdyby okazało się, że implementacja wymaganych funkcji, takich jak lokalna baza danych, relacje między kursami a modułami lub testowanie logiki biznesowej, jest znacznie trudniejsza, niż zakładano.

**2. Zmiana zakresu projektu -** Ponownie oceniłbym wybór Fluttera, gdyby wymagania rozszerzyły się o funkcje, dla których inna technologia zapewniałaby lepsze wsparcie np. rozbudowanej integracji z rozwiązaniami webowymi

**3. Trudności w opanowaniu technologii -** Jeżeli nauka języka Dart i praca z Flutterem znacząco utrudniałaby terminowe ukończenie projektu, rozważyłbym technologię z którą jestem lepiej zaznajomiony (React Native z TypeScriptem)
