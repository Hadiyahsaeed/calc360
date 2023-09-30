import 'package:calc360_app/math_page.dart';
import 'package:calc360_app/other_page.dart';
import 'package:flutter/material.dart';
import 'financial_page.dart'; // Import your FinancialPage and HealthPage files here.
import 'health_page.dart';

class MCPage extends StatefulWidget {
  const MCPage({Key? key, required String title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MCPageState createState() => _MCPageState();
}

class _MCPageState extends State<MCPage> {
  int selectedCategoryIndex = 0; // Default: FINANCIAL CALCULATORS is selected.

  void _navigateToPage(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          if (index == 0) {
            return const FinancialPage();
          } else if (index == 1) {
            return const HealthPage();
          } else if (index == 2){
            return const MathPage(); 
          } else{
            return const OtherPage();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mortgage Calculator'),
        backgroundColor: Colors.blue.shade900, // Dark blue app bar color.
        actions: [
          // Buttons for navigation.
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategoryIndex = 0; // Select FINANCIAL CALCULATORS.
              });
              _navigateToPage(selectedCategoryIndex);
            },
            child: Text(
              'FINANCIAL CALCULATORS',
              style: TextStyle(
                color: selectedCategoryIndex == 0 ? Colors.green : Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategoryIndex = 1; // Select FITNESS AND HEALTH.
              });
              _navigateToPage(selectedCategoryIndex);
            },
            child: Text(
              'FITNESS AND HEALTH',
              style: TextStyle(
                color: selectedCategoryIndex == 1 ? Colors.green : Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategoryIndex = 2; // Select MATH.
              });
              _navigateToPage(selectedCategoryIndex);
            },
            child: Text(
              'MATH',
              style: TextStyle(
                color: selectedCategoryIndex == 2 ? Colors.green : Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategoryIndex = 3; // Select OTHER.
              });
              _navigateToPage(selectedCategoryIndex);
            },
            child: Text(
              'OTHER',
              style: TextStyle(
                color: selectedCategoryIndex == 3 ? Colors.green : Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('MCPage Content'),
      ),
    );
  }
}
