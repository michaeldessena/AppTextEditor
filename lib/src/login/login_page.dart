import 'package:flutter/material.dart';

import '../common/names.dart';
import '../common/utils.dart';
import '../common/file_path.dart';

import '../homepage/homepage.dart';

import 'signin_page.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  final String title = LOGIN_PAGE_TITLE;

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailfield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();

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
                LOGIN_PAGE_UPPER_TEXT,
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
                    hintText: LOGIN_PAGE_HINT_EMAIL,
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 12,
              ),
              // Password Text Field
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: TextFormField(
                  controller: passwordfield,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: LOGIN_PAGE_HINT_PASSWORD,
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 24,
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
                      LOGIN_PAGE_LOGIN_BUTTON_TEXT,
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      String email = emailfield.text;
                      String password = passwordfield.text;

                      print(email);
                      print(password);

                      // TODO search user in database:
                      //    if ok pass to --> Homepage
                      //    else dispaly a message
                      User loginUser = User(email, password);
                      print(loginUser.toJson());

                      // add try to connect

                      LocalStorage loginUserStorage = LocalStorage();
                      await loginUserStorage.writeUser(loginUser);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    },
                  ),
                ),
              ),
              // white space
              const SizedBox(
                height: 15,
              ),
              // or with lines
              SizedBox(
                width: 120,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                          thickness: 1,
                        )),
                  ),
                  const Text("OR"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                          thickness: 1,
                        )),
                  ),
                ]),
              ),
              // white space
              const SizedBox(
                height: 15,
              ),
              // Signin button
              SizedBox(
                width: getScreenWidth(context) * 0.8,
                height: 60,
                child: ButtonTheme(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      LOGIN_PAGE_SIGNIN_BUTTON_TEXT,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()),
                      );
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
