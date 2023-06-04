import 'package:flutter/material.dart';

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