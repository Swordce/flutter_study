import 'package:study/app/guyun/bean/all_collections.dart';

class CollectionsData {
  int _index;
  String _title;
  List<Result> _result;


  int get index => _index;

  set index(int value) {
    _index = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List<Result> get result => _result;

  set result(List<Result> value) {
    _result = value;
  }
}