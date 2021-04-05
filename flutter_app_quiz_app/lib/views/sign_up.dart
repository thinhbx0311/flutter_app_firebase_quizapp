import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_app/services/auth.dart';
import 'package:flutter_app_quiz_app/views/login_view.dart';
import 'package:flutter_app_quiz_app/widgets/app_bar.dart';
import 'package:flutter_app_quiz_app/widgets/sign_button.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  bool _isLoading = false;
  AuthService authService = new AuthService();
  signUp() async{
    if (_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.signUpWithEmailAndPassword(email, password).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      });

    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Spacer(),
            TextFormField(
              validator: (val) {
                return val.isEmpty ? "Enter Name" : null;
              },
              decoration: InputDecoration(hintText: "Name"),
              onChanged: (val){
                name = val;
              },
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (val) {
                return val.isEmpty ? "Enter Email" : null;
              },
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (val){
                email = val;
              },
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (val) {
                return val.isEmpty ? "Enter Password" : null;
              },
              decoration: InputDecoration(hintText: "Password"),
              onChanged: (val){
                password = val;
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                signUp();
              },
              child: SignButton(button_name: 'Sign Up'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account?',
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                ),
                GestureDetector(
                  child: Text('Sign In',
                      style: TextStyle(
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                          fontSize: 17)),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )
              ],
            ),
            SizedBox(height: 80,)
          ]),
        ),
      ),
    );
  }
}
