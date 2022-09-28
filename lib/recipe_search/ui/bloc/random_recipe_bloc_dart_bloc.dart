import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyrics_app/recipe_search/data/recipe_repository_impl.dart';
import 'package:lyrics_app/recipe_search/domain/entities/recipe_response.dart';

part 'random_recipe_bloc_dart_event.dart';
part 'random_recipe_bloc_dart_state.dart';

class RandomRecipeBlocDartBloc
    extends Bloc<RandomRecipeBlocDartEvent, RandomRecipeBlocDartState> {
  final RecipeRepositoryImpl _repository;

  RandomRecipeBlocDartBloc(this._repository)
      : super(RandomRecipeBlocDartLoadingState()) {
    on<LoadRandomRecipeEvent>((event, emit) async {
      emit(RandomRecipeBlocDartLoadingState());
      try {
        final recipe = await _repository.getRandomRecipe();
        emit(RandomRecipeBlocDartLoadedState(
          recipe: recipe!,
        ));
      } catch (e) {
        emit(RandomRecipeBlocDartErrorState(error: e.toString()));
      }
    });
  }
}
