import 'package:flutter/material.dart';

class RecipesDetailsScreen extends StatefulWidget {
  const RecipesDetailsScreen({super.key});

  @override
  State<RecipesDetailsScreen> createState() => _RecipesDetailsScreenState();
}

class _RecipesDetailsScreenState extends State<RecipesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('RecipesDetailsScreen'),
      ),
    );
  }
}