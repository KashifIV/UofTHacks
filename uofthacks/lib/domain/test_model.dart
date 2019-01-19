import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
class TestModel extends Model{
  int _counter = 0;

  int get counter => _counter;
  
  void increment() {
    // First, increment the counter
    _counter++;
    
    // Then notify all the listeners.
    notifyListeners();
  }
}