// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:calc360_app/financial_page.dart';
import 'package:calc360_app/health_page.dart';
import 'package:calc360_app/math_page.dart';
import 'package:calc360_app/other_page.dart';
import 'package:flutter/material.dart';

import 'bmi_meter_adults.dart';
import 'bmi_meter_child.dart';

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

                      // Parse age as an integer
                      var iAge = int.tryParse(age) ?? 0;

                      // Check if the age is within the specified range
                      if (iAge >= 0 && iAge <= 120) {
                        var iWt = int.tryParse(wt) ?? 0;
                        var iFt = int.tryParse(ft) ?? 0;
                        var iInch = int.tryParse(inch) ?? 0;
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);

                        result = "Your BMI is: $bmi";
                        if (iAge >= 20) {
                          if (bmi < 16) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result = 'Severe Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 16 && bmi < 17) {
                            bgColor = Colors.red.shade200;
                            setState(() {
                              result = 'Moderate Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 17 && bmi < 18.5) {
                            bgColor = Colors.orange.shade200;
                            setState(() {
                              result = 'Mild Thinness\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 18.5 && bmi < 25) {
                            bgColor = Colors.green.shade400;
                            setState(() {
                              result = 'Normal\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 25 && bmi < 30) {
                            bgColor = Colors.yellow.shade400;
                            setState(() {
                              result = 'Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 30 && bmi < 35) {
                            bgColor = Colors.red.shade200;
                            setState(() {
                              result = 'Obese Class I\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi >= 35 && bmi < 40) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result = 'Obese Class II\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            bgColor = const Color.fromARGB(255, 141, 14, 14);
                            setState(() {
                              result = 'Obese Class III\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          }
                        } else {
                          if (bmi <= 15.5) {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result = 'Underweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi > 15.5 && bmi <= 22) {
                            bgColor = Colors.green.shade400;
                            setState(() {
                              result = 'Healthy Weight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else if (bmi > 22 && bmi <= 25.5) {
                            bgColor = Colors.orange.shade400;
                            setState(() {
                              result = 'At Risk of Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            bgColor = Colors.red.shade400;
                            setState(() {
                              result = 'Overweight\nYour BMI is: ${bmi.toStringAsFixed(2)}';
                            });
                          }
                        }
                      } else {
                        setState(() {
                          result = "Age should be between 0 and 120";
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

                      var iWt = int.tryParse(wt) ?? 0;
                      var iFt = int.tryParse(ft) ?? 0;
                      var iInch = int.tryParse(inch) ?? 0;
                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);

                      var iAge = int.tryParse(age) ?? 0;

                      if (iAge > 20) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMIMeterAdultPage(
                              title: 'Adults Meter',
                              bmi: bmi,
                              result: result,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMIMeterChildPage(
                              title: 'Children Meter',
                              bmi: bmi,
                              result: result,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('View Meter'),
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