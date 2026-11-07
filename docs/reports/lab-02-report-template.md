# Sprawozdanie — Laboratorium 2

**Przedmiot:** Budowa aplikacji mobilnych z użyciem technologii frontendowych  
**Student / identyfikator: Kacper Czernecki / 147482**  
**Projekt biznesowy: MOB-[20] — [CourseTracker]**
**Framework: [Flutter]**  
**Data zajęć: [2026-11-05]**  
**Repozytorium: [odnośnik](https://github.com/KacperCzernecki/MOB-020-CourseTracker)**  
**Commit / tag odpowiadający oddaniu:** []

## T1. Analiza podejść do tworzenia aplikacji

**Cel:** świadomy wybór podejścia w kontekście wymagań własnego projektu.

1. Wymień trzy wymagania biznesowe/niefunkcjonalne swojego projektu, które wpływają na wybór technologii.
2. Porównaj podejście natywne, hybrydowe WebView, wieloplatformowe i PWA pod kątem tych wymagań.
3. Uzasadnij, dlaczego wybrany w laboratorium 1 framework pozostaje odpowiedni, albo opisz zmianę decyzji.

| Wymaganie z projektu                       | Znaczenie dla wyboru technologii                                                                                                                                 | Wniosek                                                                                                            |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Trwały zapis danych lokalnie               | Aplikacja musi przechowywać kursy i moduły wraz z relacjami między nimi. Dane powinny być dostępne również po zamknięciu i ponownym uruchomieniu aplikacji       | Technologia powinna zapewniać obsługę lokalnej bazy danych lub trwałego magazynu danych.                           |
| Obsługa CRUD i relacji między encjami      | Aplikacja musi umożliwiać dodawanie, przeglądanie, edycję i usuwanie modułów oraz zarządzanie kursami. Konieczna jest również kontrola powiązań między rekordami | Framework powinien ułatwiać tworzenie formularzy, list, widoków szczegółowych oraz zarządzanie stanem aplikacji    |
| Responsywny i intuicyjny interfejs mobilny | Użytkownik powinien móc wygodnie zarządzać kursami i monitorować postępy na urządzeniu mobilnym. Interfejs musi być dostosowany do różnych rozmiarów ekranów     | Wybrana technologia powinna umożliwiać tworzenie responsywnych interfejsów oraz zapewniać wygodną obsługę dotykową |

**Porównanie podejść i uzasadnienie:**

1. **Podejście natywne:** Polega na tworzeniu aplikacji osobno dla konkretnego systemu operacyjnego, np. Androida lub iOS. Wykorzystuje języki i narzędzia dedykowane danej platformie
   - **Zalety:** wysoka wydajność, pełny dostęp do funkcji urządzenia, dobre dopasowanie interfejsu do systemu

   - **Wady:** konieczność tworzenia i utrzymywania osobnych wersji aplikacji, większy nakład pracy oraz znajomość różnych technologii.

   - **Ocena dla Projektu:** podejście zapewniałoby odpowiednią funkcjonalność, ale byłoby niepotrzebnie czasochłonne dla aplikacji o stosunkowo prostej logice biznesowej

2. **Podejście hybrydowe WebView:** Polega na tworzeniu interfejsu za pomocą technologii internetowych, takich jak HTML, CSS i JavaScript, a następnie uruchamianiu go wewnątrz natywnej powłoki aplikacji za pomocą WebView
   - **Zalety:** możliwość wykorzystania znanych technologii frontendowych, współdzielenie kodu oraz stosunkowo szybkie tworzenie aplikacji

   - **Wady:** zależność od komponentu WebView, możliwe ograniczenia wydajnościowe oraz konieczność korzystania z dodatkowych mechanizmów przy dostępie do funkcji urządzenia

   - **Ocena dla Projektu:** rozwiązanie jest wystarczające do obsługi formularzy, list, filtrowania i lokalnego zapisu danych

3. **Podejście wieloplatformowe:** Umożliwia tworzenie aplikacji na różne systemy operacyjne z wykorzystaniem wspólnego kodu źródłowego. Przykładami technologii są React Native i Flutter
   - **Zalety:** współdzielenie logiki biznesowej, możliwość tworzenia aplikacji na Androida i iOS oraz dostęp do funkcji urządzenia

   - **Wady:** konieczność poznania specyfiki frameworka, możliwe ograniczenia w przypadku bardziej zaawansowanych funkcji natywnych oraz zależność od dodatkowych bibliotek

   - **Ocena dla Projektu:** jest to dobre rozwiązanie, ponieważ pozwala stworzyć aplikację mobilną z rozbudowanym interfejsem, formularzami i trwałym zapisem danych bez konieczności utrzymywania dwóch niezależnych projektów

4. **PWA:** Jest to aplikacja internetowa, którą można instalować na urządzeniu i uruchamiać w sposób zbliżony do tradycyjnej aplikacji mobilnej
   - **Zalety:** wykorzystanie standardowych technologii webowych, łatwe wdrażanie aktualizacji, możliwość działania offline przy odpowiedniej konfiguracji oraz brak konieczności publikowania aplikacji w sklepach

   - **Wady:** ograniczenia dostępu do niektórych funkcji urządzenia, różnice w obsłudze poszczególnych przeglądarek i systemów operacyjnych

   - **Ocena dla Projektu:**

**Wskazane źródła (dokumentacja, artykuły techniczne):**

- ["Tworzenie aplikacji mobilnej: Główne typy i ich różnice" - Innowise.com](https://innowise.com/pl/blog/mobile-app-development-types-processes/)
- [Flutter docs](https://docs.flutter.dev/)

## T2. Projekt architektury aplikacji

**Cel:** zaprojektowanie struktury umożliwiającej dalszy rozwój i testowanie.

### T2.1. Diagram architektury

Dodaj diagram (np. Mermaid w Markdown lub obraz w `docs/diagrams/`) przedstawiający:

- ekrany i komponenty UI;
- zarządzanie stanem / logikę aplikacyjną;
- warstwę dostępu do danych;
- lokalne trwałe źródło danych;
- kierunek przepływu danych.

**Diagram / odnośnik:**

[uzupełnij]

### T2.2. Model danych

Zdefiniuj co najmniej dwie powiązane encje wynikające z indywidualnych wymagań biznesowych.

| Encja     | Pole | Typ    | Wymagane | Znaczenie |
| --------- | ---- | ------ | -------- | --------- |
| [Encja A] | [id] | [UUID] | Tak      | [opis]    |
| [Encja B] | [id] | [UUID] | Tak      | [opis]    |

**Relacja i sposób zapewnienia spójności (np. usuwanie encji nadrzędnej):**

[uzupełnij]

### T2.3. Decyzje projektowe

| Decyzja                | Wybrane rozwiązanie | Alternatywa | Uzasadnienie |
| ---------------------- | ------------------- | ----------- | ------------ |
| Zarządzanie stanem     | [ ]                 | [ ]         | [ ]          |
| Przechowywanie danych  | [ ]                 | [ ]         | [ ]          |
| Nawigacja              | [ ]                 | [ ]         | [ ]          |
| Separacja logiki od UI | [ ]                 | [ ]         | [ ]          |

**Plik `docs/architecture.md`:** [link do pliku]

## T3. Nawigacja i ekrany

**Cel:** przygotowanie struktury interfejsu aplikacji.

Zaimplementuj minimum trzy ekrany:

1. listę rekordów;
2. szczegóły wybranego rekordu;
3. formularz dodawania (może być później użyty także do edycji).

**Schemat nawigacji:**

[diagram / opis]

| Ekran     | Plik / komponent | Przejście do / z ekranu | Dowód działania |
| --------- | ---------------- | ----------------------- | --------------- |
| Lista     | [ ]              | [ ]                     | [zrzut]         |
| Szczegóły | [ ]              | [ ]                     | [zrzut]         |
| Formularz | [ ]              | [ ]                     | [zrzut]         |

**Dlaczego taki układ nawigacji jest odpowiedni dla użytkownika?**

[uzupełnij]

## T4. Operacje Create i Read

**Cel:** implementacja pierwszych operacji CRUD z trwałym przechowywaniem danych.

Zaimplementuj:

- dodanie rekordu głównej encji;
- walidację minimum dwóch pól;
- zapis rekordu w lokalnym trwałym magazynie danych;
- odczyt i wyświetlenie listy rekordów;
- otwarcie szczegółów wybranego rekordu.

**Powiązanie z wymaganiami biznesowymi (ID wymagań):** [uzupełnij]

| Operacja         | Lokalizacja kodu | Reguła walidacji / zachowanie | Wynik |
| ---------------- | ---------------- | ----------------------------- | ----- |
| Create           | [ ]              | [ ]                           | [ ]   |
| Read (lista)     | [ ]              | [ ]                           | [ ]   |
| Read (szczegóły) | [ ]              | [ ]                           | [ ]   |

**Wyjaśnij przepływ danych po naciśnięciu przycisku „Zapisz”:**

[od UI przez logikę i repozytorium do zapisu, a następnie odświeżenia widoku]

## T5. Weryfikacja działania i wnioski

Przeprowadź testy manualne i podaj rzeczywiste wyniki.

| ID    | Scenariusz                           | Oczekiwany rezultat             | Wynik (PASS/FAIL) | Dowód / uwagi |
| ----- | ------------------------------------ | ------------------------------- | ----------------- | ------------- |
| TC-01 | Dodanie poprawnego rekordu           | Rekord jest zapisany i widoczny | [ ]               | [ ]           |
| TC-02 | Próba zapisu pustego wymaganego pola | Zapis zablokowany, komunikat    | [ ]               | [ ]           |
| TC-03 | Otwarcie szczegółów rekordu          | Poprawne dane rekordu           | [ ]               | [ ]           |
| TC-04 | Ponowne uruchomienie aplikacji       | Rekord pozostaje dostępny       | [ ]               | [ ]           |
| TC-05 | Brak rekordów                        | Czytelny stan pustej listy      | [ ]               | [ ]           |

**Najważniejszy napotkany problem i sposób rozwiązania:**

[uzupełnij]

**Co wymaga dalszej pracy przed laboratorium 3?**

[uzupełnij]

**Wnioski (3–6 zdań, odnoszące się do własnej implementacji):**

[uzupełnij]

## Materiały dowodowe i historia pracy

- Issue(s): [linki]
- Pull Request(s): [linki]
- Commity związane z laboratorium: [SHA / linki]
- Diagramy: [ścieżki]
- Zrzuty ekranu: [ścieżki, np. `reports/assets/lab-02/`]
- Instrukcja uruchomienia: [link do README]

## Użycie narzędzi AI (jeżeli dotyczy)

**Narzędzie i zakres wsparcia:** [np. wyjaśnienie błędu konfiguracji / propozycja porównania]  
**Jak zweryfikowano wynik:** [dokumentacja, uruchomienie, test]  
**Elementy wykonane samodzielnie:** [opis]

**Warunki formalne:** sprawozdanie w Markdown, czytelne odnośniki do działającego kodu i diagramów, zrzuty ekranu renderujące się w repozytorium, identyfikacja autora i projektu. Oceniana jest zarówno implementacja, jak i zdolność wyjaśnienia własnych decyzji. Brak dowodów wykonania może ograniczyć liczbę punktów.
