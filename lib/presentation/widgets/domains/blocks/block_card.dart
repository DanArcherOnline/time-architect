import 'package:flutter/material.dart';

class BlockCard extends StatelessWidget {
  final String time;

  const BlockCard({
    Key? key,
    required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(time),
      ),
    );
  }
}
