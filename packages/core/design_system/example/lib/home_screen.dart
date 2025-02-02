import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.story});

  final Widget? story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTP Design System'),
      ),
      backgroundColor: context.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(Grid.two),
        child: Center(child: story),
      ),
    );
  }
}
