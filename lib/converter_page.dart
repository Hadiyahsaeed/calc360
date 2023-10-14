// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Convert the values'),
        ),
        body: const ConverterPage(),
      ),
    );
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: [
                  const Tab(text: 'Length'),
                  const Tab(text: 'Temperature'),
                  const Tab(text: 'Area'),
                  const Tab(text: 'Volume'),
                  const Tab(text: 'Weight'),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  LengthConversion(
                    items: [
                      'Meters',
                      'Kilometers',
                      'Centimeters',
                      'Millimeters',
                      'Micrometers',
                      'Nanometers',
                      'Mile',
                      'Yard',
                      'Foot',
                      'Inch',
                      'Light year',
                    ],
                  ),
                  const TemperatureConversion(),
                  const AreaConversion(),
                  const Center(child: Text('Volume Content')),
                  const Center(child: Text('Weight Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LengthConversion extends StatefulWidget {
  final List<String> items;

  LengthConversion({super.key, required this.items});

  @override
  _LengthConversionState createState() => _LengthConversionState();
}

class _LengthConversionState extends State<LengthConversion> {
  String selectedFrom = '';
  String selectedTo = '';
  double inputValue = 0;
  double convertedValue = 0;

  void convertValue() {
    if (selectedFrom == selectedTo) {
      convertedValue = inputValue;
    } else if (selectedFrom == 'Meters') {
      switch (selectedTo) {
        case 'Kilometers':
          convertedValue = inputValue / 1000;
          break;
        case 'Centimeters':
          convertedValue = inputValue * 100;
          break;
        case 'Millimeters':
          convertedValue = inputValue * 1000;
          break;
        case 'Micrometers':
          convertedValue = inputValue * 1e6;
          break;
        case 'Nanometers':
          convertedValue = inputValue * 1e9;
          break;
        case 'Mile':
          convertedValue = inputValue / 1609.34;
          break;
        case 'Yard':
          convertedValue = inputValue * 1.094;
          break;
        case 'Foot':
          convertedValue = inputValue * 3.281;
          break;
        case 'Inch':
          convertedValue = inputValue * 39.37;
          break;
        case 'Light year':
          convertedValue = inputValue * 1e-16;
          break;
        default:
          break;
      }
    }
    else if (selectedFrom == 'Kilometers') {
      switch (selectedTo) {
        case 'Meters':
          convertedValue = inputValue * 1000;
          break;
        case 'Kilometers':
          convertedValue = inputValue;
          break;
        case 'Centimeters':
          convertedValue = inputValue * 10000;
          break;
        case 'Millimeters':
          convertedValue = inputValue * 1e6;
          break;
        case 'Micrometers':
          convertedValue = inputValue * 1e9;
          break;
        case 'Nanometers':
          convertedValue = inputValue * 1e12;
          break;
        case 'Mile':
          convertedValue = inputValue / 1.609;
          break;
        case 'Yard':
          convertedValue = inputValue * 1094;
          break;
        case 'Foot':
          convertedValue = inputValue * 3281;
          break;
        case 'Inch':
          convertedValue = inputValue * 39370;
          break;
        case 'Light year':
          convertedValue = inputValue / 9.461e12;
          break;
        
        default:
          break;
      }
    }
    else if (selectedFrom == 'Centimeters') {
      switch (selectedTo) {
        case 'Meters':
          convertedValue = inputValue / 100;
           break;
        case 'Kilometers':
          convertedValue = inputValue / 100000;
          break;
        case 'Centimeters':
          convertedValue = inputValue;
          break;
        case 'Millimeters':
          convertedValue = inputValue * 10;
          break;
        case 'Micrometers':
          convertedValue = inputValue * 10000;
          break;
        case 'Nanometers':
          convertedValue = inputValue * 1e7;
          break;
        case 'Mile':
          convertedValue = inputValue / 160900;
          break;
        case 'Yard':
          convertedValue = inputValue * 1094;
          break;
        case 'Foot':
          convertedValue = inputValue * 91.44;
          break;
        case 'Inch':
          convertedValue = inputValue / 2.54;
          break;
        case 'Light year':
          convertedValue = inputValue / 9.461e17;
          
        
          break;
        default:
          break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Value',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  inputValue = double.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.items[index]),
                      tileColor: widget.items[index] == selectedFrom ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = widget.items[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            convertValue();
          },
          child: const Text('Convert'),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Converted Value',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                controller: TextEditingController(text: convertedValue.toString()),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.items[index]),
                      tileColor: widget.items[index] == selectedTo ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = widget.items[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TemperatureConversion extends StatefulWidget {
  const TemperatureConversion({super.key});

  @override
  _TemperatureConversionState createState() => _TemperatureConversionState();
}

class _TemperatureConversionState extends State<TemperatureConversion> {
  String selectedFrom = '';
  String selectedTo = '';
  double inputValue = 0;
  double convertedValue = 0;

  void convertValue() {
    if (selectedFrom == selectedTo) {
      convertedValue = inputValue;
    } else if (selectedFrom == 'Celsius') {
      switch (selectedTo) {
        case 'Celsius':
          convertedValue = inputValue;
          break;
        case 'Kelvin':
          convertedValue = inputValue + 273.15;
          break;
        case 'Fahrenheit':
          convertedValue = (inputValue * 9/5) + 32;
          break;
        default:
          break;
      }
    } else if (selectedFrom == 'Kelvin') {
      switch (selectedTo) {
        case 'Celsius':
          convertedValue = inputValue - 273.15;
          break;
        case 'Kelvin':
          convertedValue = inputValue;
          break;
        case 'Fahrenheit':
          convertedValue = (inputValue - 273.15) * 9/5 + 32;
          break;
        default:
          break;
      }
    } else if (selectedFrom == 'Fahrenheit') {
      switch (selectedTo) {
        case 'Celsius':
          convertedValue = (inputValue - 32) * 5/9;
          break;
        case 'Kelvin':
          convertedValue = (inputValue - 32) * 5/9 + 273.15;
          break;
        case 'Fahrenheit':
          convertedValue = inputValue;
          break;
        default:
          break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Value',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  inputValue = double.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 10),
              const Text('From', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Celsius'),
                      tileColor: selectedFrom == 'Celsius' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Celsius';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Kelvin'),
                      tileColor: selectedFrom == 'Kelvin' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Kelvin';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Fahrenheit'),
                      tileColor: selectedFrom == 'Fahrenheit' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Fahrenheit';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            convertValue();
          },
          child: const Text('Convert'),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Converted Value',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                controller: TextEditingController(text: convertedValue.toString()),
              ),
              const SizedBox(height: 10),
              const Text('To', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Celsius'),
                      tileColor: selectedTo == 'Celsius' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Celsius';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Kelvin'),
                      tileColor: selectedTo == 'Kelvin' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Kelvin';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Fahrenheit'),
                      tileColor: selectedTo == 'Fahrenheit' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Fahrenheit';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AreaConversion extends StatefulWidget {
  const AreaConversion({super.key});

  @override
  _AreaConversionState createState() => _AreaConversionState();
}

class _AreaConversionState extends State<AreaConversion> {
  String selectedFrom = '';
  String selectedTo = '';
  double inputValue = 0;
  double convertedValue = 0;

  void convertValue() {
    if (selectedFrom == selectedTo) {
      convertedValue = inputValue;
    } else if (selectedFrom == 'Square Meter') {
      switch (selectedTo) {
        case 'Square Meter':
          convertedValue = inputValue;
          break;
        case 'Square Kilometer':
          convertedValue = inputValue * 1e-6;
          break;
        case 'Square Centimeter':
          convertedValue = inputValue * 1e4;
          break;
        case 'Square Millimeter':
          convertedValue = inputValue * 1e6;
          break;
        case 'Square Micrometer':
          convertedValue = inputValue * 1e12;
          break;
        case 'Hectare':
          convertedValue = inputValue * 0.0001;
          break;
        case 'Square Mile':
          convertedValue = inputValue * 3.861e-7;
          break;
        case 'Square Yard':
          convertedValue = inputValue * 1.196;
          break;
        case 'Square Foot':
          convertedValue = inputValue * 10.764;
          break;
        case 'Square Inch':
          convertedValue = inputValue * 1550;
          break;
        case 'Acre':
          convertedValue = inputValue * 0.000247;
          break;
        default:
          break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Value',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  inputValue = double.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 10),
              const Text('From', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Square Meter'),
                      tileColor: selectedFrom == 'Square Meter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Meter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Kilometer'),
                      tileColor: selectedFrom == 'Square Kilometer' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Kilometer';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Centimeter'),
                      tileColor: selectedFrom == 'Square Centimeter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Centimeter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Millimeter'),
                      tileColor: selectedFrom == 'Square Millimeter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Millimeter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Micrometer'),
                      tileColor: selectedFrom == 'Square Micrometer' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Micrometer';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Hectare'),
                      tileColor: selectedFrom == 'Hectare' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Hectare';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Mile'),
                      tileColor: selectedFrom == 'Square Mile' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Mile';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Yard'),
                      tileColor: selectedFrom == 'Square Yard' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Yard';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Foot'),
                      tileColor: selectedFrom == 'Square Foot' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Foot';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Inch'),
                      tileColor: selectedFrom == 'Square Inch' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Square Inch';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Acre'),
                      tileColor: selectedFrom == 'Acre' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedFrom = 'Acre';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            convertValue();
          },
          child: const Text('Convert'),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Converted Value',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                controller: TextEditingController(text: convertedValue.toString()),
              ),
              const SizedBox(height: 10),
              const Text('To', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Square Meter'),
                      tileColor: selectedTo == 'Square Meter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Meter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Kilometer'),
                      tileColor: selectedTo == 'Square Kilometer' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Kilometer';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Centimeter'),
                      tileColor: selectedTo == 'Square Centimeter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Centimeter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Millimeter'),
                      tileColor: selectedTo == 'Square Millimeter' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Millimeter';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Micrometer'),
                      tileColor: selectedTo == 'Square Micrometer' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Micrometer';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Hectare'),
                      tileColor: selectedTo == 'Hectare' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Hectare';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Mile'),
                      tileColor: selectedTo == 'Square Mile' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Mile';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Yard'),
                      tileColor: selectedTo == 'Square Yard' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Yard';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Foot'),
                      tileColor: selectedTo == 'Square Foot' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Foot';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Square Inch'),
                      tileColor: selectedTo == 'Square Inch' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Square Inch';
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Acre'),
                      tileColor: selectedTo == 'Acre' ? Colors.grey : null,
                      onTap: () {
                        setState(() {
                          selectedTo = 'Acre';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
