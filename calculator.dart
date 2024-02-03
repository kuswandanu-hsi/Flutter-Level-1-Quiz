import 'dart:io';

void main(List<String> args) {
  var operators = ["+", "-", "*", "/", "%"];

  var operations = [
    (int fitst, int second) {
      return fitst + second;
    },
    (int fitst, int second) {
      return fitst - second;
    },
    (int fitst, int second) {
      return fitst * second;
    },
    (int fitst, int second) {
      return fitst ~/ second;
    },
    (int fitst, int second) {
      return fitst % second;
    },
  ];

  print("## === Calculator CLI === #");

  print("1. Penjumlahan");
  print("2. Pengurangan");
  print("3. Perkalian");
  print("4. Pembagian");
  print("5. Modulus");
  print("");

  stdout.write("Input pilihan operasi: ");
  var operation = int.parse(stdin.readLineSync()!);
  if (operation < 1 || operation > 5) {
    print("Pilihan tidak ada!");
    return;
  }

  stdout.write("Angka pertama: ");
  var first = int.parse(stdin.readLineSync()!);

  stdout.write("Angka kedua: ");
  var second = int.parse(stdin.readLineSync()!);

  print("");

  var result;
  try {
    result = operations[operation - 1](first, second);
  } on IntegerDivisionByZeroException {
    result = "Tidak bisa dibagi 0";
  } catch (e) {
    result = e;
  }

  print(
      "Hasil dari $first ${operators[operation - 1]} $second = ${result is double ? result.toStringAsFixed(3) : result}");
}
