import 'package:flutter/material.dart';

class CreateBlockButton extends StatelessWidget {
  final VoidCallback onTap;
  const CreateBlockButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Icon(Icons.add),
    );
  }
}
