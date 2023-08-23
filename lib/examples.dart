import 'package:flutter/material.dart';

class Examples extends StatelessWidget {
  const Examples({super.key});

  static void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExamplePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: OutlinedButton(
            onPressed: () => nextScreen(context),
            child: const Text(
              "Example button",
            ),
          ),
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColorWidget(
          initialColor: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ColorWidget(
              key: key,
              initialColor: Colors.green,
              child: const Padding(
                padding: EdgeInsets.all(40),
                child: ColorButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorWidget extends StatefulWidget {
  final Widget child;
  final Color initialColor;

  const ColorWidget(
      {super.key, required this.child, required this.initialColor});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initialColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({super.key});

  void _onPressed(BuildContext context) {
    final state = context.findAncestorStateOfType<_ColorWidgetState>();
    if (state != null) {
      state.changeColor(Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColorWidget(
      initialColor: Colors.blue,
      child: Center(
        child: OutlinedButton(
          onPressed: () => _onPressed(context),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}
