import 'package:flutter/material.dart';

import 'package:expense_tracker/color.dart';

import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/category.dart';
import 'package:expense_tracker/data/models/person.dart';
import 'package:expense_tracker/data/models/expenses_account.dart';

import 'package:expense_tracker/features/create_expense/new_expense.dart';
import 'package:expense_tracker/features/expenses_list/expenses_list.dart';

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
  final ExpensesAccount expensesAccount = ExpensesAccount(
    title: 'Test',
    participants: [fede, alvaro],
  );
  // dummy variable to redraw widget
  int forceRedraw = 0;

  @override
  void initState() {
    super.initState();
    for (Expense expense in dummyExpenseData()) {
      expensesAccount.addExpense(expense);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Widget mainContent = noExpenses;
    if (expensesAccount.expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expensesAccount.expenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text(expensesAccount.title),
            actions: [
              IconButton(
                onPressed: _openUserProfile,
                icon: const Icon(Icons.person),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.change_circle),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.list)),
              ],
            )),
        body: TabBarView(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text('Chart'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
          ),
        ]),
        floatingActionButton: IconButton(
          iconSize: 32,
          style: ButtonStyle(
            backgroundColor: CustomMaterialColor(colorScheme.primary),
            foregroundColor: CustomMaterialColor(colorScheme.onPrimary),
          ),
          onPressed: _openNewExpense,
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _openUserProfile() {
    // ...
  }

  void _openNewExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(),
      builder: (ctx) =>
          NewExpense(expensesAccount.participants, _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      expensesAccount.addExpense(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = expensesAccount.removeExpense(expense);
    if (expenseIndex >= 0) {
      setState(() {
        forceRedraw++;
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
                expensesAccount.addExpense(expense, expenseIndex);
              });
            },
          ),
        ),
      );
    }
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
