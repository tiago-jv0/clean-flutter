import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 4,
                color: Colors.black)
          ]),
      child: Image(
        image: AssetImage('libb/ui/assets/logo.png'),
      ),
    );
  }
}
