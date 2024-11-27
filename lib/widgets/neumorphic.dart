import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;
  final Function destination;
  const NeumorphicContainer({
    super.key,
    required this.padding,
    required this.child,
    required this.destination,
    this.color,
    this.height,
    this.width,
    this.borderRadius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        destination;
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: shape != null
            ? BoxDecoration(
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
                      offset: Offset(-5.0, -5.0)),
                  const BoxShadow(
                      color: Colors.white70,
                      spreadRadius: 2.0,
                      blurRadius: 3 / 2,
                      offset: Offset(-5.0, -5.0)),
                ],
              )
            : null,
        child: child,
      ),
    );
  }
}
