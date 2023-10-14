import 'package:flutter/material.dart';
import 'bmi.dart'; // Import your page files here
import 'bmi_meter_adult_page.dart';
import 'bmi_meter_child_page.dart';
import 'converter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Three Cards Example'),
        ),
        body: ThreeCardsPage(),
      ),
    );
  }
}

class ThreeCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('First Card: BMIPage'),
                ),
                SizedBox(height: 10),
                BMIPageContent(),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Second Card: BMI Meter Page'),
                ),
                SizedBox(height: 10),
                BMIMeterPageContent(),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Third Card: ConverterPage'),
                ),
                SizedBox(height: 10),
                ConverterPageContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BMIPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Content for BMIPage'),
          // Add your content specific to BMIPage
        ],
      ),
    );
  }
}

class BMIMeterPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Content for BMI Meter Page'),
          // Add your content specific to BMI Meter Page
        ],
      ),
    );
  }
}

class ConverterPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Content for ConverterPage'),
          // Add your content specific to ConverterPage
        ],
      ),
    );
  }
}