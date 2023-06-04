import 'package:flutter/material.dart';

class ComingSoonDialog extends StatelessWidget {
  const ComingSoonDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Coming Soon'),
      content: const Text('This payment method will be available soon.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}