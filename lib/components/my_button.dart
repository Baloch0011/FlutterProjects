import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final Function()? ontap;
  const MyButton({
    super.key,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: ontap,
        child: Icon(icon),
      ),
    );
  }
}
