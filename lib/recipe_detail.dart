import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipes/Recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail({Key? key, required this.recipe});

  @override
  State<StatefulWidget> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _slideVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(widget.recipe.imageUrl),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 16.0),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (con, index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return Text(
                          "${ingredient.quantity * _slideVal} ${ingredient.measure} ${ingredient.name}");
                    })),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_slideVal * widget.recipe.servings} servings',
              value: _slideVal.toDouble(),
              onChanged: (newVal) {
                setState(() {
                  _slideVal = newVal.round();
                });
              },
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
