import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttershare/utils/GoogleSingin.dart';

//final GoogleSignIn googleSignIn = GoogleSignIn();

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
    return isAuth ? _buildAuthScreen() : _buildUnAuthScreen();
  }

  Widget _buildAuthScreen() {
    return Container(
      color: Colors.white,
      child: RaisedButton(
        child: Text('Logout'),
        onPressed: () {
          print('Presionando');
          _logout();
        },
      ),
    );
  }

  Widget _buildUnAuthScreen() {
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
                _login();
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

  /*GoogleSignIn gives us an active listener to know when
  * the user did an authentication, so we can react to it.
  * We use that listener on the initState method, at the begining of the
  * state*/
  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        _handleSignIn(account);
      },
      onError: (error) {
        print('$error');
      },
    );
    /*Reauthenticate user when app is open*/
//    googleSignIn.signInSilently(suppressErrors: false).then((account) {
//      _handleSignIn(account);
//    }).catchError((onError) {
//      print('Error: $onError');
//    });
  }

  _login() {
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return _buildAuthScreen();
          },
        ),
      );
    });
  }

  _logout() {
    signOutGoogle();
  }

  _handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('User singed in: $account');
      setState(() {
        isAuth = true;
      });
    }
  }
}
