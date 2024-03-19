import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:expense_tracker/features/expenses/expenses.dart';
import 'injection.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 97, 183, 217),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 3, 57, 72),
);

void main() {
  // initialization
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  // run app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(
        MaterialApp(
          home: const Expenses(),
          theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
            scaffoldBackgroundColor: kColorScheme.background,
            cardTheme: const CardTheme().copyWith(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              color: kColorScheme.secondaryContainer,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
            scaffoldBackgroundColor: kDarkColorScheme.background,
            cardTheme: const CardTheme().copyWith(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              color: kDarkColorScheme.secondaryContainer.withOpacity(0.75),
            ),
          ),
        ),
      ));
}
