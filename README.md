# MOB-020 CourseTracker

## Opis

**CourseTracker** to aplikacja mobilna stworzona jako projekt zaliczeniowy umożliwiająca zarządzanie kursami online oraz monitorowanie postępów w ich realizacji. Jej głównym celem jest ułatwienie organizacji nauki poprzez uporządkowaną ewidencję kursów i przypisanych do nich modułów.

## Wymagane narzędzia

1. **Wspólne dla obu platform**
   1. Flutter SDK
   2. Dart SDK
   3. Git
   4. Edytor (Android Studio/VSC z rozszerzeniami)
2. **Android:**
   1. Android Studio
   2. Android SDK i wymagane narzędzia platformy
   3. Emulator Androida lub fizyczne urządzenie
3. **iOS:**
   1. Xcode
   2. Xcode Command Line Tools
   3. iOS Simulator lub IPhone

### Sprawdzenie konfiguracji:

```
flutter --version
dart --version
flutter doctor -v
```

### Sprawdzenie zależności projektu

```
flutter pub get
```

## Instalacja i uruchomienie

1. Zainstaluj Flutter SDK zgodnie z [oficjalną dokumentacją](https://docs.flutter.dev/install)
2. Zainstaluj Git oraz edytor kodu
3. Przygotuj narzędzia wybranej platformy
   - **Android:** zainstaluj Android Studio, wymagane komponenty Android SDK oraz skonfiguruj emulator lub podłącz urządzenie fizyczne
   - **iOS:** na komputerze z systemem macOS zainstaluj Xcode i Xcode Command Line Tools, a następnie skonfiguruj iOS Simulator lub podłącz iPhone’a.
4. Sprawdź konfigurację i pobierz zależności projektu
5. **Uruchomienie aplikacji**
   _ Uruchom emulator wybranej platformy lub podłącz fizyczne urządzenie
   _ Sprawdź czy flutter wykrywa urządzenie
   `     flutter devices
    ` \* Uruchom aplikację wykonując w katalogu projektu:
   `     flutter run
    `
   Flutter uruchomi aplikację na dostępnym urządzeniu. Jeśli podłączonych jest kilka urządzeń, wybierz właściwe zgodnie z komunikatem w terminalu lub wskaż je parametrem -d

**UWAGA:** uruchamianie aplikacji na iOS wymaga komputera z systemem macOS i zainstalowanego Xcode. Aplikację na Androida można uruchomić na obsługiwanym systemie Windows, macOS lub Linux, po skonfigurowaniu Android SDK
