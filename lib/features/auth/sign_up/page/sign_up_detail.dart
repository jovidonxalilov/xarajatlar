import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/my_text_form_field.dart';
import '../../manager/user_view_modek.dart';

class SignUpDetail extends StatelessWidget {
  SignUpDetail({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: AppColors.black, fontSize: 22),
          ),
        ),
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
                height: 10,
              ),
              MyTextFormField(
                controller: _passwordConfirmController,
                labelText: "Parolni Tasdiqlang",
                hideText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Parollar bir biriga mos emas";
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
                                await vm.register(
                                    email: email, password: password);
                                context.push(Routes.home);
                              } catch (e) {
                                final error = e.toString();
                                String message = "";
                                if (error.contains("EMAIL_EXISTS")) {
                                  message = "Bu email oldin ro'yxatdan o'tgan";
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
                        : Text("Ro'yxatdan Otish"),
                  );
                },
              ),
              SizedBox(height: 50),
              TextButton(onPressed: () {context.push(Routes.login);}, child: Center(child: Text("Login"),))
            ],
          ),
        ),
      ),
    );
  }
}
















