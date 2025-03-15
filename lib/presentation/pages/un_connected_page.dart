import 'package:flutter/material.dart';

class UnConnectedPage extends StatelessWidget {
  const UnConnectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Интернет байланышы жок!'),
      ),
    );
  }
}
