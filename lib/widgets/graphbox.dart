import 'package:flutter/material.dart';

class GraphboxContainer extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  const GraphboxContainer(
      {super.key,
      required this.padding,
      required this.child,
      this.color,
      this.height,
      this.width,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        color: color ?? Colors.grey.shade50,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 0.0,
              blurRadius: 3,
              offset: const Offset(3.0, 3.0)),
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.0,
              blurRadius: 3 / 2.0,
              offset: const Offset(3.0, 3.0)),
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
      ),
      child: child,
    );
  }
}
