import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io';

class BMIMeterChildPage extends StatefulWidget {
  const BMIMeterChildPage({
    Key? key,
    required this.title,
    required this.bmi,
    required this.result, required int iAge,
  }) : super(key: key);

  final String title;
  final double bmi;
  final String result;

  @override
  State<BMIMeterChildPage> createState() => _BMIMeterChildPageState();
}

class _BMIMeterChildPageState extends State<BMIMeterChildPage> {
  double xPositionFactor = 0.0;
  double yPositionFactor = 0.0;
  double gaugeSize = Platform.isAndroid ? 300 : 500;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            width: gaugeSize,
            height: gaugeSize,
            child: SfRadialGauge(
              title: const GaugeTitle(
                text: 'BMI Meter',
                textStyle: TextStyle(
                  fontSize: 20.0,
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
                    GaugeRange(startValue: 0, endValue: 15.5, color: Colors.red.shade400),
                    GaugeRange(startValue: 15.5, endValue: 22, color: Colors.green.shade400),
                    GaugeRange(startValue: 22, endValue: 25.5, color: Colors.orange.shade400),
                    GaugeRange(startValue: 25.5, endValue: 60, color: Colors.red.shade400),
                  ],
                  annotations: <GaugeAnnotation>[
                    _buildCircularHeading("U.weight", Colors.red.shade400, 0.2, 0.5),
                    _buildCircularHeading("Healthy", Colors.green.shade400, 0.7, 0.65),
                    _buildCircularHeading("R.overweight", Colors.orange.shade400, 0.8, 0.65),
                    _buildCircularHeading("O.weight", Colors.red.shade400, -0.2, 0.5),
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.result,
                            style: TextStyle(
                              fontSize: Platform.isAndroid ? 11.5 : 12.0, // Adjusted font size
                            ),
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
