import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please select payment method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            PaymentMethodContainer(
              text: 'JazzCash',
              icon: Icons.account_balance_wallet,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ComingSoonDialog(),
                );
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodContainer(
              text: 'EasyPaisa',
              icon: Icons.account_balance_wallet,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ComingSoonDialog(),
                );
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodContainer(
              text: 'Bank Transfer',
              icon: Icons.account_balance,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ComingSoonDialog(),
                );
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodContainer(
              text: 'Credit Card',
              icon: Icons.credit_card,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ComingSoonDialog(),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your proceed button functionality here
              },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    required this.text,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
        ),
      ),
    );
  }
}

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