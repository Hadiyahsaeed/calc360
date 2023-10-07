// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:calc360_app/bmi_meter.dart';
import 'package:calc360_app/financial_page.dart';
import 'package:calc360_app/health_page.dart';
import 'package:calc360_app/math_page.dart';
import 'package:calc360_app/other_page.dart';
import 'package:flutter/material.dart';
 // Import the file with BMIMeter


class BMIPage extends StatefulWidget {
  const BMIPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  int selectedCategoryIndex = 1; // Default: FITNESS AND HEALTH is selected.
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var ageController = TextEditingController();
  var result = "";
  var bgColor;

  void _navigateToPage(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          if (index == 0) {
            return const FinancialPage();
          } else if (index == 1) {
            return const HealthPage();
          } else if (index == 2) {
            return const MathPage();
          } else {
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
          child: SizedBox(
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
                  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Age',
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toLowerCase();
                      var ft = ftController.text.toLowerCase();
                      var inch = inController.text.toLowerCase();
                      var age = ageController.text.toLowerCase();
                      // ignore: unnecessary_null_comparison
                      if (wt != "" && ft != "" && inch != "" && age != null) {
                        // BMI calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);

                        var iAge = int.parse(age);

                        result = "Your BMI is: $bmi";
                        if (iAge >= 20) {
                          if (bmi < 16) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result =
                                  'Severe Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 16 && bmi < 17) {
                            bgColor = Colors.red.shade200;
                            setState(() {
                              result =
                                  'Moderate Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 17 && bmi < 18.5) {
                            bgColor = Colors.orange.shade200;
                            setState(() {
                              result =
                                  'Mild Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 18.5 && bmi < 25) {
                            bgColor = Colors.green.shade400;
                            setState(() {
                              result = 'Normal\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 25 && bmi < 30) {
                            bgColor = Colors.yellow.shade400;
                            setState(() {
                              result =
                                  'Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 30 && bmi < 35) {
                            bgColor = Colors.red.shade200;
                            setState(() {
                              result =
                                  'Obese Class I\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 35 && bmi < 40) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result =
                                  'Obese Class II\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            bgColor = const Color.fromARGB(255, 141, 14, 14);
                            setState(() {
                              result =
                                  'Obese Class III\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          }
                        } else {
                          // Calculate BMI categories based on age for age < 20
                          if (bmi <= 15.5) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result =
                                  'Underweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi > 15.5 && bmi <= 22) {
                            bgColor = Colors.green.shade400;
                            setState(() {
                              result =
                                  'Healthy Weight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi > 22 && bmi <= 25.5) {
                            bgColor = Colors.orange.shade400;
                            setState(() {
                              result =
                                  'At Risk of Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result =
                                  'Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          }
                        }
                      } else {
                        setState(() {
                          result = "Please fill all required fields!";
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
 onPressed: () {
  var wt = wtController.text.toLowerCase();
                      var ft = ftController.text.toLowerCase();
                      var inch = inController.text.toLowerCase();
                      var age = ageController.text.toLowerCase();

                      var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);

                        var iAge = int.parse(age);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BMIMeter(
        bmiValue: bmi,    // Use the 'bmi' variable here
        isAbove20: true,  // Example age condition, you can replace this with the actual condition
        iAge: iAge,        // Example age, you can replace this with the actual age
      ),
    ),
  );
},

  child: const Text('Open BMI Meter'),
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
