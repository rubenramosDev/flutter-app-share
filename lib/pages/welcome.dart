import 'package:flutter/material.dart';
import 'package:fluttershare/pages/login_page.dart';

import 'package:fluttershare/utils/google_singin.dart';

Widget buildAuthScreen(BuildContext context) {
  return Container(
    color: Colors.white,
    child: RaisedButton(
      child: Text('Logout'),
      onPressed: () {
        googleSignIn
            .signOut()
            .then((value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return buildUnAuthScreen(context);
                    },
                  ),
                ))
            .catchError((onError) => print(onError));
      },
    ),
  );
}
