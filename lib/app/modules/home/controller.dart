import 'package:mobx/mobx.dart';
part'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }



   @observable
  String text = '';

  @action
  mudarTexto(String textNovo) {
   text = textNovo;
  }
}
