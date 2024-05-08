import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../channels/event_channel_timer.dart';
import '../channels/method_channel_counter.dart';

class FileChannelDemo extends StatefulWidget {
  const FileChannelDemo({super.key});

  @override
  State<FileChannelDemo> createState() => _EventChannelDemoState();
}

class _EventChannelDemoState extends State<FileChannelDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("File Channel Demo"),
      ),
      body: Center(
        child: FilledButton.icon(
            onPressed: () async {
              try {
                final value = await MethodChannelCounter.randomValue();
              } catch (error) {}
            },
            icon: const Icon(Icons.abc),
            label: const Text("BinaryMessage")),
      ),
    );
  }
}
