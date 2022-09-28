import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/recipe_search/domain/entities/recipe_response.dart';

import '../bloc/random_recipe_bloc_dart_bloc.dart';

class IngredientListWidget extends StatefulWidget {
  final List<ExtendedIngredient> extendedIngredients;
  IngredientListWidget({Key? key, required this.extendedIngredients})
      : super(key: key);

  @override
  State<IngredientListWidget> createState() => _IngredientListWidgetState();
}

class _IngredientListWidgetState extends State<IngredientListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isColapsed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RandomRecipeBlocDartBloc>(context);

    return ExpansionTile(
      title: const Text("Ingredients"),
      textColor: Colors.pinkAccent,
      iconColor: Colors.pinkAccent,
      onExpansionChanged: (value) {
        setState(() {
          if (isColapsed) {
            _animationController.forward();
            isColapsed = false;
          } else {
            _animationController.reverse();
            isColapsed = true;
          }
        });
      },
      maintainState: true,
      leading: AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: _animationController,
      ),
      children: List.generate(
          5,
          (index) => CheckboxListTile(
                title: Text(widget.extendedIngredients[index].name),
                value: false,
                onChanged: (value) {},
              )),
    );
  }
}
