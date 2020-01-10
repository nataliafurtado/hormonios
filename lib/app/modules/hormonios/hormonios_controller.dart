import 'package:mobx/mobx.dart';

part 'hormonios_controller.g.dart';

class HormoniosController = _HormoniosBase with _$HormoniosController;

abstract class _HormoniosBase with Store {
  @observable
  int value = 77;

  @action
  void increment() {
    value++;
  }
}
