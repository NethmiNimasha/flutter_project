import 'dart:io';

// d) Functions
int square(int x) {
  return x * x;
}

bool isPalindrome(String text) {
  String reversed = text.split('').reversed.join('');
  return text.toLowerCase() == reversed.toLowerCase();
}

void main() {
  print('--- a) Variables & Types ---');
  String name = "Alice";
  int age = 22;
  double gpa = 3.9;
  bool passStatus = true;

  print('Name: $name');
  print('Age: $age');
  print('GPA: $gpa');
  print('Pass Status: $passStatus\n');

  print('--- b) Control Flow ---');
  stdout.write('Enter an age: ');
  String? ageInput = stdin.readLineSync();
  int? inputAge = int.tryParse(ageInput ?? '');

  if (inputAge != null) {
    if (inputAge >= 18) {
      print('Adult');
    } else if (inputAge >= 13) {
      print('Teenager');
    } else {
      print('Child');
    }
  } else {
    print('Invalid age entered.');
  }
  print('');

  print('--- c) Loops ---');
  for (int i = 1; i <= 5; i++) {
    print('Number: $i');
  }

  print('');
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  for (String fruit in fruits) {
    print('Fruit: $fruit');
  }
  print('');

  print('--- d) Functions ---');
  int numToSquare = 5;
  print('Square of $numToSquare is ${square(numToSquare)}');

  String word = "Level";
  print('Is "$word" a palindrome? ${isPalindrome(word)}');
  print('');

  print('--- e) Error Handling ---');
  stdout.write('Enter numerator: ');
  int numerator = int.tryParse(stdin.readLineSync() ?? '10') ?? 10;
  
  stdout.write('Enter denominator (try 0 to see the error!): ');
  int denominator = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  try {
    // We use `~/` (integer division) because normal division `/` by zero in Dart returns Infinity instead of throwing an error.
    int result = numerator ~/ denominator; 
    print('Result: $result');
  } catch (e) {
    print('Caught an error during division: $e');
  }
}
