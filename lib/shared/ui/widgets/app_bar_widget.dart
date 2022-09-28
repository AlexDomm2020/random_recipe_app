import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/authentication/ui/bloc/bloc/authorization_bloc_bloc.dart';
import 'package:lyrics_app/authentication/ui/views/login_page.dart';
import 'package:lyrics_app/recipe_search/ui/bloc/random_recipe_bloc_dart_bloc.dart';
import 'package:lyrics_app/shared/ui/widget_tree.dart';

import '../../../authentication/data/authorization_repository_impl.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthorizationBlocBloc(
        authorizationRepositoryImpl:
            RepositoryProvider.of<AuthorizationRepositoryImpl>(context),
      ),
      child: SizedBox(
        width: double.infinity,
        height: size.width * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        onTap: () {
                          context
                              .read<AuthorizationBlocBloc>()
                              .add(SignOutEvent());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WidgetTree(),
                              ));
                        },
                        leading: Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.green[200],
                        ),
                        title: Text("Sign Out"),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "My Random Recipe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: size.width * 0.15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
