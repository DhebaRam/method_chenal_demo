import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../channels/custom_binary_messenger.dart';

class BinaryMessageDemo extends StatefulWidget {
  const BinaryMessageDemo({super.key});

  @override
  State<BinaryMessageDemo> createState() => _BinaryMessageDemoState();
}

class _BinaryMessageDemoState extends State<BinaryMessageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Basic Channel Demo"),
      ),
      body: Center(
        child: FilledButton.icon(onPressed: () async{
          try {
            CustomBinaryMessenger.givenValue("Hello Platform Demo");
          } catch (error) {
            showMessage(context, (error as PlatformException).message!);
          }
        }, icon:const Icon(Icons.abc), label: const Text("BinaryMessage")),
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}