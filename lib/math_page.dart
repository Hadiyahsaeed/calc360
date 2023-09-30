// ignore_for_file: avoid_print


import 'package:flutter/material.dart';


class MathPage extends StatelessWidget {
  const MathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Calculators'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, "Scientific Calculator", () {
            // Handle Scientific Calculator item click here.
            print("Scientific Calculator Clicked");
          }),
          _buildListItem(context, "Fraction Calculator", () {
            // Handle Fraction Calculator item click here.
            print("Fraction Calculator Clicked");
          }),
          _buildListItem(context, "Percentage Calculator", () {
            // Handle Percentage Calculator item click here.
            print("Percentage Calculator Clicked");
          }),
          _buildListItem(context, "Random Number Generator", () {
            // Handle Random Number Generator item click here.
            print("Random Number Generator Clicked");
          }),
          _buildListItem(context, "Triangle Calculator", () {
            // Handle Triangle Calculator item click here.
            print("Triangle Calculator Clicked");
          }),
          _buildListItem(context, "Standard Deviation Calculator", () {
            // Handle Standard Deviation Calculator item click here.
            print("Standard Deviation Calculator Clicked");
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text, VoidCallback onTap) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: onTap,
    );
  }
}