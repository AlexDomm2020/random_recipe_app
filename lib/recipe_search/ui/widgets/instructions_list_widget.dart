import 'package:flutter/material.dart';
import 'package:lyrics_app/recipe_search/domain/entities/recipe_response.dart';

class InstructionsListWidget extends StatelessWidget {
  final List<AnalyzedInstruction> analyzedInstructions;
  const InstructionsListWidget({Key? key, required this.analyzedInstructions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(analyzedInstructions[0].steps[index].step),
          leading: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  "${analyzedInstructions[0].steps[index].number}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )),
        ),
        itemCount: analyzedInstructions[0].steps.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
