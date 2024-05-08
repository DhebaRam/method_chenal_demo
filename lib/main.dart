/*import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _text = 'Lorem ipsum dolor sit amet, '
      'consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, '
      'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit '
      'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
      'Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final List<TextStyle> _style = List.filled(_text.length, const TextStyle());
  (int startIndex, int endIndex) _selection = (0, 0);

  Widget get highlightedText {
    final List<TextSpan> children = [];
    String currentText = '';
    late TextStyle currentStyle;

    for (int i = 0; i < _text.length; i++) {
      if (currentText.isEmpty) {
        currentText = _text[i];
        currentStyle = _style[i];
      } else {
        currentText += _text[i];
        if (i + 1 == _text.length || _style[i + 1] != currentStyle) {
          children.add(TextSpan(text: currentText, style: currentStyle));
          currentText = '';
        }
      }
    }

    return SelectableText.rich(
      TextSpan(children: children),
      onSelectionChanged: (selection, cause) {
        final (base, extent) = (selection.baseOffset, selection.extentOffset);
        _selection = (min(base, extent), max(base, extent));
      },
    );
  }

  void hilight(Color color) {
    final (start, end) = _selection;
    if (start == end) return;

    final style = TextStyle(
        color: color.computeLuminance() > 0.25 ? Colors.black : Colors.white,
        backgroundColor: color);
    for (int i = start; i < end; i++) {
      setState(() => _style[i] = style);
    }
  }

  late final Widget highlightButtons = Padding(
    padding: const EdgeInsets.only(top: 50, bottom: 25),
    child: Row(children: [
      for (final color in [
        Colors.red,
        Colors.orange,
        Colors.amber,
        Colors.yellow,
        Colors.lime,
        Colors.green,
        Colors.cyan,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
      ])
        _HighlightButton(color: color, onPressed: () => hilight(color))
    ]),
  );

  late final Widget resetButton = OutlinedButton(
    style: OutlinedButton.styleFrom(foregroundColor: Colors.grey),
    onPressed: () {
      _selection = (0, _text.length);
      hilight(const Color(0x00FFFFFF));
    },
    child: const Text('reset'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 16),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            highlightedText,
            highlightButtons,
            resetButton,
          ],
        ),
      ),
    );
  }
}

class _HighlightButton extends StatelessWidget {
  const _HighlightButton({required this.color, required this.onPressed});
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: OutlinedButton.styleFrom(backgroundColor: color),
          onPressed: onPressed,
          child: const SizedBox.shrink(),
        ),
      ),
    );
  }
}*/






import 'package:flutter/material.dart';
import 'package:untitled3/screens/basic_channel_demo.dart';
import 'package:untitled3/screens/binary_message_demo.dart';
import 'package:untitled3/screens/event_channel_demo.dart';
import 'package:untitled3/screens/method_channel_demo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Platform Channels Github Demo"),
      ),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: const Text("Binary Message"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const BinaryMessageDemo()));
            },
          ),
          ListTile(
            title: const Text("MethodChannel"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MethodChannelDemo()));
            },
          ),
          ListTile(
            title: const Text("EventChannel"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EventChannelDemo()));
            },
          ),
          ListTile(
            title: const Text("BasicMessageChannel"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BasicChannelDemo()));
            },
          ),
          ListTile(
            title: const Text("FileChannel"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BasicChannelDemo()));
            },
          ),
        ],
      )),
    );
  }
}


