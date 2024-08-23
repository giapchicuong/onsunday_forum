import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:onsunday_forum/utils/theme_ext.dart';

import '../../config/router.dart';
import '../../widgets/single_child_scroll_view_with_column.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _usernameController = TextEditingController();
  late final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollViewWithColumn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: context.text.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.color.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 48,
                ),
                decoration: BoxDecoration(
                  color: context.color.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          autofillHints: const [AutofillHints.username],
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _passwordController,
                          autofillHints: const [AutofillHints.newPassword],
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                          ),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: () {},
                          label: const Text('Go'),
                          icon: const Icon(Icons.arrow_forward),
                        ),
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () {
                            context.go(RouteName.register);
                          },
                          child: const Text('Don\'t have an account? Register'),
                        ),
                      ]
                          .animate(
                            interval: 50.ms,
                          )
                          .slideX(
                            begin: -0.1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 400.ms,
                          )
                          .fadeIn(
                            curve: Curves.easeInOutCubic,
                            duration: 400.ms,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
