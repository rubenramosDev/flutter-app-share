import 'package:flutter/material.dart';

import 'package:fluttershare/pages/welcome.dart';
import 'package:fluttershare/utils/google_singin.dart';

Widget buildUnAuthScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            " ¡ HeyApp !",
            style: TextStyle(
              fontFamily: "Signatra",
              fontSize: 90.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              _login(context);
            },
            child: Container(
              width: 260.0,
              height: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/google_signin_button.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

_login(BuildContext context) {
  googleSignIn.signIn().whenComplete(() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return buildAuthScreen(context);
        },
      ),
    );
  });
}
