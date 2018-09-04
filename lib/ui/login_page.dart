import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:character_maker/models/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType{
  login,
  register,
  googleSignIn
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = new GlobalKey<FormState>();
  String _errorMessage = '';
  String _email;
  String _password;
  String _password2;
  FormType _formType = FormType.login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Remnantd20 LogIn'),
      ),
      body: new Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset('images/moon.jpg',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,),
            ),
            Form(
              key: _formKey,
              child: ListView(
                children: buildInputs() + buildSubmitButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool _validateAndSave(){
  final form = _formKey.currentState;
  if (form.validate()){
    form.save();
    debugPrint('Form is Valid' + _email + _password);
    return true;

  }else{
    debugPrint('Form is not valid');
    return false;
  }
  }
  _validateAndSubmit() async{
    if(_validateAndSave()){
      try{
        if(_formType == FormType.login){
          String userId = await widget.auth.signInWithEmailandPassword(_email, _password);
          debugPrint('Signed in $userId');
          setState(() {
            _errorMessage = 'LoggedIn $userId';
          });
        }else{
          if (_password == _password2){
            String userId = await widget.auth.createUserWithEmailandPassword(_email, _password);
            debugPrint('Registered user $userId');
          }
          else{
            _errorMessage = 'Error: Password Fields must Match';
          }
        }
        widget.onSignedIn();

      }
      catch(e){
        setState(() {
          _errorMessage = 'Error: ' + e.message.toString();
        });
        print('Error: $e');
      }

    }
  }
  void _moveToRegister(){

    setState(() {
      _errorMessage = '';
      _formKey.currentState.reset();
      _formType = FormType.register;
    });

  }
  void _moveToLogin(){
    setState(() {
      _errorMessage = '';
      _formKey.currentState.reset();
      _formType = FormType.login;
    });
  }

  List<Widget> buildInputs() {
    if(_formType == FormType.login){
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_errorMessage,
          style: TextStyle(
            fontSize: 19.2,
            color: Colors.red
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value)=> value.isEmpty ? 'Email Cannot be Empty' : null,
                onSaved: (value) => _email = value,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value)=>value.isEmpty ? 'Password Cannot be Empty' : null,
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',

                ),
              ),
            ),
          ),
        ),
      ];
    }else{
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_errorMessage,
          style: TextStyle(
            fontSize: 19.2,
            color: Colors.red
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value)=> value.isEmpty ? 'Email Cannot be Empty' : null,
                onSaved: (value) => _email = value,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
          ),
        ),
        Padding(

          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value)=>value.isEmpty ? 'Password Cannot be Empty' : null,
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',

                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value)=>(value.isEmpty) ? 'Passwords must match' : null,
                onSaved: (value) => _password2 = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Re-Enter Password',

                ),
              ),
            ),
          ),
        ),
      ];
    }

  }
  List<Widget> buildSubmitButtons(){
    if (_formType == FormType.login){
      return[
        Center(
          child: Row(
            children: <Widget>[
              Expanded( 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.red.shade900,
                    onPressed: ()=>_validateAndSubmit(),
                    child: new Text('Login',
                      style: TextStyle(
                          fontSize: 20.0
                      ),),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: ()=> _signInWithGoogle(),
                    color: Colors.blueGrey.shade800,
                    child: Text('Sign In With Google'),

                  ),
                ),
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: _moveToRegister,
          child:  new Text('Create an Account', style: new TextStyle(fontSize: 20.0, color: Colors.white70), ),
        )
      ];
    }else{
      return[
        Center(
          child: Row(
            children: <Widget>[
              Expanded( 
                child: Padding(  
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.red.shade900,
                    onPressed: ()=>_validateAndSubmit(),
                    child: new Text('Create Account',
                      style: TextStyle(
                          fontSize: 20.0
                      ),),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => _signInWithGoogle(),
                    color: Colors.blueGrey.shade800,
                    child: Text('Sign In With Google'),

                  ),
                ),
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: _moveToLogin,
          child:  new Text('Have an account? Login!', style: new TextStyle(fontSize: 20.0, color: Colors.white70),),
        )
      ];
    }

  }
  Future<bool> _signInWithGoogle() async {
    try {
      String userId = await widget.auth.signInWithGoogle();
      if (widget.auth.currentUser() != null) {
        widget.onSignedIn();
        return true;
      } else {
        setState(() {
          _errorMessage = 'Error: No Google Sign in';
        });
        return false;
      }
    }
    catch (e) {
      _errorMessage = e.message.toString();
      return false;
    }
  }
}
