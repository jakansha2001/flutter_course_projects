import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;    //VoidCallback is also void Function OR Function()?

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: cardChild,
      ),
    );
  }
}
