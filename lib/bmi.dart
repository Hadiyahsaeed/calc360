import 'package:calc360_app/financial_page.dart';
import 'package:calc360_app/health_page.dart';
import 'package:calc360_app/math_page.dart';
import 'package:calc360_app/other_page.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {

  int selectedCategoryIndex = 1; // Default: FITNESS AND HEALTH is selected.
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

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
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
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Weight',
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Height in feet',
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Height in inches',
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toLowerCase();
                      var ft = ftController.text.toLowerCase();
                      var inch = inController.text.toLowerCase();
                      if (wt != "" && ft != "" && inch != "") {
                        // BMI calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);
                        var msg = "";
                        result = "Your BMI is: $bmi";
                        if (bmi < 16) {
                          msg = "Severe Thinness";
                          bgColor = Colors.red;
                        } else if (bmi >= 16 && bmi < 17) {
                          msg = "Moderate Thinness";
                          bgColor = Colors.red.shade300;
                        } else if (bmi >= 17 && bmi < 18.5) {
                          msg = "Mild Thinness";
                          bgColor = Colors.yellow;
                        } else if (bmi >= 18.5 && bmi < 25) {
                          msg = "Normal";
                          bgColor = Colors.green.shade700;
                        } else if (bmi >= 25 && bmi < 30) {
                          msg = "Overweight";
                          bgColor = Colors.yellow;
                        } else if (bmi >= 30 && bmi < 35) {
                          msg = "Obese Class I";
                          bgColor = Colors.red.shade300;
                        } else if (bmi >= 35 && bmi < 40) {
                          msg = "Obese Class II";
                          bgColor = Colors.red;
                        } else {
                          msg = "Obese Class III";
                          bgColor = Colors.red.shade800;
                        }
                        setState(() {
                          result = "$msg \n Your BMI is: $bmi";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all required blanks!";
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
