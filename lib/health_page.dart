// ignore_for_file: avoid_print

import 'package:calc360_app/bmi.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness & Health Calculators'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, "BMI Calculator", () {
           Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const BMIPage(title: "BMI Calculator"),
                          ),
                        );
            
          }),
          _buildListItem(context, "Calorie Calculator", () {
            // Handle Calorie Calculator item click here.
            print("Calorie Calculator Clicked");
          }),
          _buildListItem(context, "Body Fat Calculator", () {
            // Handle Body Fat Calculator item click here.
            print("Body Fat Calculator Clicked");
          }),
          _buildListItem(context, "BMR Calculator", () {
            // Handle BMR Calculator item click here.
            print("BMR Calculator Clicked");
          }),
          _buildListItem(context, "Ideal Weight Calculator", () {
            // Handle Ideal Weight Calculator item click here.
            print("Ideal Weight Calculator Clicked");
          }),
          _buildListItem(context, "Pace Calculator", () {
            // Handle Pace Calculator item click here.
            print("Pace Calculator Clicked");
          }),
          _buildListItem(context, "Pregnancy Calculator", () {
            // Handle Pregnancy Calculator item click here.
            print("Pregnancy Calculator Clicked");
          }),
          _buildListItem(context, "Pregnancy Conception Calculator", () {
            // Handle Pregnancy Conception Calculator item click here.
            print("Pregnancy Conception Calculator Clicked");
          }),
          _buildListItem(context, "Due Date Calculator", () {
            // Handle Due Date Calculator item click here.
            print("Due Date Calculator Clicked");
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
