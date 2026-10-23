# Porównanie technologii

## Tabela porównania

|           _Kryterium_           |                              **Flutter**                               |                                            **React Native**                                             |                                   NativeScript                                   |
| :-----------------------------: | :--------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------: |
|            **Język**            |                                  Dart                                  |                                              React(JS/TS)                                               |                                      JS/TS                                       |
| **Tworzenie i renderowanie UI** |     Interfejs budowany z widżetów renderowany przez silnik Flutter     |                          Komponenty React mapujące się na natywne elementy UI                           |                Natywne kontrolki platformy sterowane przez JS/TS                 |
|   **Dostęp do natywnych API**   |   Wtyczki i platform channels umożliwiają komunikację z Kotlin/Swift   |            Biblioteki, Native Modules i Components umożliwiają dostęp do funkcji Android/iOS            |                API są udostępniane bezpośrednio środowisku JS/TS                 |
|    **Wsparcie Android/iOS**     |                        Obie platformy wspierane                        |                                        Obie platformy wspierane                                         |                             Obie platformy wspierane                             |
|          **Narzędzia**          |       Flutter SDK, CLI, Devtools, hot reload i integracje z IDE        |                         Narzędzia React Native, Metro i narzędzia środowiskowe                          |         CLI, narzędzia NativeScript i integracja z narzędziami platform          |
|         **Testowanie**          |          Testy jednostkowe, widget tests i integration tests           |                 dostępne testy JS/TS i rozwiązania testowania aplikacji na urządzeniach                 |               Testy z użyciem narzędzi JS/TS i środowisk mobilnych               |
|          **Ekosystem**          |      Pakiety dostępne w pub.dev oraz oficjalne biblioteki Flutter      |                         Ekosystem npm, biblioteki React Native i narzędzia EXPO                         |                Pakiety NativeScript i integracje z natywnymi API                 |
|    **Ograniczenia i Ryzyko**    | Własny silnik UI i wtyczki tworzące dodatkową warstwę względem systemu | Część funkcji wymaga natwynych modułów, a biblioteki mają wymagania zgodności z wersjami i architekturą | Dostęp do API nie oznacza, że każda funkcja ma gotową abstrakcję wieloplaformową |

## Ocena

1. **Flutter:**

   **Język:** Wymaga nauki nowego języka, ale zapewnia spójne środowisko programistyczne

   **Tworzenie i renderowanie UI:** Duża kontrola nad wyglądem, ale nie wszystkie elementy są widokami systemowymi

   **Dostęp do natywnych API:** Standardowe funkcje są wygodne ale własna integracja wymaga kodu platformowego

   **Wsparcie Android/iOS:** Dobry wybór do współdzielenia interfejsu i logoiki między systemami

   **Narzędzia:** Zintegrowany zestaw narzędzi ułatwia diagnostykę i rozwój

   **Testowanie:** Dobrze zdefiniowane poziomy testów (ale testowanie interakcji z natwynym UI może wymagać dodatkowych narzędzi)

   **Ekosystem:** Bogaty ekosystem, choć wybrane integracje mogą wymagać własnej wtyczki

   **Ograniczenia i ryzyko:** Większa kontrola nad wyglądem ale potencjalny narzut rozmiaru aplikacji i koniecznośc utrzymywania integracji

2. **React Native:**

   **Język:** Atrakcyjny dla zespołów webowych

   **Tworzenie i renderowanie UI:** Naturalna integracja z wyglądem i zachowaniem platformy, choć mogą występować różnice między systemami

   **Dostęp do natywnych API:** Szerokie możliwości, lecz trzeba sprawdzać zgodność bibliotek z architekturą projektu

   **Wsparcie Android/iOS:** Mocna opcja dla aplikacji mobilnych opartych na React

   **Narzędzia:** Elastyczność jest zaletą, ale wybór narzędzi zwiększa liczbę decyzji konfiguracyjnych

   **Testowanie:** Dobry wybór bibliotek, ale spójny zestaw testów wymaga świadomej konfiguracji

   **Ekosystem:** Szeroki wybór rozwiązań i duża możliwość wykorzystania kompetencji webowych

   **Ograniczenia i ryzyko:** Ryzyko zależy mocno od jakości zależności oraz kompetencji zespołu

3. **NativeScript:**

   **Język:** Dobry wybór dla osób znających JS i chcących korzystać bezpośrednio z API platform

   **Tworzenie i renderowanie UI:** Korzystne, gdy ważne jest natywne zachowanie kontrolek

   **Dostęp do natywnych API:** Elastyczne rozwiązanie, ale zaawansowane API nadal wymagają znajomości dokumentacji Androida lub iOS

   **Wsparcie Android/iOS:** Możliwa wspólna baza kodu, lecz przed wyborem trzeba zweryfikować obsługę wymaganych funkcji i urządzeń

   **Narzędzia:** Wygodne dla programistów JS/TS, lecz warto wcześniej sprawdzić aktualność używanych integracji

   **Testowanie:** Należy sprawdzić dojrzałość narzędzi dla konkretnej wersji i projektu

   **Ekosystem:** Przed wyborem trzeba staranniej zweryfikować dostępność bibliotek i aktywność ich utrzymania dla wymaganych funkcji

   **Ograniczenia i ryzyko:** Większa odpowiedzialność za weryfikację zgodności, integracji i długoterminowego utrzymania

### Pytania kontrolne:

**1. Dlaczego React Native nie jest tym samym co aplikacja webowa w WebView?**

Odpowiedź: React Native wykorzystuje komponenty, które odpowiadają natywnym elementom interfejsu systemu. Nie renderuje całego interfejsu jako strony HTML w przeglądarce osadzonej w aplikacji

[Dokumentacja React Native](https://archive.reactnative.dev/docs/next/intro-react-native-components)

**2. Czym różni się podejście Fluttera do interfejsu od React Native?**

Odpowiedź: Flutter tworzy interfejs z własnych widgetów i renderuje go przy użyciu własnego silnika graficznego podczas czy React Native wykorzystuje komponenty React, które reprezentują natywne elementy interfejsu Androida lub iOS

[FAQ Fluttera](https://docs.flutter.dev/resources/faq)

**3. Co oznacza dostęp do natywnego API w NativeScript?**

Odpowiedź: NativeScript udostępnia API systemów Android i iOS bezpośrednio w środowisku JS/TS
[Docs NativeScript](https://docs.nativescript.org/)

**4. Dlaczego liczba pobrań biblioteki nie wystarcza do oceny ryzyka technologicznego?**

Odpowiedź: Liczba pobrań informuje tylko o wykorzystaniu danego pakietu ale nie potwierdza jego jakości, bezpieczeństwa czy kompatybilnośći.
