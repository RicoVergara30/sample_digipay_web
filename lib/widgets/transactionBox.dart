import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;
  final VoidCallback? onTap;

  const TransactionContainer({
    super.key,
    required this.padding,
    required this.child,
    this.color,
    this.height,
    this.width,
    this.borderRadius,
    this.shape,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          color: color ?? Colors.grey.shade50,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 0.0,
                blurRadius: 3,
                offset: const Offset(5.0, 5.0)),
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.0,
                blurRadius: 3 / 2.0,
                offset: const Offset(5.0, 5.0)),
            const BoxShadow(
                color: Colors.white70,
                spreadRadius: 2.0,
                blurRadius: 3,
                offset: Offset(-3.0, -3.0)),
            const BoxShadow(
                color: Colors.white70,
                spreadRadius: 2.0,
                blurRadius: 3 / 2,
                offset: Offset(-3.0, -3.0)),
          ],
          // image: const DecorationImage(
          //   image: AssetImage('assets/FDSAPN.png'),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: child,
      ),
    );
  }
}
