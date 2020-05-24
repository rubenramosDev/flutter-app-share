import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/welcome.dart';

import 'package:fluttershare/utils/google_singin.dart';

import 'login_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*Flag to know which screen prompt up depending of the authentication of user*/
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    /*We verify whether the user already sing in or not to prompt up
    * a widget */
    return isAuth ? buildAuthScreen(context) : buildUnAuthScreen(context);
  }

  /*GoogleSignIn gives us an active listener to know when
  * the user did an authentication, so we can react to it.
  * We use that listener on the initState method, at the begining of the
  * state*/
  @override
  void initState() {
    super.initState();
    /*We verify if user had already signed in on a previous time*/
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        googleSignIn
            .signInSilently()
            .then((value) => isAuth = true)
            .catchError((val) => isAuth = false);
      },
      onError: (error) {
        print('$error');
      },
    );
  }
}
