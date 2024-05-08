import 'dart:io';

void main() {
  
  List<List<int>> array1 = takeArrayInput("first");

 
  List<List<int>> array2 = takeArrayInput("second");

  
  List<List<int>> sumArray = sumTwoArrays(array1, array2);

  
  displayArray("Sum of the two arrays", sumArray);
}

List<List<int>> takeArrayInput(String arrayName) {
  print("Enter the number of rows for $arrayName array:");
  int rows = int.parse(stdin.readLineSync()!);
  print("Enter the number of columns for $arrayName array:");
  int columns = int.parse(stdin.readLineSync()!);

  List<List<int>> array = List.generate(rows, (_) => List<int>.filled(columns, 0));

  print("Enter elements for $arrayName array:");

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      print("Enter element at index ($i, $j):");
      array[i][j] = int.parse(stdin.readLineSync()!);
    }
  }

  return array;
}

List<List<int>> sumTwoArrays(List<List<int>> array1, List<List<int>> array2) {
  int rows = array1.length;
  int columns = array1[0].length;
  List<List<int>> sumArray = List.generate(rows, (_) => List<int>.filled(columns, 0));

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      sumArray[i][j] = array1[i][j] + array2[i][j];
    }
  }

  return sumArray;
}

void displayArray(String arrayName, List<List<int>> array) {
  print("\n$arrayName:");
  for (List<int> row in array) {
    print(row);
  }
}