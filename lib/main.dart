import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/navigation/router.dart';
import 'core/source/data_source.dart';
import 'core/source/local_datasource.dart';
import 'features/auth/manager/user_view_modek.dart';
import 'features/data/repository/auth_repository.dart';
import 'features/xarajatlar/provider.dart';

void main()  {
  // final userViewModel = UserViewModel();
  // await userViewModel.login("shahboz@gmail.com", "123456");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel(authRepository: AuthRepository(authDatasource: AuthDatasource(), authLocalDatasource: AuthLocalDatasource())),),
        ChangeNotifierProvider(create: (context) => ExpenseProvider(),)
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "GeneralSans",
                colorSchemeSeed: Colors.white,
              ),
              routerConfig: router);
        },
      ),
    );
  }
}