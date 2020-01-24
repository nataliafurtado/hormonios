import 'package:mobx/mobx.dart';

import 'package:Projeto02/app/models/medicamento.dart';
part 'novo_hormonio_controller.g.dart';

class NovoHormonioController = _NovoHormonioBase with _$NovoHormonioController;

abstract class _NovoHormonioBase with Store {
  @observable
  Medicamento novoMedicamentro = Medicamento(frequencia: '21');

  @action
  increment() {
    print(novoMedicamentro.frequencia);
  }
}
