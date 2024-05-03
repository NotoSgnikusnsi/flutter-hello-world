import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = "Hello World";
  final _titleController = TextEditingController();

  bool _formProgress = false;

  void _updateFormProgress(String value) {
    bool progress = false;
    if (value.isNotEmpty) {
      progress = true;
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _changeTitle() {
    setState(() {
      _title = _titleController.text;
      _titleController.clear();
      _formProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$_title",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: _updateFormProgress,
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.disabled)
                      ? null
                      : Theme.of(context).buttonTheme.colorScheme?.onPrimary,
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.disabled)
                      ? null
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: _formProgress ? _changeTitle : null,
              child: const Text("Change"),
            )
          ],
        ),
      ),
    );
  }
}
