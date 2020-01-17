import 'package:mobx/mobx.dart';

part 'hormonios_controller.g.dart';

class HormoniosController = _HormoniosBase with _$HormoniosController;

abstract class _HormoniosBase with Store {
  @observable
  bool mostrarCalendario = true;

  @action
  void mudarPaginaHormonios() {
    mostrarCalendario = !mostrarCalendario;
  }
}
