# PocketFlutter

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated with `brick:avilatek_readme`[^1].

{{description}}

## Table of content

- [PocketFlutter](#project_name)
  - [Table of content](#table-of-content)
  - [Getting Started 🚀](#getting-started-)
    - [FVM](#fvm)
  - [Routing with Auto Route 🧭](#rougin-with-auto-route-)
  - [Running Tests 🧪](#running-tests-)
  - [Working with Translations 🌐](#working-with-translations-)
    - [Adding Strings](#adding-strings)
    - [Adding Supported Locales](#adding-supported-locales)
    - [Adding Translations](#adding-translations)

---

## Getting Started 🚀

### FVM

This project uses FVM. In order to use the proper version of Flutter for this project, you must have installed [package:fvm](https://fvm.app/docs/getting_started/installation).

All `flutter` and `dart` commands must be run under the `fvm` command to use the proper version (examples below).

To install the proper version of Flutter, run the following command:

```sh
fvm install
```

### Flavors

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development

fvm flutter run --flavor development --target lib/main_development.dart

# Staging
fvm flutter run --flavor staging --target lib/main_staging.dart

# Production
fvm flutter run --flavor production --target lib/main_production.dart
```

_\*PocketFlutter works on iOS, Android, Web, Windows, Linux and MacOs._

---

## Routing with Auto Route 🧭

This project uses [package:auto_route](https://pub.dev/packages/auto_route) for routing. You must use the package's API for navigating between pages. Read the [documentation](https://pub.dev/documentation/auto_route/latest/) for more information.

To generate the routes run the following command:

```sh
fvm dart run build_runner build --delete-conflicting-outputs
```

To watch for changes run the following command:

```sh
fvm dart run build_runner watch --delete-conflicting-outputs
```

In order to generate a new route, add a new page and add the `@RoutePage()` annotation to the page.

```dart
@RoutePage()
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

Ensure that the build_runner is running to generate the new routes, and add the new route to the `routes/app_router.dart` file.

```dart
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // existing routes...
    AutoRoute(page: NewRoute.page) // or CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: NewRoute.page)
  ];
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
fvm flutter test --coverage --test-randomize-ordering-seed random
```

---

## Working with Translations 🌐

This project relies on [slang][flutter_localizations_link] for Internationalization.

### Adding Strings

1. To add a new localizable string, open the `en.i18n.json` file at `lib/i18n/en.i18n.json`.

```json
{
	"title": "Counter",
	"description": "Description of Counter"
}
```

2. Then add a new key/value

```json
{
	"title": "Counter",
	"description": "Description of Counter",
	"new_key": "New Value" // add the new string
}
```

3. Use the new string

```dart
import 'package:pocket_flutter/i18n/strings.g.dart';

@override
Widget build(BuildContext context) {
  return Text(t.new_key);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

  <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>it</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new `JSON`/`YAML`/`CSV`/`ARB` file in `lib/i18n/[locale].i18n.json`.

```
├── i18n
│   ├── arb
│   │   ├── en.i18n.json
│   │   └── it.i18n.json
```

2. Add the translated strings to each `.json` file:

`en.i18n.json`

```json
{
	"title": "Counter",
	"description": "Description of Counter"
}
```

`it.i18n.json`

```json
{
	"title": "Contatore",
	"description": "Descrizione del Contatore"
}
```

### Generate Translations

To generate the translations run the following command:

```sh
fvm dart pub run slang
```

This command will generate:

```
├── i18n
│   ├── strings_en.g.dart
│   ├── strings_it.g.dart
│   └── strings.g.dart
```

##### _made with ❤️ by Fres_

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://pub.dev/packages/slangflutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
