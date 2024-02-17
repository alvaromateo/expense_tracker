import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 97, 183, 217),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 3, 57, 72),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

// TODO: create first screen to be displayed only once to set up user profile
// TODO: control dynamically the height of new_expense so that the keyboard
// doesn't cover part of the form

