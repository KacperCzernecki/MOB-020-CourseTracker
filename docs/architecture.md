# Architecture - CourseTracker (MOB-020)

## 1. Opis architektury

CourseTracker jest aplikacją mobilną napisaną we Flutterze z wykorzystaniem języka Dart. Aplikacja umożliwia zarządzanie kursami oraz przypisanymi do nich modułami

Architektura aplikacji opiera się na prostym podziale odpowiedzialności pomiędzy interfejs użytkownika, modele danych oraz warstwę obsługi bazy danych

Dane będą przechowywane lokalnie w bazie SQLite, bez konieczności korzystania z backendu lub połączenia internetowego

## 2. Decyzje projektowe

| Decyzja                | Wybrane rozwiązanie             | Alternatywa        | Uzasadnienie                                                                                   |
| ---------------------- | ------------------------------- | ------------------ | ---------------------------------------------------------------------------------------------- |
| Zarządzanie stanem     | StatefulWidget                  | Provider, Riverpod | Aplikacja ma niewielki zakres funkcjonalny więc budowane zarządzanie stanem jest wystarczające |
| Przechowywanie danych  | sqflite                         | Hive               | Relacja Kurs 1:N Moduł wymaga odpowiedniego przechowywania powiązanych danych                  |
| Nawigacja              | Navigator + MaterialPageRoute   | AutoRoute          | Niewielka liczba ekranów nie wymaga dodatkowej biblioteki nawigacyjnej                         |
| Separacja logiki od UI | Modele danych + Database Helper | BLoC               | Oddzielenie obsługi danych od interfejsu ułatwia rozwój, utrzymanie i testowanie aplikacji     |

## 3. Struktura projektu

```
lib/
├── models/
│   ├── course.dart
│   └── module.dart
├── screens/
│   └── ...
├── widgets/
│   └── ...
├── services/
│   └── ...
└── main.dart
```

### Odpowiedzialność poszczególnych katalogów

- **models/** - definicje modeli danych
- **screens/** - ekrany aplikacji
- **widgets/** - współdzielone komponenty
- **services/** - obsługa operacji na danych
- **main.dart** - punkt wejścia aplikacji

## 4. Modele danych

### Course

| Pole   | Typ         | Opis                        |
| ------ | ----------- | --------------------------- |
| id     | String/TEXT | Unikalny identyfikator UUID |
| name   | String/TEXT | Nazwa kursu                 |
| source | String/TEXT | Źródło kursu                |

### Module

| Pole        | Typ          | Opis                            |
| ----------- | ------------ | ------------------------------- |
| id          | String/TEXT  | Unikalny identyfikator UUID     |
| parentId    | String/TEXT  | Identyfikator kursu nadrzędnego |
| name        | String/TEXT  | Nazwa modułu                    |
| order       | int/INTEGER  | Kolejność modułu w kursie       |
| isCompleted | bool/INTEGER | Informacja o ukończeniu modułu  |

### Relacja

Jeden kurs może zawierać wiele modułów (1:N)

Każdy moduł musi być przypisany do istniejącego kursu. Usunięcie kursu posiadającego moduły będzie blokowane

## 5. Przepływ danych

Podstawowy przepływ danych w aplikacji:

1. Użytkownik wykonuje akcję na ekranie
2. Ekran przekazuje żądanie do warstwy obsługi danych
3. Database Helper wykonuje odpowiednią operację na SQLite
4. Wynik operacji wraca do ekranu
5. Interfejs aktualizuje się za pomocą `setState()`

## 6. Przechowywanie danych

Do lokalnego przechowywania danych zostanie wykorzystana baza SQLite obsługiwana przez pakiet `sqflite`

Baza będzie zawierać dwie podstawowe tabele:

- `courses` - przechowuje informacje o kursach
- `modules` - przechowuje informacje o modułach i powiązaniach z kursami

Identyfikatory rekordów będą generowane lokalnie jako UUID

## 7. Walidacja i reguły biznesowe

- Nazwa kursu i modułu nie może być pusta
- Każdy moduł musi wskazywać istniejący kurs
- Kolejność modułów musi być unikalna w ramach danego kursu
- Nie można usunąć kursu, który posiada przypisane moduły
- Postęp kursu będzie obliczany na podstawie liczby ukończonych modułów

Wzór na postęp kursu:

**Postęp (%) = (liczba ukończonych modułów / liczba wszystkich modułów) × 100%**

## 8. Zakres architektury

Projekt nie przewiduje:

- komunikacji z zewnętrznym backendem
- systemu logowania i rejestracji
- synchronizacji danych z chmurą
- integracji z zewnętrznymi usługami
