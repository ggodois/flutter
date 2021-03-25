import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String pwd;

  Future<bool> loginUser() async {
    bool logged = false;
    try {
      final result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      if (result != null) {
        logged = true;
      }
    } catch (e) {
      print(e);
    }
    return logged;
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Error'),
        content: Text('Wrong email or password!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Got it'),
          ),
        ],
        elevation: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  pwd = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                btnColor: Colors.lightBlueAccent,
                btnTitle: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  final logged = await loginUser();
                  if (logged) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  } else {
                    print('error');
                    _showDialog();
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
