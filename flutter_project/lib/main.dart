import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Function to check palindrome
bool isPalindrome(String text) {
  String reversed = text.split('').reversed.join('');
  return text.toLowerCase() == reversed.toLowerCase();
}

// Function to add two numbers
int add(int a, int b) {
  return a + b;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Programming Basics',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textField1Controller =
      TextEditingController();

  final TextEditingController textField2Controller =
      TextEditingController();

  String result = '';

  // Check Age
  void checkAge() {
    try {
      int age = int.parse(textField1Controller.text);

      if (age >= 18) {
        setState(() {
          result = 'Adult';
        });
      } else if (age >= 13) {
        setState(() {
          result = 'Teenager';
        });
      } else {
        setState(() {
          result = 'Child';
        });
      }
    } catch (e) {
      setState(() {
        result = 'Invalid input';
      });
    }
  }

  // Palindrome Check
  void checkPalindrome() {
    String text = textField1Controller.text;

    if (text.isEmpty) {
      setState(() {
        result = 'Invalid input';
      });
      return;
    }

    bool palindrome = isPalindrome(text);

    setState(() {
      result = palindrome ? 'Palindrome: true' : 'Palindrome: false';
    });
  }

  // Add Numbers
  void addNumbers() {
    try {
      int number1 = int.parse(textField1Controller.text);
      int number2 = int.parse(textField2Controller.text);

      int sum = add(number1, number2);

      setState(() {
        result = 'Sum: $sum';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Programming Basics'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [

            // TextField 1
            TextField(
              controller: textField1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter number or string',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // TextField 2
            TextField(
              controller: textField2Controller,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Check Age button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkAge,
                child: const Text('Check Age'),
              ),
            ),

            // Palindrome button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkPalindrome,
                child: const Text('Palindrome Check'),
              ),
            ),

            // Add Numbers button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addNumbers,
                child: const Text('Add Numbers'),
              ),
            ),

            const SizedBox(height: 30),

            // Result
            Text(
              result,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    super.dispose();
  }
}