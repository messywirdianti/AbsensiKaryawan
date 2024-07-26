import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.child,
    this.includeBackgroundImage = true, // Add this parameter
  });

  final Widget? child;
  final bool includeBackgroundImage; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if (includeBackgroundImage)
            Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
