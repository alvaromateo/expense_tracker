import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'injection.dart';
import 'package:expense_tracker/routes/app_router.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 97, 183, 217),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 3, 57, 72),
);

void main() async {
  // initialization
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies();

  // logging
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() => _application(), _errorHandler);
}

void _application() {
  final appRouter = AppRouter();
  // run app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(
        MaterialApp.router(
          routerConfig: appRouter.config(),
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

void _errorHandler(error, stack) => log(error.toString(), stackTrace: stack);
