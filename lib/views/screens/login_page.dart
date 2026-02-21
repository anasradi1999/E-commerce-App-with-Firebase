import 'package:ecommerce_app_with_firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../helper/routes.dart';
import '../widget/main_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<void> _submit(AuthController model, context) async {
  try {
    await model.submitLogin();
    Navigator.pushReplacementNamed(
      context,
      AppRouters.buttonNavbarHomePageRoutes,
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error!', style: Theme.of(context).textTheme.titleMedium),
        content: Text(
          e.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, _) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 32,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 100),

                              TextFormField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                onChanged: model.updateEmail,
                                onEditingComplete: () => FocusScope.of(
                                  context,
                                ).requestFocus(_passwordFocusNode),
                                validator: (value) =>
                                    value!.isEmpty ? 'Email is required' : null,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Theme.of(context).primaryColor,
                                  labelText: 'Email',
                                ),
                              ),

                              const SizedBox(height: 30),

                              TextFormField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                onChanged: model.updatePassword,
                                validator: (value) => value!.isEmpty
                                    ? 'Password is required'
                                    : null,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Theme.of(context).primaryColor,
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                              ),

                              const SizedBox(height: 30),

                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: Text('Forgot Password?'),
                                ),
                              ),

                              const SizedBox(height: 30),

                              MainButton(
                                text: 'LOGIN',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint('email, ${model.email}');
                                    debugPrint('password, ${model.password}');

                                    _submit(model, context);
                                  }
                                },
                              ),

                              const SizedBox(height: 20),

                              InkWell(
                                onTap: () {
                                  _formKey.currentState!.reset();
                                  Navigator.pushNamed(
                                    context,
                                    AppRouters.registerPageRoutes,
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Don\'t have an account? Register now',
                                  ),
                                ),
                              ),

                              const Spacer(),

                              Center(
                                child: Text(
                                  'Or Login with social account',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(Icons.facebook, size: 34),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.g_mobiledata,
                                      size: 46,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
