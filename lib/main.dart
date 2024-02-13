import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    const MaterialApp(home: Expenses()),
  );
}

// TODO: create first screen to be displayed only once to set up user profile
// TODO: control dynamically the height of new_expense so that the keyboard
// doesn't cover part of the form

