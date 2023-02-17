import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int count = 0;

  int getCount() {
    return count;
  }

  void updateCount() {
    count++;
    notifyListeners();
  }
}
