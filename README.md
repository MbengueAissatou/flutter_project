# DoctorPoint

Application mobile Flutter de gestion hospitalière (mock backend inclus).

## Stack
- Flutter 3.x / Dart 3.x
- Clean Architecture (Data/Domain/Presentation)
- flutter_bloc, go_router (ShellRoute + guards), dio, hive, secure storage, get_it, dartz, fl_chart, firebase_messaging

## Installation
1. Installer Flutter 3.x
2. `flutter pub get`
3. `flutter run`

## Comptes mock
- Email: `admin@doctorpoint.sn`
- Mot de passe: `password123`

## Architecture
- `lib/core` : design system, thème, réseau, erreurs
- `lib/features` : modules (auth, dashboard, rdv, patients, médecins, consultations, stock, notifications, paramètres)
- `lib/shared/mock_data.dart` : données sénégalaises mock prêtes à remplacer par API Dio.

## Tests
- `flutter test test/unit/login_usecase_test.dart`
- `flutter test test/unit/auth_bloc_test.dart`
