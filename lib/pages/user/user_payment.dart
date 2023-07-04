import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/user/user_trainer.dart';
import 'package:tmb_fyp/pages/user/widgets/comingsoon_dialog.dart';
import 'package:tmb_fyp/pages/user/widgets/payment_container.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserTrainer()));
              },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}