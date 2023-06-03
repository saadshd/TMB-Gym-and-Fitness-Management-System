import 'package:flutter/material.dart';
import 'dart:math';

enum MeasurementSystem {
  metric,
  imperial,
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? bmi;
  String errorText = '';
  String status = '';
  MeasurementSystem measurementSystem = MeasurementSystem.metric;

  String getHeightSuffix() {
    return measurementSystem == MeasurementSystem.metric ? 'cm' : 'in';
  }

  String getWeightSuffix() {
    return measurementSystem == MeasurementSystem.metric ? 'kg' : 'lbs';
  }

  void calculateBMI() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || weight == null) {
      setState(() {
        errorText = "Please enter your Height and Weight";
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        errorText = "Your Height and Weight must be positive numbers";
      });
      return;
    }

    setState(() {
      if (measurementSystem == MeasurementSystem.metric) {
        bmi = weight / pow(height / 100, 2);
      } else {
        bmi = (weight / pow(height, 2)) * 703;
      }

      if (bmi! < 18.5) {
        status = "Underweight";
      } else if (bmi! >= 18.5 && bmi! < 25) {
        status = 'Normal weight';
      } else if (bmi! >= 25 && bmi! < 30) {
        status = 'Pre-Obesity';
      } else if (bmi! >= 30 && bmi! < 35) {
        status = 'Obesity class 1';
      } else if (bmi! >= 35 && bmi! < 40) {
        status = 'Obesity class 2';
      } else {
        status = 'Obesity class 3';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Height',
                suffixText: getHeightSuffix(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight',
                suffixText: getWeightSuffix(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Metric'),
              leading: Radio<MeasurementSystem>(
                value: MeasurementSystem.metric,
                groupValue: measurementSystem,
                onChanged: (MeasurementSystem? value) {
                  setState(() {
                    measurementSystem = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Imperial'),
              leading: Radio<MeasurementSystem>(
                value: MeasurementSystem.imperial,
                groupValue: measurementSystem,
                onChanged: (MeasurementSystem? value) {
                  setState(() {
                    measurementSystem = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Calculate'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              errorText,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmi == null ? '00.00' : bmi!.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 60,
                            color: status == 'Underweight'
                                ? Colors.indigo
                                : status == 'Normal weight'
                                ? Colors.green
                                : status == 'Pre-Obesity'
                                ? Colors.yellow.shade700
                                : status == 'Obesity class 1'
                                ? Colors.orange
                                : status == 'Obesity class 2'
                                ? Colors.deepOrangeAccent
                                : status == 'Obesity class 3'
                                ? Colors.red
                                : null,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              status,
                              style: TextStyle(
                                color: status == 'Underweight'
                                    ? Colors.indigo
                                    : status == 'Normal weight'
                                    ? Colors.green
                                    : status == 'Pre-Obesity'
                                    ? Colors.yellow.shade700
                                    : status == 'Obesity class 1'
                                    ? Colors.orange
                                    : status == 'Obesity class 2'
                                    ? Colors.deepOrangeAccent
                                    : status == 'Obesity class 3'
                                    ? Colors.red
                                    : null,
                              ),
                            ),
                            const Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Nutritional Status',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15),
                              ),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child: Text(
                                'Underweight',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                'Normal \nweight',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.yellow.shade700,
                            child: const Center(
                              child: Text(
                                'Pre-Obesity',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.orange,
                            child: const Center(
                              child: Text(
                                'Obesity \nclass 1',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.deepOrangeAccent,
                            child: const Center(
                              child: Text(
                                'Obesity \nclass 2',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(15),
                              ),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                'Obesity \nclass 3',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '00',
                          style: TextStyle(color: Colors.transparent),
                        ),
                        Text('18.5'),
                        Text('25.0'),
                        Text('30.0'),
                        Text('35.0'),
                        Text('40.0'),
                        Text(
                          '00',
                          style: TextStyle(color: Colors.transparent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



