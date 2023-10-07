// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api
// This is bmi_meter, called in bmi.dart, as to show the meter with result

// Importing necessary libraries
import 'dart:async';  // Library for dealing with asynchronous programming
import 'dart:math';   // Library for mathematical operations
import 'package:flutter/material.dart'; // Flutter's Material Design widgets

// Global variable to hold a BMI value (initialized to 1.0)
var bmi = 1.0000;

// CustomPainter for drawing the BMI meter
class BMIMeterPainter extends CustomPainter {
  final bool isAbove20;  // Flag indicating if age is above 20
  final double bmiValue; // BMI value
  final int iAge;        // Age

  // Constructor that takes in necessary information for painting
  BMIMeterPainter(this.isAbove20, this.bmiValue, this.iAge);

  // Method to actually draw the meter
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;  // Radius of the meter
    Offset center = Offset(size.width / 2, size.height / 2); // Center of the meter

    Paint paint = Paint() // Brush settings for drawing
      ..style = PaintingStyle.stroke // Stroke style (not filled)
      ..strokeWidth = 8;  // Width of the lines

    // Choose color scheme based on age
    List<Color> colors = isAbove20 ? colorsAbove20 : colorsBelow20;

    // Adjust the thresholds based on age
    List<double> thresholds = isAbove20 ? thresholdsAbove20 : thresholdsBelow20;

    double startAngle = pi;  // Starting angle for drawing
    double sweepAngle = pi / thresholds.length;  // Angle to sweep for each section

    // Loop to draw arcs based on BMI value and thresholds
    for (int i = 0; i < thresholds.length; i++) {
      double threshold = thresholds[i];
      double progress = bmiValue / threshold; // How much of this section to draw
      Color color = colors[i];  // Color for this section

      paint.color = color;
      // Draw a section of the meter
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle * progress, false, paint);

      startAngle += sweepAngle * progress; // Move the starting angle for the next section
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // The painting doesn't change, so no need to repaint
  }
}

// Stateful widget for the BMI Meter
class BMIMeter extends StatefulWidget {
  final double bmiValue; // BMI value
  final bool isAbove20;  // Flag indicating if age is above 20
  final int iAge;        // Age

  // Constructor for the widget
  const BMIMeter({Key? key, required this.bmiValue, required this.isAbove20, required this.iAge}) : super(key: key);

  // Method to create the state for the widget
  @override
  _BMIMeterState createState() => _BMIMeterState();
}

class _BMIMeterState extends State<BMIMeter> {
  double angle = 0; // Initial angle for the needle

  @override
  void initState() {
    super.initState();
    _rotateNeedle(); // Start rotating the needle
  }

  // Method to rotate the needle based on BMI value and age
  void _rotateNeedle() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (widget.isAbove20) {
          // If age is above 20, use 8 categories
          angle = (bmi - 15) * (pi / 10); // Calculate angle based on BMI value and 8 categories
        } else {
          // If age is below 20, use 4 categories
          angle = (bmi - 15) * (pi / 20); // Calculate angle based on BMI value and 4 categories
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Meter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the BMI value
            Text(
              'BMI: ${widget.bmiValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // Stack to overlay the meter and the needle
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  // Draw the BMI meter
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: CustomPaint(
                      painter: BMIMeterPainter(widget.isAbove20, widget.bmiValue, widget.iAge),
                    ),
                  ),
                  // Draw the needle and rotate it based on angle
                  Center(
                    child: Transform.rotate(
                      angle: angle,
                      child: Container(
                        width: 4,
                        height: 75,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Color schemes for different age groups
List<Color> colorsAbove20 = [
  Colors.red.shade900, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple, Colors.pink
];

List<Color> colorsBelow20 = [
  Colors.red, Colors.orange, Colors.green, Colors.blue
];

// Thresholds for different age groups
List<double> thresholdsAbove20 = [16, 17, 18.5, 25, 30, 35, 40];
List<double> thresholdsBelow20 = [15.5, 22, 25.5];
