import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;

  ResponsiveLayout({required this.mobileLayout, required this.tabletLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return tabletLayout;  // Tablet view
        } else {
          return mobileLayout;  // Mobile view
        }
      },
    );
  }
}
