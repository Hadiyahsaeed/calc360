// ignore_for_file: avoid_print

import 'package:flutter/material.dart';


class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Calculators'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, "Age Calculator", () {
            // Handle Age Calculator item click here.
            print("Age Calculator Clicked");
          }),
          _buildListItem(context, "Date Calculator", () {
            // Handle Date Calculator item click here.
            print("Date Calculator Clicked");
          }),
          _buildListItem(context, "Time Calculator", () {
            // Handle Time Calculator item click here.
            print("Time Calculator Clicked");
          }),
          _buildListItem(context, "Hours Calculator", () {
            // Handle Hours Calculator item click here.
            print("Hours Calculator Clicked");
          }),
          _buildListItem(context, "GPA Calculator", () {
            // Handle GPA Calculator item click here.
            print("GPA Calculator Clicked");
          }),
          _buildListItem(context, "Triangle Calculator", () {
            // Handle Triangle Calculator item click here.
            print("Triangle Calculator Clicked");
          }),
          _buildListItem(context, "Concrete Calculator", () {
            // Handle Concrete Calculator item click here.
            print("Concrete Calculator Clicked");
          }),
          _buildListItem(context, "Subnet Calculator", () {
            // Handle Subnet Calculator item click here.
            print("Subnet Calculator Clicked");
          }),
          _buildListItem(context, "Password Generator", () {
            // Handle Password Generator item click here.
            print("Password Generator Clicked");
          }),
          _buildListItem(context, "Conversion Calculator", () {
            // Handle Conversion Calculator item click here.
            print("Conversion Calculator Clicked");
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