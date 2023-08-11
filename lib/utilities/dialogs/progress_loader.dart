import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String? text;
  const Loader({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? ''),
            const SizedBox(
              height: 10.5,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
