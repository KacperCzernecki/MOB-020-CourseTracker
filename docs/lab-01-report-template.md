# Sprawozdanie — Laboratorium 1

**Przedmiot:** Budowa aplikacji mobilnych z użyciem technologii frontendowych  
**Student / identyfikator: Kacper Czernecki / 147482**  
**Projekt biznesowy: MOB-[20] — [CourseTracker]**
**Framework: [Flutter]**  
**Data zajęć: [2026-10-22]**  
**Repozytorium: [odnośnik](https://github.com/KacperCzernecki/MOB-020-CourseTracker)**  
**Commit / tag odpowiadający oddaniu:** [168edc3]

> Wypełnij na podstawie własnych działań. Odpowiedzi powinny zawierać dowody (pliki, commity, PR, wyniki uruchomienia), nie same deklaracje.

## 1. Cel laboratorium

[Własnymi słowami: jakie kompetencje i rezultaty zostały osiągnięte?]

Celem tego labolatorium było porównanie najpopularniejszych technologii moblinych, wybranie jednego z nich oraz rozpoczęcie pracy z nim zgodnie z dokumentacją dostępną na oficjalnych stronach owych technologii. Labolatorium również przypomniało nam pracę z systemem kontroli wersji Git.

Rezultatem tych zajęć jest gotowy szkielet aplikacji oraz domyślny ekran startowy oferowany przez wydawców oraz scommitowanie ich na githuba. Dzięki temu zadaniu poszerzyliśmy umiejętność krytycznego myślenia, wnioskowania oraz dokładnego czytania dokumentacji.

## 2. Analiza technologii

**Dokument:** `docs/technology-comparison.md`  
**Najważniejsze różnice:** Wybór technologii zależy od wymagań projektu, kompetencji zespołu i dostępności bibliotek. Flutter sprawdzi się, gdy istotna jest spójność interfejsu na Androidzie i iOS, natomiast React Native będzie dobrym wyborem dla zespołów znających JavaScript/TypeScript i React. NativeScript warto rozważyć, gdy kluczowy jest bezpośredni dostęp do natywnych API, po wcześniejszym sprawdzeniu dojrzałości ekosystemu i potrzebnych integracji. Przy ocenie ryzyka należy uwzględnić nie tylko dostępność bibliotek, ale również ich bezpieczeństwo, kompatybilność z używanymi wersjami oraz aktywność utrzymania. Ostateczna decyzja powinna uwzględniać także możliwości testowania, jakość narzędzi i długoterminowe koszty rozwoju aplikacji.

**Źródła:**

[Dokumentacja Fluttera](https://docs.flutter.dev/)

[Dokumentacja React Native](https://reactnative.dev/docs/getting-started)

[Dokumentacja NativeScript](https://docs.nativescript.org/)

## 3. Decyzja technologiczna

**Dokument:** `docs/technology-decision.md`  
**Wymagania karty MOB-XXX wpływające na wybór:**

1. **MOB-020-FR-01 – Pełny CRUD modułów:** Flutter umożliwia tworzenie formularzy, list i widoków szczegółowych za pomocą widgetów, co ułatwia implementację dodawania, edycji, wyświetlania i usuwania modułów.

2. **MOB-020-FR-10 – Obliczanie postępu:** Dart pozwala wydzielić logikę obliczania postępu do osobnych funkcji, dzięki czemu można łatwo testować poprawność wyników oraz obsłużyć kursy bez modułów.

3. **MOB-020-FR-11 – Trwałość danych:** Flutter umożliwia integrację z lokalną bazą SQLite, co pozwala przechowywać kursy, moduły i ich relacje również po ponownym uruchomieniu aplikacji, bez konieczności tworzenia backendu.

**Dlaczego wybrano framework:** Flutter został wybrany ze względu na możliwość tworzenia spójnego interfejsu użytkownika, wygodną implementację logiki biznesowej oraz dostępność narzędzi do testowania aplikacji. Widgety Fluttera ułatwiają przygotowanie formularzy, list i widoków szczegółowych, a język Dart pozwala uporządkować operacje CRUD, walidację danych i obliczanie postępu kursów. Integracja z SQLite umożliwia lokalne i trwałe przechowywanie danych bez konieczności korzystania z serwera.

**Rozważona alternatywa:** Rozważaną alternatywą był React Native z TypeScript, który pozwoliłby mi na wykorzystanie wiedzy z zakresu JS'a, TS'a i React'a. Kompromisem jest konieczność odpowiedniego doboru biblioteki do obsługi lokalnej bazy danych oraz sprawdzenia jej zgodności z wykorzystywaną architekturą projektu.

**Ryzyka:**

1. **Konieczność nauki języka Dart od zera**
2. **Niepoprawność danych i relacji**
3. **Zależność od zewnętrznych bibliotek**

## 4. Konfiguracja środowiska

| Narzędzie                   | Wersja                                   | Rola                                                         |
| --------------------------- | ---------------------------------------- | ------------------------------------------------------------ |
| System operacyjny           | Windows 11                               | Środowisko do tworzenia, uruchamiania i testowania aplikacji |
| Framework / SDK             | Flutter SDK – wersja stabilna            | Tworzenie aplikacji mobilnej na Androida i iOS               |
| Runtime / menedżer pakietów | Dart SDK (dołączony do Flutter SDK), Pub | Język programowania oraz zarządzanie zależnościami projektu  |
| Emulator / urządzenie       | Android Studio Rabbit 1                  | Uruchamianie aplikacji i testowanie jej działania            |
| Edytor / IDE                | VSC                                      | Pisanie kodu, debugowanie i zarządzanie projektem            |

**Polecenia uruchomienia:** Odwołuję do ostatniego headera README.md

**Wynik uruchomienia:**

Aplikacja początkowa została uruchomiona na Emulatorze Pixel 10

[Zrzut Ekranu](https://imgur.com/a/ueuHLei)

**Weryfikacja po zmianie ekranu:** Zmieniono props MyHomePage z "Flutter Demo Home Page" na "CourseTracker MOB-020". Po HotReloadzie header homepage'a zmienił tekst.

[Zrzut Ekranu](https://imgur.com/a/Qj3Agm7)

## 5. Praca z Git

- **Issue:** [link](https://github.com/KacperCzernecki/MOB-020-CourseTracker/issues/1)
- **Gałąź:** [feature/initial-screen](https://github.com/KacperCzernecki/MOB-020-CourseTracker/tree/feature/initial-screen)
- **Pull Request:** [link](https://github.com/KacperCzernecki/MOB-020-CourseTracker/pull/2)
- **Commit(y):**

[e5fd5e8](https://github.com/KacperCzernecki/MOB-020-CourseTracker/commit/e5fd5e8a2a403d74edbd4924497f6924882d81fb)

[7238318](https://github.com/KacperCzernecki/MOB-020-CourseTracker/commit/72383185c7cf0163ef68834c52bc4163e3b22b79)

[174422a](https://github.com/KacperCzernecki/MOB-020-CourseTracker/commit/174422ab49088493dcc158dda01686357684c437)

_Commity, które nie mają znaczącego wpływu zostały pominięte w tym sprawozdaniu_

- **Samoocena PR:**

Sprawdzono:
_ Poprawność kodu poleceniem `flutter analyze`
_ Pobieranie zależności poleceniem `flutter pub get`
_ Uruchamianie aplikacji na dostępnej platformie
_ Zweryfikowano zmiany w Git oraz upewniono się, że PR zawiera tylko pliki związane z projektem
_ Zweryfikowano brak konfliktów
_ Zgodność wprowadzonych zmian z wymaganiami projektu

- **Stan `main` po scaleniu:** [wynik](https://github.com/KacperCzernecki/MOB-020-CourseTracker)

## 6. Dyskusja

**Wybór technologii dla scenariusza zespołu:** Flutter  
**Dwa argumenty:**

1. Flutter umożliwia tworzenie aplikacji moblinych na Androida i iOS z wykorzystaniem wspólnego kodu co ułatwia utrzymywanie aplikacji
2. Flutter pozwala na budowanie spójnego i responsywnego interfejsu oraz integrację z lokalna baza SQLite
   **Największe ryzyko:** Koniecznośc poznania języka Dart i specyfiki Fluttera oraz prawidłowego skonfigurowania lokanlej bazy danych i relacji między kursami a modułami
   **Co mogłoby zmienić decyzję:** Zmiana wymagać na aplikację webową lub zbyt wielke problemy z poznaniem nowego języka

## 7. Problemy i rozwiązania

| Problem / objaw                                                                                   | Hipoteza przyczyny                                                                    | Działanie                                                                                                          | Wynik                                                                                                   |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| Brak wystarczającej ilości miejsca na dysku do zainstalowania Android Studio i emulatora Androida | Duży rozmiar środowiska programistycznego, Android SDK oraz obrazów systemu emulatora | Zweryfikowano dostępne miejsce na dysku i podjęto działania w celu zwolnienia przestrzeni potrzebnej do instalacji | Przygotowanie środowiska wymagało dodatkowego miejsca na dysku i opóźniło konfigurację                  |
| Utworzenie dwóch Pull Requestów zamiast jednego z powodu pracy na niewłaściwej gałęzi Git         | Zapomniano przełączyć się na odpowiedni branch przed rozpoczęciem pracy nad zmianami  | Sprawdzono stan repozytorium i gałęzie, a następnie uporządkowano zmiany oraz Pull Requesty                        | Zidentyfikowano przyczynę problemu. Na przyszłość należy sprawdzać aktualną gałąź poleceniem git branch |

## 8. Wnioski

1. Flutter umożliwia tworzenie aplikacji na Androida i iOS przy użyciu wspólnego kodu w języku Dart. Poznałem również podstawowe narzędzia potrzebne do konfiguracji środowiska oraz znaczenie Git w zarządzaniu wersjami projektu.
2. Założenie, że przygotowanie środowiska programistycznego będzie szybkie i bezproblemowe, okazało się nietrafne ze względu na duże wymagania dotyczące miejsca na dysku przy instalacji Android Studio i emulatora. Dodatkowo muszę lepiej pilnować przełączania się na właściwe gałęzie Git przed rozpoczęciem pracy, aby uniknąć niepotrzebnego tworzenia kilku Pull Requestów.
3. Dokończyć konfigurację środowiska Flutter i Android SDK, sprawdzić poprawność działania poleceń flutter doctor oraz flutter analyze, a także upewnić się, że aplikacja uruchamia się na emulatorze lub urządzeniu fizycznym. Przygotować strukturę projektu CourseTracker i zapoznać się z obsługą lokalnej bazy danych SQLite.

## 9. Użycie narzędzi AI (jeżeli dotyczy)

**Narzędzie i zakres wsparcia:** Wykorzystano ChatGPT do wyjaśnienia problemów związanych z obsługą Git oraz Android Studio. Narzędzie nieznacznie pomagało w przygotowywaniu dokumentacji projektu.  
**Jak zweryfikowano wynik:** Proponoiwane polecenia Git porównano z aktualnym stanem repo i komunikatami terminala
**Elementy wykonane samodzielnie:** Samodzielnie przeczytano dokumentacje i wysnuto wnioski na temat technologii. Tak jak i samodzielnie wykonano instalację Fluttera i skonfigurowano środowisko programistyczne.

## 10. Checklista oddania

- [x] Porównanie trzech frameworków.
- [x] ADR wyboru technologii.
- [x] Uruchomiona aplikacja i instrukcja w README.
- [x] Issue, gałąź i scalony PR.
- [x] Linki do dowodów i historia pracy.
- [x] Problemy, wnioski i deklaracja AI (jeżeli dotyczy).
