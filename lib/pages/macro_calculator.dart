import 'package:flutter/material.dart';

import '../constants.dart';

class MacroCalculator extends StatefulWidget {
  const MacroCalculator({Key? key}) : super(key: key);

  @override
  State<MacroCalculator> createState() => _MacroCalculatorState();
}

class _MacroCalculatorState extends State<MacroCalculator> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _bmr = 0.0;
  int _selectedGenderIndex = 0;
  int _selectedGoalIndex = 0;
  int _selectedActivityLevelIndex = 0;
  double _calories = 0.0;
  double _carbohydrates = 0.0;
  double _protein = 0.0;
  double _fats = 0.0;
  bool _isMetricSystem = true;

  static const List<String> _genderOptions = ['Male', 'Female'];
  static const List<String> _goalOptions = ['Lose Weight', 'Maintain Weight', 'Gain Weight'];
  static const List<String> _activityLevelOptions = ['Sedentary', 'Lightly Active', 'Active', 'Very Active'];

  void _calculateMacros() {
    final int age = int.tryParse(_ageController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;

    if (age <= 0 || weight <= 0 || height <= 0) {
      return;
    }

    setState(() {
      if (_selectedGenderIndex == 0) {
        // Male
        _bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      } else {
        // Female
        _bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      }

      switch (_selectedActivityLevelIndex) {
        case 0:
          _bmr *= 1.2; // Sedentary
          break;
        case 1:
          _bmr *= 1.375; // Lightly Active
          break;
        case 2:
          _bmr *= 1.55; // Active
          break;
        case 3:
          _bmr *= 1.725; // Very Active
          break;
        default:
          _bmr *= 1.2; // Default to Sedentary
      }

      _calories = _bmr;

      switch (_selectedGoalIndex) {
        case 0:
        // Lose Weight
          _calories -= 500;
          break;
        case 1:
        // Maintain Weight
          break;
        case 2:
        // Gain Weight
          _calories += 500;
          break;
        default:
        // Default to Maintain Weight
      }

      _carbohydrates = _calories * 0.5;
      _protein = _calories * 0.3;
      _fats = _calories * 0.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Macro Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('System:'),
                  gapw10,
                  DropdownButton<bool>(
                    value: _isMetricSystem,
                    items: const [
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text('Metric'),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text('Imperial'),
                      ),
                    ],
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isMetricSystem = newValue ?? true;
                      });
                    },
                  ),
                ],
              ),
              gaph10,
              Row(
                children: [
                  const Text('Gender:'),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: _selectedGenderIndex,
                    items: _genderOptions.map((String value) {
                      return DropdownMenuItem<int>(
                        value: _genderOptions.indexOf(value),
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedGenderIndex = newValue ?? 0;
                      });
                    },
                  ),
                ],
              ),
              gaph10,
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              gaph10,
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _isMetricSystem ? 'Weight (kg)' : 'Weight (lbs)',
                ),
              ),
              gaph10,
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _isMetricSystem ? 'Height (cm)' : 'Height (in)',
                ),
              ),
              gaph10,
              Row(
                children: [
                  const Text('Activity Level:'),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: _selectedActivityLevelIndex,
                    items: _activityLevelOptions.map((String value) {
                      return DropdownMenuItem<int>(
                        value: _activityLevelOptions.indexOf(value),
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedActivityLevelIndex = newValue ?? 0;
                      });
                    },
                  ),
                ],
              ),
              gaph10,
              Row(
                children: [
                  const Text('Goal:'),
                  gapw10,
                  DropdownButton<int>(
                    value: _selectedGoalIndex,
                    items: _goalOptions.map((String value) {
                      return DropdownMenuItem<int>(
                        value: _goalOptions.indexOf(value),
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedGoalIndex = newValue ?? 0;
                      });
                    },
                  ),
                ],
              ),
              gaph10,
              ElevatedButton(
                onPressed: _calculateMacros,
                child: const Text('Calculate'),
              ),
              gaph20,
              Text(
                'BMR: ${_bmr.toStringAsFixed(2)} kCal',
                style: kmd1,
              ),
              Text(
                'Calories: ${_calories.toStringAsFixed(2)} grams',
                style: kmd1,
              ),
              Text(
                'Carbohydrates: ${_carbohydrates.toStringAsFixed(2)} grams',
                style: kmd1,
              ),
              Text(
                'Proteins: ${_protein.toStringAsFixed(2)} grams',
                style: kmd1,
              ),
              Text(
                'Fats: ${_fats.toStringAsFixed(2)} grams',
                style: kmd1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}