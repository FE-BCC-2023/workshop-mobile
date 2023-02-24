import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth/auth_bloc.dart';
import 'package:flutter_application_1/ui/auth/login_page.dart';
import 'package:flutter_application_1/util/app_color.dart';
import 'package:flutter_application_1/util/reuse_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  bool isValid = false;
  bool isObscure = true;

  @override
  void dispose() {
    _usernameInputController.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_usernameInputController.text.isNotEmpty &&
        _emailInputController.text.isNotEmpty &&
        _passwordInputController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthEror){
          ReuseableWidget.showSnackBar(context, state.eror);
        }
        else if(state is RegisterSuccess){
          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => LoginPage()),
                              (route) => false);
        }
      },
      builder: (context, state) {
        if(state is AuthLoading){
          return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: twitWhite,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: FaIcon(
              FontAwesomeIcons.twitter,
              color: twitBlue,
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your account",
                      style: TextStyle(
                          color: twitBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _usernameInputController,
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => inputCheck(),
                    ),
                    TextField(
                      controller: _emailInputController,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => inputCheck(),
                    ),
                    TextField(
                      controller: _passwordInputController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon:
                                Icon(isObscure ? Icons.lock : Icons.lock_open),
                          )),
                      obscureText: isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => inputCheck(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                              onPrimary: twitBlue,
                            ),
                            onPressed: isValid
                                ? () {
                                    context.read<AuthBloc>().add(RegisterEvent(
                                        email: _emailInputController.text,
                                        password:
                                            _passwordInputController.text));
                                  }
                                : null,
                            child: Text(
                              "Create account",
                              style: TextStyle(color: twitWhite),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
