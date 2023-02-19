import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/auth/register_page.dart';
import 'package:flutter_application_1/util/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  bool isValid = false;
  bool isObscure = true;

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_emailInputController.text.isNotEmpty &&
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: twitLightGrey,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterPage(),
              )),
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: twitBlue,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: twitBlue,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log in to Twitter.",
                  style: TextStyle(
                      color: twitBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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
                        icon: Icon(isObscure ? Icons.lock : Icons.lock_open),
                      )),
                  obscureText: isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => inputCheck(),
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: twitGrey, fontSize: 14),
                    ),
                  ),
                ),
                Center(
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
                          ? () => Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => App()),
                              (route) => false)
                          : null,
                      child: Text(
                        "Log in",
                        style: TextStyle(color: twitWhite),
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
  }
}
