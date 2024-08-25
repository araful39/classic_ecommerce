import 'package:flutter/material.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          child: Icon(iconData, color: Colors.deepOrange),
        ),
      ),
    );
  }
}
