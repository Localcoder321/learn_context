import 'package:examples_of_context/inherit.dart';
import 'package:flutter/material.dart';

class Examples extends StatelessWidget {
  const Examples({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: DataOwnerStateful(),
        ),
      ),
    );
  }
}

class DataOwnerStateful extends StatefulWidget {
  const DataOwnerStateful({super.key});

  @override
  State<DataOwnerStateful> createState() => _DataOwnerStatefulState();
}

class _DataOwnerStatefulState extends State<DataOwnerStateful> {
  var _value = 0;

  void _increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: const Text("Tap"),
        ),
        Provider(
          value: _value,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of(context, listen: true)?.value ?? 0;
    return Column(
      children: [
        Text(
          "$value",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const DataConsumerStateful(),
      ],
    );
  }
}

class DataConsumerStateful extends StatefulWidget {
  const DataConsumerStateful({super.key});

  @override
  State<DataConsumerStateful> createState() => _DataConsumerStatefulState();
}

class _DataConsumerStatefulState extends State<DataConsumerStateful> {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of(context)?.value ?? 0;
    return Text(
      "$value",
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}
