import 'dart:io';

int square(int x) {
  return x * x;
}

bool isPalindrome(String text) {
  String reversed = text.split('').reversed.join('');
  return text.toLowerCase() == reversed.toLowerCase();
}

void main() {
  print('--- e) Error Handling ---');
  stdout.write('Enter numerator: ');
  int numerator = int.tryParse(stdin.readLineSync() ?? '10') ?? 10;
  
  stdout.write('Enter denominator (try 0 to see the error!): ');
  int denominator = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  try {
    int result = numerator ~/ denominator; 
    print('Result: $result');
  } catch (e) {
    print('Caught an error during division: $e');
  }
}

