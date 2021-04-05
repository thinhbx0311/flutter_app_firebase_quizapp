import 'package:flutter/material.dart';
class SignButton extends StatelessWidget {
  final String button_name;

  const SignButton({Key key, this.button_name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(this.button_name,style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}
