import 'package:flutter/material.dart';

class Examples extends StatefulWidget {
  const Examples({super.key});

  @override
  State<Examples> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  void tap() {
    text2 = text1;
    setState(() {});
  }

  String text1 = "state less";
  String text2 = "void func";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buttons(),
            const SizedBox(height: 20),
            Buttons(),
            const SizedBox(height: 20),
            const Buttons(),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final stateHomePage = context.findAncestorStateOfType<_ExamplesState>();
    return ElevatedButton(
      onPressed: () => stateHomePage?.tap(),
      child: Text(stateHomePage?.text2 ?? ""),
    );
  }
}
