import 'package:exspenses/features/home/page/home_detail.dart';
import 'package:exspenses/features/home/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeDetail(),
        theme: ThemeData(
        ),
      ),
    );
  }
}
