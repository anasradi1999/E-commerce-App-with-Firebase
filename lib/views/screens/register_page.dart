import 'package:flutter/material.dart';

import '../../helper/routes.dart';
import '../widget/main_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();


  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                            'Sign Up',
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 100),

                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            onEditingComplete: ()=> FocusScope.of(context).requestFocus(_nameFocusNode),
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
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            onEditingComplete: ()=> FocusScope.of(context).requestFocus(_passwordFocusNode),
                            validator: (value) =>
                            value!.isEmpty ? 'Name is required' : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Theme.of(context).primaryColor,
                              labelText: 'Name',
                            ),
                          ),

                          const SizedBox(height: 30),

                          TextFormField(
                            controller: _passwordController,
                            validator: (value) =>
                            value!.isEmpty ? 'Password is required' : null,
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
                              onTap: () {
                                _formKey.currentState!.reset();
                                Navigator.pushReplacementNamed(context, AppRouters.loginPageRoutes);
                              },
                              child: Text('have an account? Login'),
                            ),
                          ),

                          const SizedBox(height: 30),

                          MainButton(text: 'Sign Up', onTap: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint('Sign Up');
                            }
                          }),


                          const Spacer(),

                          Center(
                            child: Text(
                              'Or sign up with social account',
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
                                  child: const Icon(Icons.facebook, size: 34)),
                              const SizedBox(width: 16),
                              Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(Icons.g_mobiledata, size: 46)),
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
  }
}
