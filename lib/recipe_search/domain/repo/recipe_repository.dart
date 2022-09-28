import '../entities/recipe_response.dart';

abstract class RecipeRepository {
  Future<RecipeResponse?> getRandomRecipe();
}
