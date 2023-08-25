import 'package:flutter/material.dart';

class Examples extends StatefulWidget {
  const Examples({super.key});

  @override
  State<Examples> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {

  late MediaQueryData data;
  final FocusNode f = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = MediaQuery.of(context);
  }

  @override
  void dispose() {
    f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(f.hasFocus){
          FocusScope.of(context).unfocus();
        } else{
          FocusScope.of(context).requestFocus(f);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    focusNode: f,
                    controller: TextEditingController()..text = "Padding ${data.padding}",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    showCursor: false,
                  ),
                  TextField(
                    focusNode: f,
                    controller: TextEditingController()..text = "View insets ${data.viewInsets}",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    showCursor: false,
                  ),
                  TextField(
                    focusNode: f,
                    controller: TextEditingController()..text = "View padding ${data.viewPadding}",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    showCursor: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

