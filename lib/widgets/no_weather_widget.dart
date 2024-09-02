import 'package:flutter/material.dart';

class NoWeahterBody extends StatelessWidget {
  const NoWeahterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "There is no weather 😔 start",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "searching now 🔍",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
