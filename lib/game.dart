List operate(List<int> row) {
  row = slide(row);
  final result = combine(row);
  row = result;
  row = slide(row);
  return row;
}

List<int> filter(List<int> row) {
  List<int> temp = [];
  for (int i = 0; i < row.length; i++) {
    if (row[i] != 0) {
      temp.add(row[i]);
    }
  }
  return temp;
}

List<int> slide(List<int> row) {
  List<int> arr = filter(row);
  int missing = 4 - arr.length;
  List<int> zeroes = zeroArray(missing);
  arr = zeroes + arr;
  return arr;
}

List<int> zeroArray(int length) {
  List<int> zeroes = [];
  for (int i = 0; i < length; i++) {
    zeroes.add(0);
  }
  return zeroes;
}

List<int> combine(List<int> row) {
  for (int i = 3; i >= 1; i--) {
    int a = row[i];
    int b = row[i - 1];
    if (a == b) {
      row[i] = a + b;
      row[i - 1] = 0;
    }
  }
  return row;
}

bool isGameWon(List<List<int>> grid) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid[i][j] == 2048) {
        return true;
      }
    }
  }
  return false;
}

bool isGameOver(List<List<int>> grid) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid[i][j] == 0) {
        return false;
      }
      if (i != 3 && grid[i][j] == grid[i + 1][j]) {
        return false;
      }
      if (j != 3 && grid[i][j] == grid[i][j + 1]) {
        return false;
      }
    }
  }
  return true;
}
