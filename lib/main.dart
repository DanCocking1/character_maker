

import 'package:character_maker/models/auth.dart';

import 'package:character_maker/ui/root_page.dart';
import 'package:flutter/material.dart';




main() {
  runApp(new MaterialApp(
    title: 'Remnant Character Maker',
    home: RootPage(
      auth: new Auth(),
    ),
    routes: <String, WidgetBuilder>{
      '/root':(BuildContext context) => RootPage(),
//      'items':(BuildContext context) => ItemListPage(ChacterItems, auth);
//      '/Home':(BuildContext context) => MyApp(id),
//      'SpalshPage': (context) => SplashPage(),
//      'SignUp': (context) => SignUpPage(),
    },
  ));
}
