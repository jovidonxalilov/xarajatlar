import 'package:flutter/material.dart';

import 'model/expenses_model.dart';
class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
  double get amount{
    return _expenses.fold(0.0, (sum, e) => sum + e.amount);
  }
}
