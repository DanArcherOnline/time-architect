import 'package:flutter/material.dart';

class CreateBlueprintButton extends StatelessWidget {
  final VoidCallback onTap;
  const CreateBlueprintButton({
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
