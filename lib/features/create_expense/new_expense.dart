import 'package:flutter/material.dart';

import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/utils.dart';

import 'package:expense_tracker/data/models/category.dart';
import 'package:expense_tracker/data/models/person.dart';
import 'package:expense_tracker/data/models/expense.dart';

class NewExpense extends StatefulWidget {
  final List<Person> _availablePersons;
  final void Function(Expense) _submitExpense;

  const NewExpense(
    this._availablePersons,
    this._submitExpense, {
    super.key,
  });

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.values[0];
  late Person _selectedPayer;

  @override
  void initState() {
    super.initState();
    _selectedPayer = widget._availablePersons[0];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );
    setState(() {
      _selectedDate = date;
    });
  }

  void _submitExpenseData() {
    final (containsError, error) = _doesFormContainError();
    if (containsError) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: Text('Invalid $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      );
      return;
    }
    // proceed with submission
    final amount = double.tryParse(_amountController.text)!;
    widget._submitExpense(
      Expense(
        title: _titleController.text,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory,
        paidBy: _selectedPayer,
      ),
    );
    // close new expense
    Navigator.pop(context);
  }

  (bool, String) _doesFormContainError() {
    if (_titleController.text.trim().isEmpty) {
      return (true, 'title');
    }
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount < 0) {
      return (true, 'amount');
    }
    if (_selectedDate == null) {
      return (true, 'date');
    }
    return (false, '');
  }

  @override
  Widget build(BuildContext context) {
    // get how much space some external elements occupy on our UI (keyboard)
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    // make the content scrollable so that there are no issues when the keyboard
    // appears if the content exceeds the screen size
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, keyboardSpace),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'EUR',
                      label: Text('Amount'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? 'Select date'
                          : dateFormatter.format(_selectedDate!)),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.displayName),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const Spacer(),
                DropdownButton(
                  value: _selectedPayer,
                  items: widget._availablePersons
                      .map(
                        (person) => DropdownMenuItem(
                          value: person,
                          child: Text('${person.firstName} ${person.lastName}'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedPayer = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  style: ButtonStyle(
                    backgroundColor: CustomMaterialColor(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: CustomMaterialColor(
                        Theme.of(context).colorScheme.onPrimary),
                  ),
                  child: const Text('Save expense'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
