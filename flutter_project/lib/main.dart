import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool isPalindrome(String text) {
  String reversed = text.split('').reversed.join('');
  return text.toLowerCase() == reversed.toLowerCase();
}

int add(int a, int b) {
  return a + b;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Basics UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dart Basics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controllers for our two TextFields
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  
  // State variable for the result text
  String _result = 'Enter values to see the result';

  void _checkAge() {
    try {
      int age = int.parse(_input1Controller.text);
      setState(() {
        if (age >= 18) {
          _result = 'Adult';
        } else if (age >= 13) {
          _result = 'Teenager';
        } else {
          _result = 'Child';
        }
      });
    } catch (e) {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  void _checkPalindrome() {
    String text = _input1Controller.text;
    if (text.isEmpty) {
      setState(() {
        _result = 'Invalid input';
      });
      return;
    }
    setState(() {
      _result = '${isPalindrome(text)}';
    });
  }

  void _addNumbers() {
    try {
      int num1 = int.parse(_input1Controller.text);
      int num2 = int.parse(_input2Controller.text);
      setState(() {
        _result = '${add(num1, num2)}';
      });
    } catch (e) {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  @override
  void dispose() {
    _input1Controller.dispose();
    _input2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1st TextField
            TextField(
              controller: _input1Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input 1 (Number or String)',
              ),
            ),
            const SizedBox(height: 16),
            // 2nd TextField
            TextField(
              controller: _input2Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input 2 (Number)',
              ),
            ),
            const SizedBox(height: 24),
            // 1st ElevatedButton: Check Age
            ElevatedButton(
              onPressed: _checkAge,
              child: const Text('Check Age'),
            ),
            const SizedBox(height: 8),
            // 2nd ElevatedButton: Palindrome Check
            ElevatedButton(
              onPressed: _checkPalindrome,
              child: const Text('Palindrome Check'),
            ),
            const SizedBox(height: 8),
            // 3rd ElevatedButton: Add Numbers
            ElevatedButton(
              onPressed: _addNumbers,
              child: const Text('Add Numbers'),
            ),
            const SizedBox(height: 32),
            // Text widget to display results
            Text(
              _result,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
