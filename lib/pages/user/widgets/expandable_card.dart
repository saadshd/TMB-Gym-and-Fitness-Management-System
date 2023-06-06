import 'package:flutter/material.dart';

import '../../../constants.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final String child;

  const ExpandableCard({super.key,
    required this.title,
    required this.child,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: kmd1,
        ),
        trailing: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
        ),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              widget.child,
              style: ksm,
            ),
          ),
        ],
      ),
    );
  }
}
