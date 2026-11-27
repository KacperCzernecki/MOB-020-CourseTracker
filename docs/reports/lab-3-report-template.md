# Laboratorium 3 — sprawozdanie projektowe

**Przedmiot:** Budowa aplikacji mobilnych z użyciem technologii frontendowych  
**Student / identyfikator: Kacper Czernecki / 147482**
**Projekt biznesowy: MOB-[020] — [CourseTracker]**
**Framework: [Flutter]**
**Data zajęć: 19.11.2026**  
**Repozytorium: [odnośnik](https://github.com/KacperCzernecki/MOB-020-CourseTracker)**  
**Commit / tag odpowiadający oddaniu:** [8d75641](https://github.com/KacperCzernecki/MOB-020-CourseTracker/commit/8d75641d05fb15cc477f4bae17f1444433e75f34)

> Wypełnij na podstawie własnych działań. Odpowiedzi powinny zawierać dowody (pliki, commity, PR, wyniki uruchomienia), nie same deklaracje.

## Zasady opracowania

1. Odpowiedz samodzielnie, korzystając z materiałów udostępnionych na Moodle oraz dodatkowych źródeł technicznych (np. oficjalnej dokumentacji).
2. Nie ograniczaj odpowiedzi do definicji. Wyjaśniaj własnymi słowami, uzasadniaj wnioski i podawaj przykłady.
3. W zadaniach odnoszących się do projektu użyj **własnego, przydzielonego tematu aplikacji**.
4. Podaj źródła wykorzystane do opracowania odpowiedzi. Sam link bez wskazania, do czego został wykorzystany, nie wystarcza.

## T1. Analiza zmian w architekturze interfejsu

1. Wybierz jeden problem z własnej aplikacji (np. odświeżenie listy po zapisie, aktualizacja szczegółów, synchronizacja formularza).
2. Opisz, jak ten problem można byłoby rozwiązać przez ręczną manipulację widokiem, a jak jest rozwiązany w wybranym frameworku.
3. Wskaż **konkretny plik i funkcję/komponent** oraz uzasadnij korzyści i koszty przyjętego podejścia.

**Odpowiedź:**

1. Jednym z problemów CourseTracker jest odświeżanie listy modułów po wykonaniu operacji (dodanie modułu, zmiana statusu czy usunięcie)
2. Przy ręcznej manipulacji widokiem należałoby samodzielnie wyszukać odpowiednie elementy interfejsu i aktualizować ich zawartość np. Po dodaniu modułu trzeba byłoby ręcznie utworzyć nowy element listy. Na szczęscie flutter opiera się na deklaratywnym budowaniu interfejsu.
3. W pliku **[course_details_screen.dart](course_tracker/lib/screens/course_details_screen.dart)** w widgecie **CourseDetailsScreen** zastosowałem metodę `_loadModules()`, która pobiera aktualną listę modułów z bazy, a następnie za pomocą `setState()` aktualizuje zmienną `_modules`

| Korzyści                                                            | Koszty                                                                   |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Automatyczne odświeżanie intefejsu po zmianie stanu                 | Wywołanie `setState()` ponownie wykonuje metodę build()                  |
| Proste zarządzanie listą modułów                                    | Ilość wysyłanych zapytań do bazy SQLite                                  |
| Łatwiejsze utrzymanie spójności między danymi w bazie a interfejsem | Konieczność kontrolowania cyklu życia widgetów (np. sprawdzanie mounted) |

**Dowód w repozytorium:** [Ścieżka](course_tracker/lib/screens/course_details_screen.dart)/[Commit](https://github.com/KacperCzernecki/MOB-020-CourseTracker/commit/8d75641d05fb15cc477f4bae17f1444433e75f34)

## T2. Implementacja Create i Read oraz przepływ danych

> Operacje C/R powstały w laboratorium 2, zweryfikuj je i wskaż ich aktualną implementację; nie przepisuj rozwiązania tylko na potrzeby sprawozdania.

- Encja główna: **Course**
- Model danych i identyfikator rekordu: **Model `course` znajduje się w pliku [course.dart](course_tracker/lib/models/course.dart). Zawiera pola `id`, `name`, oraz `source`. Identyfikatorem jest `id` typu `String` generowanie lokalnie za pomocą `package:uuid/uuid.dart`**
- Ścieżka operacji Create (ekran → walidacja → logika → zapis): **Użytkownik przechodzi do ekranu dodawania kursu `AddCourseScreen` -> Wprowadza nazwę i źródło kursu -> Formularz sprawdza poprawność wymaganych pól -> Tworzony jest obiekt `Course` z nowym UUID -> Obiekt jest przekazywany do `DatabaseService` gdzie metoda `insertCourse()` zapisuje go w tabeli `courses` bazy SQLite**
- Ścieżka operacji Read (źródło → lista → szczegóły): **Dane są pobierane z lokalnej bazy SQLite przez metodę `getCourses()` w `DatabaseService` -> Dane trafiają do listy kursów wyświetlane w widgecie `CourseList` -> Po wybraniu kursu użytkownik przechodzi do `CourseDetailsScreen`, któremu przekazywany jest wybrany obiekt `Course` -> Ekran szczegółów wykorzystuje jego dane i pobiera powiązane moduły**
- Jak odróżniasz pustą listę od błędu odczytu? **Pusta lista jest obsługiwana za pomocą isEmpty i wyświetlenie odpowiedniego komunikatu. Błąd odczytu danych powinien być obsłużony osobno i w aktualnej implementacji nie należy utożsamiać błędu odczytu z pustą listą**

**Dowody:**

- [course.dart](course_tracker/lib/models/course.dart)
- [add_course_screen.dart](course_tracker/lib/screens/add_course_screen.dart)
- [course_list.dart](course_tracker/lib/widgets/course_list.dart)
- [course_details_screen.dart](course_tracker/lib/screens/course_details_screen.dart)
- [database_service.dart](course_tracker/lib/services/database_service.dart)

## T3. Implementacja Update i Delete

1. Opisz sposób identyfikacji edytowanego rekordu i zabezpieczenie przed przypadkowym utworzeniem duplikatu.
2. Opisz, co dzieje się po zatwierdzeniu edycji i jak aktualizowane są lista oraz szczegóły.
3. Opisz sposób usuwania rekordu, ewentualne potwierdzenie i wpływ na encję powiązaną.
4. Wyjaśnij, dlaczego wybrana polityka usuwania jest właściwa dla domeny projektu.

**Odpowiedź:**

1. Każdy moduł posiada unikalny identyfikator typu `String` generowany za pomocą UUID. Podczas aktualizacji statusu ukończenia modułu przekazywany jest identyfikator, dzięki czemu modyfikowany jest istniejący rekord, a nie jest tworzony nowy. W bazie SQLite update odbywa się na podstawie warunku `WHERE id = ?` oraz `whereArgs = [moduleId]`
2. Po zmianie wartości checkboxa wywoływana jest metoda `updateModule()` z `DatabaseService`. Aktualizuje ona pole `is_completed` w odpowiednim rekordzie. Potem wywołujemy metodę `_loadModules()`, która odświeża widok za pomocą `setState()`
3. Usuwanie modułu odbywa się po kliknięciu ikony kosza. Przed wykonaniem operacji pojawia się dialog potwierdzający i ostrzegający użytkownika, że efekt jest trwały. Po wybraniu opcji "Usuń" wywołujemy metodę `deleteModule()` z `DatabaseService`, która usuwa rekord na podstawie jego UUID. Po usunięciu lista modułów jest ponownie pobierana i wyświetlana aby zapewnić aktualny widok.
4. Moduły są powiązane z kursami na pomocą obcego klucza `parent_id`, a usunięcie modułu nie powoduje usunięcia kursu. Natomiast usunięcie kursu posiadającego moduły powinno być zablokowane. Jest to właściwe rozwiązanie ponieważ kurs stanowi encję nadrzędną, a moduły przechowywują informacje o jego zawartości i postępach. Blokada zapobiegać będzie przypadkowej utracie danych.

**Dowody:**

- [course_details_screen.dart](course_tracker/lib/screens/course_details_screen.dart) - obsługa checkboxa, `_deleteModule()` i odświeżanie listy
- [database_service.dart](course_tracker/lib/services/database_service.dart) - metody związane z przechowywaniem danych (w tym `updateModule()`, `deleteModule()` i definicja klucza obcego)
- [module.dart](course_tracker/lib/models/module.dart) - identyfikator modułu i `parent_id`

## T4. Walidacja i reguła biznesowa

Wybierz **co najmniej trzy** przypadki walidacji, w tym **minimum jedną regułę biznesową z indywidualnej specyfikacji**.

| Pole / operacja  | Warunek poprawności                                      | Zachowanie przy błędzie                                                      | Lokalizacja implementacji                                                   |
| ---------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ----------- |
| Nazwa kursu      | Pole nie może być puste                                  | Wyświetlanie błędu walidacyjnego oraz blokada zapisu                         | [add_course_screen.dart](course_tracker/lib/screens/add_course_screen.dart) |
| Nazwa modułu     | Pole nie może być puste                                  | Wyświetlanie błędu walidacyjnego oraz blokada zapisu                         | [add_module_screen.dart](course_tracker/lib/screens/add_module_screen.dart) |
| Kolejność modułu | Numer kolejności musi być unikalny w ramach danego kursu | Baza SQLite odrzuca zapis naruszający zasadę UNIQUE(parent_id, module_order) | [database_service.dart](course_tracker/lib/services/database_service.dart)  | [uzupełnij] |

**Dlaczego sama blokada przycisku w UI nie wystarcza?**
Blokada przycisku w interfejsie użytkownika nie stanowi wystarczającego zabezpieczenia poprawności danych ponieważ operacje mogą być wykonywane z innych miejsc aplikacji, a dane mogą zostać zmienione poza formularzem. Dlatego ważne reguły powinny być dodatkowo sprawdzane w warstwie logiki i bazy danych

## T5. Stan aplikacji, trwałość i obsługa błędów

- Wskaż przykład stanu tymczasowego i stanu trwałego: **Stan tymczasowy to lista modułów przechowywana w zmiennej `_modules` w widgecie `CourseDetailsScreen` aktualizowana za pomocą setState() istniejąca w pamięci podczas działania ekranu. Stan trwały to dane kursów i modułów zapisane w lokalnej bazie. Pozostają przechowywane po zamknięciu i ponownym uruchomieniu aplikacji**
- Jak dane są odczytywane po ponownym uruchomieniu aplikacji? **`DatabaseService` otwiera SQLite -> dane kursów są pobierane za pomocą `getCourses()`, a moduły za pomocą `getModules(courseId)` -> Pobrane rekordy są mapowane na odpowiednie obiekty modeli oraz wyświetlane w interfejsie**
- Jak obsługujesz stany: pusto, ładowanie (jeśli operacja asynchroniczna), błąd, sukces? **Stan pusty - obsługiwany przez sprawdzenie `isEmpty`. Jeśli kurs nie zawiera modułów wyświetlany jest komunikat zachęcający do dodania pierwszego modułu. Stan ładowania - reprezentowany przez zmienną `_isLoading`. Podczas pobierania danych wyświetlamy `CircularProgressIndicator`. Stan sukcesu - poprawne pobranie danych i wyświetlenie listy modułów**
- Co stanie się, gdy zapis do magazynu danych się nie powiedzie? **W przypadku blędu SQLite operacja może zgłosić wyjątek jendak implementacja na stan 27.11.2026 nie zapewnia kompletnej obsługi wyjątków i prezentowania komunikatów o niepowodzeniach**

**Dowody:**

- [course_details_screen.dart](course_tracker/lib/screens/course_details_screen.dart) – zmienne `_modules`, `_isLoading`, metoda `_loadModules()` i obsługa pustej listy
- [database_service.dart](course_tracker/lib/services/database_service.dart) – otwieranie bazy SQLite oraz metody `getCourses()` i `getModules()`
- [course.dart](course_tracker/lib/models/course.dart) - model kursu
- [module.dart](course_tracker/lib/models/module.dart) - model modułu

## T6. Weryfikacja manualna i refleksja

Przeprowadź testy **na uruchomionej aplikacji**; w tabeli wpisz rzeczywisty wynik.

| ID  | Scenariusz i dane testowe              | Oczekiwany rezultat                                               | Faktyczny rezultat                                                | PASS/FAIL | Dowód                                                                                                                                                      |
| --- | -------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| M1  | Dodanie poprawnego rekordu             | Rekord jest widoczny po dodaniu                                   | Rekord jest widoczny po dodaniu                                   | **PASS**  | [Widok formularza](docs/screenshots/M1.png), [Widok po dodaniu rekordu](docs/screenshots/M11.png)                                                          |
| M2  | Próba dodania niepoprawnego rekordu    | Aplikacja uniemożliwia dodanie rekordu                            | Aplikacja uniemożliwia dodanie rekordu                            | **PASS**  | [Komunikat błędu](docs/screenshots/M2.png)                                                                                                                 |
| M3  | Edycja istniejącego rekordu            | Zmiany są widoczne po zapisaniu                                   | Zmiany są widoczne po zapisaniu                                   | **PASS**  | [Actions form Course Edit](docs/screenshots/M3.png), [Widoczny zapis po edycji](docs/screenshots/M31.png)                                                  |
| M4  | Usunięcie rekordu                      | Rekord zostaje usunięty z bazy danych i widoku                    | Rekord zostaje usunięty z bazy danych i widoku                    | **PASS**  | [Widok listy modułów](docs/screenshots/M4.png), [Dialog usuwający](docs/screenshots/M41.png), [Widok listy modułów po usunięciu](docs/screenshots/M42.png) |
| M5  | Restart aplikacji i odczyt danych      | Dane zostały zachowane po restarcie aplikacji - są stałe lokalnie | Dane zostały zachowane po restarcie aplikacji - są stałe lokalnie | **PASS**  | [DatabaseService.dart](coursetracker/lib/services/database_service.dart)                                                                                   |
| M6  | Przypadek naruszenia reguły biznesowej | Aplikacja chroni przed naruszeniem reguły biznesowej              | Aplikacja chroni przed naruszeniem reguły biznesowej              | **PASS**  | [Próba usunięcia kursu, który posiada moduły](docs/screenshots/M6.png)                                                                                     |

**Najtrudniejszy problem i sposób jego rozwiązania (3–6 zdań):** Najtrudniejszym problemem podczas pracy nad **LAB-03** było prawidłowe powiązanie modułów z kursami oraz zapewnienie unikalnej kolejności modułów w ramach jednego kursu. Rozwiązaniem było zastosowanie klucza obcego. Dodatkowo zaimplentowałem automatyczne wyznaczanie kolejności modułów aby uniknąć konflików numeracji.

## Podsumowanie i samoocena

- **Zaimplementowane funkcjonalności**:
  - Kompletny CRUD głownej encji
  - Zapewnienie reguł biznesowych w bazie danych
  - Obsługa błędów
  - Obsługa stanów interfejsu
- **Znane ograniczenia / błędy**:
  - Brak możliwości edycji nazwy istniejącego modułu
  - Brak automatycznego obliczania i prezentowania postępu
- **Co pozostaje do laboratorium 4:**
  - Implementacja filtrowania
  - Implementacja sortowania
  - Implementacja obliczania postępu
  - Zapewnienie reszty reguł biznesowych i zweryfikowanie ich w testach

### Kryteria zaliczenia

- Pełny CRUD głównej encji i zapis trwały; aplikacja uruchamia się i działa.
- Co najmniej jedna reguła biznesowa zgodna z przydzieloną specyfikacją.
- Obsługa błędów i czytelne stany interfejsu.
- Uzupełnione odpowiedzi oraz dowody możliwe do zweryfikowania w repozytorium.
- Wyniki testów odzwierciedlają rzeczywiste działanie; wykryte błędy nie są ukrywane.

## Użycie narzędzi AI (jeżeli dotyczy)

**Narzędzie i zakres wsparcia:**

- [ChatGPT (OpenAI)](https://chatgpt.com) - wykorzystano jako narzędzie pomocnicze podczas realizacji projektu (wyjaśnaniu działania wybranych mechanizmów Flutter i Dart, analizowaniu błędów logicznych oraz konsultowaniu sposobu implementacji poszczególnych funkcjonalności)

**Jak zweryfikowano wynik:**

- Proponowane rozwiązania weryfikowano przez samodzielną analizę kodu, testowanie aplikacji oraz konfronację z [oficjalną dokumentacja fluttera](https://docs.flutter.dev/)

**Elementy wykonane samodzielnie:**

- Projektowanie struktury aplikacji
- Implementacja modeli, ekranów i komponentów UI
- Implementacja CRUD i reguł biznesowych
- Testowanie aplikacji oraz wprowadzanie poprawek na podstawie uzyskanych wyników

**Warunki formalne:** sprawozdanie w Markdown, czytelne odnośniki do działającego kodu i diagramów, zrzuty ekranu renderujące się w repozytorium, identyfikacja autora i projektu. Oceniana jest zarówno implementacja, jak i zdolność wyjaśnienia własnych decyzji. Brak dowodów wykonania może ograniczyć liczbę punktów.
