import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _count = 0;

  String get count => _count.toString();

  void increase() {
    _count++;
    notifyListeners();
  }
}
