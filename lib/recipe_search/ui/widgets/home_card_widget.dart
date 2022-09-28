import 'package:flutter/material.dart';
import 'package:lyrics_app/recipe_search/ui/widgets/home_rounded_icon_widget.dart';
import 'package:lyrics_app/recipe_search/ui/widgets/ingredient_list_widget.dart';
import 'package:lyrics_app/recipe_search/ui/widgets/instructions_list_widget.dart';

import '../../domain/entities/recipe_response.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({Key? key, required this.recipe}) : super(key: key);

  final RecipeResponse recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 300,
            height: 200,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  recipe.recipes[0].image,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      recipe.recipes[0].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedIconWidget(
              color: Colors.orange,
              icon: Icons.attach_money,
              title: "Price \$${recipe.recipes[0].pricePerServing.toString()}",
            ),
            RoundedIconWidget(
              color: Colors.red,
              icon: Icons.favorite,
              title: "Likes ${recipe.recipes[0].aggregateLikes.toString()}",
            ),
            RoundedIconWidget(
              color: Colors.purple,
              icon: Icons.timer,
              title:
                  "Ready in ${recipe.recipes[0].readyInMinutes.toString()} minutes",
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Ingredients",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        IngredientListWidget(
            extendedIngredients: recipe.recipes[0].extendedIngredients),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Instructions",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        InstructionsListWidget(
          analyzedInstructions: recipe.recipes[0].analyzedInstructions,
        )
      ],
    );
  }
}
