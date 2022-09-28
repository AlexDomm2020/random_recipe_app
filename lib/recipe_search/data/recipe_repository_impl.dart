import 'package:lyrics_app/recipe_search/domain/entities/recipe_response.dart';
import 'package:lyrics_app/recipe_search/domain/repo/recipe_repository.dart';
import 'package:lyrics_app/service/http_service.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  @override
  Future<RecipeResponse?> getRandomRecipe() async {
    try {
      final response = await HttpService.getRequest();
      if (response.statusCode == 200) {
        final result = recipeResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw (e);
    }
  }
}
