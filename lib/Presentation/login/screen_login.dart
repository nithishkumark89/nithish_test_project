import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Database/login.dart';
import 'bloc/login_bloc.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text('Skip', style: TextStyle(fontSize: 18)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(ApiService()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('Assets/img.png'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Email TextField
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password TextField with visibility toggle
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return TextField(
                            controller: _passwordController,
                            obscureText:
                                state is PasswordInitial && state.isObscured,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: InputBorder.none,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.white),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state is PasswordInitial && state.isObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(TogglePasswordVisibility());
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),

                      // Login Button with Loading State
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            _showDialog(context, 'Success', state.message);
                          } else if (state is LoginFailure) {
                            _showDialog(context, 'Error', state.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          }

                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(size.width / 1.3, 20)),
                            onPressed: () {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginSubmitted(
                                  _emailController.text,
                                  _passwordController.text,
                                ),
                              );
                            },
                            child: const Text('Login'),
                          );
                        },
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Don't Have an account",
                          children: [
                            TextSpan(
                              text: 'Create Account',
                              style: TextStyle(color: Colors.white),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
