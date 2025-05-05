import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/my_text_form_field.dart';
import '../../manager/user_view_modek.dart';

class LoginDetail extends StatelessWidget {
  LoginDetail({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(color: AppColors.black, fontSize: 22),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFormField(
                controller: _emailController,
                labelText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Iltimos emailni kiriting";
                  }
                  if (!value.contains("@")) {
                    return "Iltimos to'g'ri email kiriting";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(
                controller: _passwordController,
                labelText: "Parol",
                hideText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Iltimos emailni kiriting";
                  }
                  if (value.length < 6) {
                    return "Parol kamida 6 ta element bo'lishi kerak";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListenableBuilder(
                listenable: vm,
                builder: (context, child) {
                  return FilledButton(
                    onPressed: vm.isLoading
                        ? () {}
                        : () async {
                      if (_formKey.currentState!.validate()) {
                        //   malumotlarni jo'natish
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        try {
                          await vm.login(
                              email: email, password: password);
                          context.push(Routes.home);
                        } catch (e) {
                          final error = e.toString();
                          String message = error;
                          if (error.contains("INVALID_LOGIN_CREDENTIALS")) {
                            message = "Email yoki parol xato ";
                          } else if (error
                              .contains("TOO_MANY_ATTEMPTS_TRY_LATER")) {
                            message =
                            "Juda ko'p urindingiz, keyinroq qayta urinib ko'ring";
                          }
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                              SnackBar(content: Text(message)));
                        }
                      }
                    },
                    child: vm.isLoading
                        ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                        : Text("Kirish"),
                  );
                },
              ),
              SizedBox(height: 50),
              TextButton(onPressed: () {context.pop();}, child: Center(child: Text("Sign Up"),))
            ],
          ),
        ),
      ),
    );
  }
}


















