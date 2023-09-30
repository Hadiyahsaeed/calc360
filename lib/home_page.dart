// ignore_for_file: avoid_print

import 'package:calc360_app/financial_page.dart';
import 'package:calc360_app/mortgage_calculator.dart';
import 'package:flutter/material.dart';
import 'bmi.dart';
import 'health_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc360',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> financialCalculators = [
    "Mortgage Calculator",
    "Loan Calculator",
    "Auto Loan Calculator",
    "Interest Calculator",
    "Payment Calculator",
    "Retirement Calculator",
    "Amortization Calculator",
    "Investment Calculator",
    "Inflation Calculator",
    "Finance Calculator",
    "Income Tax Calculator",
    "Compound Interest Calculator",
    "Salary Calculator",
    "Interest Rate Calculator",
    "Sales Tax Calculator",
  ];

  final List<String> healthCalculators = [
    "BMI Calculator",
    "Calorie Calculator",
    "Body Fat Calculator",
    "BMR Calculator",
    "Ideal Weight Calculator",
    "Pace Calculator",
    "Pregnancy Calculator",
    "Pregnancy Conception Calculator",
    "Due Date Calculator",
  ];

  final List<String> mathCalculators = [
    "Scientific Calculator",
    "Fraction Calculator",
    "Percentage Calculator",
    "Random Number Generator",
    "Triangle Calculator",
    "Standard Deviation Calculator",
  ];

  final List<String> otherCalculators = [
    "Age Calculator",
    "Date Calculator",
    "Time Calculator",
    "Hours Calculator",
    "GPA Calculator",
    "Grade Calculator",
    "Concrete Calculator",
    "Subnet Calculator",
    "Password Generator",
    "Conversion Calculator",
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calc360'),
      ),
      body: Row(
        children: <Widget>[
          CalculatorColumn("Financial Calculators", financialCalculators),
          CalculatorColumn("Fitness & Health Calculators", healthCalculators),
          CalculatorColumn("Math Calculators", mathCalculators),
          CalculatorColumn("Other Calculators", otherCalculators),
        ],
      ),
    );
  }
}

class CalculatorColumn extends StatefulWidget {
  final String header;
  final List<String> calculators;

  const CalculatorColumn(this.header, this.calculators, {Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorColumnState createState() => _CalculatorColumnState();
}

class _CalculatorColumnState extends State<CalculatorColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: InkWell(
              onTap: () {
                if (widget.header == "Fitness & Health Calculators") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HealthPage(),
                    ),
                  );
                } 
                else if (widget.header == "Financial Calculators"){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FinancialPage(),
                    ),
                  );
                }
                
                else {
                  print("Header Clicked: ${widget.header}");
                }
              },
              child: Text(
                widget.header,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.black, // Text color is black.
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.calculators.length,
              itemBuilder: (context, index) {
                final calculator = widget.calculators[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    child: Text(
                      calculator,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      if (calculator == "BMI Calculator") {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const BMIPage(title: "BMI Calculator"),
                          )

                        );
                      }
                      
                      else if (calculator == "Mortgage Calculator"){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MCPage(title: 'Mortgage Calculator',),
                    ),
                  );
                      }
                   else {
                        print("Calculator Clicked: $calculator");
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
