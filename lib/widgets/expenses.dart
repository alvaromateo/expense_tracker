import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/category.dart';
import 'package:expense_tracker/models/person.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

const Widget noExpenses = Center(
  child: Text('No expenses found'),
);

class _ExpensesState extends State<Expenses> {
  final Person self = alvaro;
  final List<Expense> _registeredExpenses = dummyExpenseData();
  final List<Person> _registeredPersons = const [
    fede,
    alvaro,
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = noExpenses;
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openNewExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }

  void _openNewExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(_registeredPersons, _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.removeAt(expenseIndex);
    });
    // clear previous snackbar
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }
}

// Dummy data functions for testing

const Person fede = Person(
  firstName: 'Federica',
  lastName: 'Lazzeroni',
  email: 'lazzeronifederica@gmail.com',
  phoneNumber: '+393451783876',
);

const Person alvaro = Person(
  firstName: 'Alvaro',
  lastName: 'Mateo',
  email: 'alvaromoateo9@gmail.com',
  phoneNumber: '+41798460861',
);

List<Expense> dummyExpenseData() {
  return [
    Expense(
      amount: 19.99,
      title: 'Flutter course',
      category: Category.work,
      date: DateTime.now(),
      paidBy: fede,
    ),
    Expense(
      amount: 15.99,
      title: 'Cinema',
      category: Category.leisure,
      date: DateTime.now(),
      paidBy: alvaro,
    ),
  ];
}
