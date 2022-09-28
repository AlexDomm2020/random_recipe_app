import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/recipe_search/data/recipe_repository_impl.dart';
import 'package:lyrics_app/recipe_search/ui/bloc/random_recipe_bloc_dart_bloc.dart';
import 'package:lyrics_app/recipe_search/ui/widgets/home_card_widget.dart';
import 'package:lyrics_app/shared/ui/widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomRecipeBlocDartBloc(
        RepositoryProvider.of<RecipeRepositoryImpl>(context),
      )..add(LoadRandomRecipeEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AppBarWidget(),
                BlocBuilder<RandomRecipeBlocDartBloc,
                    RandomRecipeBlocDartState>(
                  builder: (context, state) {
                    if (state is RandomRecipeBlocDartLoadingState) {
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    } else if (state is RandomRecipeBlocDartLoadedState) {
                      return HomeCardWidget(
                        recipe: state.recipe,
                      );
                    } else if (state is RandomRecipeBlocDartErrorState) {
                      Container();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
