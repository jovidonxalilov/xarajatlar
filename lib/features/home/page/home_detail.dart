import 'package:exspenses/core/utils/app_colors.dart';
import 'package:exspenses/features/home/page/text_form_fiedl_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/expenses_model.dart';
import '../provider.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Center(child: Text("Aprel")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Umumiy Xarajatlar"),
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    40,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
                    child: Consumer<ExpenseProvider>(builder: (context, vm, _) {
                      return Text(
                        "Jami toʻlov: ${vm.amount.toStringAsFixed(2)} soʻm",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },),
                  ),
                  SizedBox(height: 130,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            40,
                          ),
                        ),
                      ),
                      child: Expanded(
                        child: Consumer<ExpenseProvider>(
                          builder: (context, expenseProvider, _) {
                            final expenses = expenseProvider.expenses;
                            return ListView.builder(
                              itemCount: expenses.length,
                              itemBuilder: (context, index) {
                                final e = expenses[index];
                                return ListTile(
                                  titleTextStyle: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  subtitleTextStyle: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  title: Text(e.name),
                                  subtitle: Text(e.type),
                                  trailing: Text(
                                    '${e.amount.toStringAsFixed(2)} soʻm',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 300,
                    height: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Column(
                        spacing: 20,
                        children: [
                          TextFormFieldWidget(
                            turi: nameController,
                            hintText: "Nomi",
                          ),
                          TextFormFieldWidget(
                            turi: typeController,
                            hintText: "Turi",
                          ),
                          TextFormFieldWidget(
                            turi: priceController,
                            hintText: "Narxi",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Consumer<ExpenseProvider>(
                              builder: (context, vm, child) {
                                print("malumotlar qo'shish $context");
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    final name = nameController.text;
                                    final type = typeController.text;
                                    final amount =
                                        double.tryParse(priceController.text) ??
                                            0.0;

                                    if (name.isNotEmpty &&
                                        type.isNotEmpty &&
                                        amount > 0) {
                                      final expense = Expense(
                                          name: name, type: type, amount: amount);
                                      vm.addExpense(expense);
                                      nameController.clear();
                                      typeController.clear();
                                      priceController.clear();
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Center(
                                    child: Text("Qo'shish"),
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
