import 'package:flutter/material.dart';

enum Category {
  groceries(
    displayName: 'Groceries',
    icon: Icons.lunch_dining,
  ),
  bills(
    displayName: 'Bills',
    icon: Icons.note,
  ),
  rent(
    displayName: 'Rent',
    icon: Icons.apartment,
  ),
  leisure(
    displayName: 'Leisure',
    icon: Icons.movie,
  ),
  travel(
    displayName: 'Travel',
    icon: Icons.flight,
  ),
  work(
    displayName: 'Work',
    icon: Icons.work,
  );

  final String displayName;
  final IconData icon;

  const Category({
    required this.displayName,
    required this.icon,
  });
}
