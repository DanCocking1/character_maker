import 'package:character_maker/models/auth.dart';
import 'package:character_maker/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:character_maker/ui/login_page.dart';


class RootPage extends StatefulWidget {
  final BaseAuth auth;
  RootPage({this.auth});
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus{
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  void _signedOut(){
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }
  void _signedIn(){
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }
  @override
  Widget build(BuildContext context) {

    switch(_authStatus){
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,);
      case AuthStatus.signedIn:
        return new MyApp(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }


  }
}
