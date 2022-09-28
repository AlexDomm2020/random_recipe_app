import 'package:lyrics_app/service/auth_service.dart';
import 'package:lyrics_app/recipe_search/ui/views/home_page.dart';
import 'package:lyrics_app/authentication/ui/views/login_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
