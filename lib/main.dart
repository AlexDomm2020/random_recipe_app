import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/authentication/data/authorization_repository_impl.dart';
import 'package:lyrics_app/recipe_search/data/recipe_repository_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lyrics_app/shared/ui/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RecipeRepositoryImpl>(
          create: (context) => RecipeRepositoryImpl(),
        ),
        RepositoryProvider<AuthorizationRepositoryImpl>(
          create: (context) => AuthorizationRepositoryImpl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WidgetTree(),
      ),
    );
  }
}
