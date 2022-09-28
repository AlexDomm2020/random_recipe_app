part of 'random_recipe_bloc_dart_bloc.dart';

abstract class RandomRecipeBlocDartState extends Equatable {}

class RandomRecipeBlocDartLoadingState extends RandomRecipeBlocDartState {
  @override
  List<Object?> get props => [];
}

class RandomRecipeBlocDartLoadedState extends RandomRecipeBlocDartState {
  final RecipeResponse recipe;

  RandomRecipeBlocDartLoadedState({
    required this.recipe,
  });

  @override
  List<Object?> get props => [recipe];
}

class RandomRecipeBlocDartErrorState extends RandomRecipeBlocDartState {
  final String error;

  RandomRecipeBlocDartErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
