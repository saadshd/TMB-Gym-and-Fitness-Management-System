import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightDialog extends StatefulWidget {
  const WeightDialog({super.key});

  @override
  _WeightDialogState createState() => _WeightDialogState();
}

class _WeightDialogState extends State<WeightDialog> {
  final TextEditingController _weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _saveWeight() async {
    if (_formKey.currentState!.validate()) {
      String weight = _weightController.text;

      QuerySnapshot weightSnapshot = await FirebaseFirestore.instance
          .collection('weights')
          .get();

      if (weightSnapshot.docs.isNotEmpty) {
        // Update existing weight
        DocumentSnapshot weightDoc = weightSnapshot.docs[0];
        await weightDoc.reference.update({'weight': weight});
      } else {
        // Add new weight
        await FirebaseFirestore.instance.collection('weights').add({'weight': weight});
      }

      Navigator.of(context).pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Weight (kg)'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter weight';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Weight',
            hintText: 'Enter weight in kilograms',
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: _saveWeight,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
