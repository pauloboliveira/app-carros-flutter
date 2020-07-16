import 'dart:async';

class SimpleBloc<T>{
  
  final _streamController = StreamController();

  get stream => _streamController.stream;

  void add(T object){
    _streamController.add(object);
  }

  void addError(T error){
    _streamController.addError(error);
  }

  void dispose() {    
    _streamController.close();
  }
}