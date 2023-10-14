import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io';

class BMIMeterAdultPage extends StatefulWidget {
  const BMIMeterAdultPage({
    Key? key,
    required this.title,
    required this.bmi,
    required this.result, required int iAge,
  }) : super(key: key);

  final String title;
  final double bmi;
  final String result;

  @override
  State<BMIMeterAdultPage> createState() => _BMIMeterAdultPageState();
}

class _BMIMeterAdultPageState extends State<BMIMeterAdultPage> {
  double getFontSize() {
    return Platform.isAndroid ? 11.5 : 12.0;
  }

  double getMeterSize() {
    return Platform.isAndroid ? 300 : 500;
  }

  double xPositionFactor = 0.0;
  double yPositionFactor = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SizedBox(
            width: getMeterSize(),
            height: getMeterSize(),
            child: SfRadialGauge(
              title: const GaugeTitle(
                text: 'BMI Meter',
                textStyle: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              enableLoadingAnimation: true,
              animationDuration: 4500,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 60,
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: widget.bmi,
                      enableAnimation: true,
                    ),
                  ],
                 ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 16, color: Colors.red.shade400),
                  GaugeRange(startValue: 16, endValue: 17, color: Colors.red.shade200),
                  GaugeRange(startValue: 17, endValue: 18.5, color: Colors.orange.shade200),
                  GaugeRange(startValue: 18.5, endValue: 25, color: Colors.green.shade400),
                  GaugeRange(startValue: 25, endValue: 30, color: Colors.yellow.shade400),
                  GaugeRange(startValue: 30, endValue: 35, color: Colors.red.shade200),
                  GaugeRange(startValue: 35, endValue: 40, color: Colors.red.shade400),
                  GaugeRange(startValue: 40, endValue: 60, color: const Color.fromARGB(255, 141, 14, 14)),
                ],
                  annotations: <GaugeAnnotation>[
                   _buildCircularHeading("s.Thinness", Colors.red.shade400, 0.2, 0.5),
                  _buildCircularHeading("M.Thinness", Colors.red.shade200, 0.63, 0.67),
                  _buildCircularHeading("Md.Thinness", Colors.orange.shade200, 0.66, 0.68),
                  _buildCircularHeading("Normal", Colors.green.shade400, 0.76, 0.60),
                  _buildCircularHeading("O.weight", const Color.fromARGB(255, 232, 220, 121), 0.90, 0.58),
                  _buildCircularHeading("O.C I", Colors.red.shade200, -0.93, 0.56),
                  _buildCircularHeading("O.C II", Colors.red.shade400,  -0.78, 0.60),
                  _buildCircularHeading("O.C III", const Color.fromARGB(255, 141, 14, 14), -0.2, 0.5),
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.result,
                            style: TextStyle(fontSize: getFontSize()), // Adjusted font size
                          ),
                        ],
                      ),
                      positionFactor: 0.5 + yPositionFactor,
                      angle: 90 + (xPositionFactor * 180),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GaugeAnnotation _buildCircularHeading(
      String text, Color color, double xFactor, double yFactor) {
    return GaugeAnnotation(
      widget: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11.5,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      positionFactor: 0.65 + yFactor,
      angle: 90 + (xFactor * 180),
    );
  }
}
