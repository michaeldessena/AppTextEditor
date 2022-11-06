import 'package:flutter/material.dart';
import 'package:text_editor/src/homepage/homepage.dart';

import '../common/names.dart';
import '../common/utils.dart';

import 'user.dart';
import 'checks.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  final String title = SIGNIN_PAGE_TITLE;

  @override
  State<StatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailfield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  TextEditingController passwordrepeatfield = TextEditingController();
  late bool passwordNotMatching;
  late bool emailNotValid;
  late bool passwordNotValid;

  @override
  void initState() {
    passwordNotMatching = false;
    emailNotValid = false;
    passwordNotValid = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // white space
              const SizedBox(
                height: 50,
              ),
              // Upper text
              const Text(
                SIGNIN_PAGE_UPPER_TEXT,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              // white space
              const SizedBox(
                height: 30,
              ),
              // Email Text Field
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: TextFormField(
                  controller: emailfield,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: SIGNIN_PAGE_EMAIL,
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 15,
              ),
              // Password Text Field
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: TextFormField(
                  controller: passwordfield,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: SIGNIN_PAGE_PASSWORD,
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 15,
              ),
              // Password Text Field
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: TextFormField(
                  controller: passwordrepeatfield,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: SIGNIN_PAGE_PASSWORD_REPET,
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 15,
              ),
              if (passwordNotMatching | passwordNotValid | emailNotValid)
                SizedBox(
                  child: Text(
                    (() {
                      if (emailNotValid) {
                        return SIGNIN_PAGE_TEXT_EMAIL_FORMAT_NO_VALID;
                      } else if (passwordNotValid) {
                        return SIGNIN_PAGE_TEXT_PASSWORD_FORMAT_NO_VALID;
                      } else if (passwordNotMatching) {
                        return SIGNIN_PAGE_TEXT_PASSWORD_NOT_MATCHING;
                      }
                      return SIGNIN_PAGE_GENERIC_ERROR;
                    }()),
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: passwordNotValid
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              if (passwordNotMatching | passwordNotValid | emailNotValid)
                const SizedBox(
                  height: 5,
                ),
              const SizedBox(
                height: 15,
              ),
              // Login button
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: ButtonTheme(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      SIGNIN_PAGE_SIGNIN_BUTTON_TEXT,
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      String email = emailfield.text;
                      String password = passwordfield.text;
                      String passwordrepeat = passwordrepeatfield.text;

                      print(email);
                      print(password);
                      print(passwordrepeat);

                      // check email format is ok
                      if (!isEmailValid(email)) {
                        setState(() {
                          emailNotValid = true;
                        });
                      }
                      // check password format is ok
                      else if (!isPasswordFormatOk(password)) {
                        setState(() {
                          emailNotValid = false;
                          passwordNotValid = true;
                        });
                      }
                      // check passwords are matching
                      else if (!(password == passwordrepeat)) {
                        setState(() {
                          emailNotValid = false;
                          passwordNotValid = false;
                          passwordNotMatching = true;
                        });
                      }
                      // if all check passed add the user to the database
                      // TODO: Add the database part
                      else {
                        setState(() {
                          emailNotValid = false;
                          passwordNotValid = false;
                          passwordNotMatching = false;
                        });

                        User signinUser = User(email, password);
                        print(signinUser.toJson());

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      }
                    },
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
