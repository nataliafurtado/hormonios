import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/bundle.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:mobx/mobx.dart';

part 'calendario_controller.g.dart';

class CalendarioController = _CalendarioBase with _$CalendarioController;
DBHelper _db = DBHelper();
SingletonBundle bundle = SingletonBundle();

abstract class _CalendarioBase with Store {
  @observable
  int rr = 56;

  @action
  void incremet() {
    rr = rr + 1;

    print(events);
  }

  // @observable
  // List<Lembrete> lembretes = [];

  @observable
  Map<DateTime, List> events = {};

  @observable
  List<Medicamento> medicamentosLista = [];

  @action
  Future<void> carregarCalendario() async {
    await getMedicamentos();
    DateTime hoje = new DateTime.now();
    DateTime segundaDessaSEmana =
        hoje.subtract(Duration(days: hoje.weekday - 1));
    Map<DateTime, List> map = events;
    // for lista meddicmaneto
    //
    //
    for (var i1 = 0; i1 < medicamentosLista.length; i1++) {
      DateTime dataInicio = DateTime.parse(medicamentosLista[i1].dataInicio);
      DateTime dataFim;
      if (medicamentosLista[i1].dataFim != null) {
        dataFim = DateTime.parse(medicamentosLista[i1].dataFim);
      }
      if (hoje.isAfter(dataInicio) &&
          (dataFim == null || hoje.isBefore(dataFim))) {
        // inicio if todos dia
        //
        //

        map = await medicamentosLista[i1]
            .freqClass
            .mapeia(segundaDessaSEmana, medicamentosLista[i1], map);

        if (medicamentosLista[i1].frequencia == bundle.frequencia[0]) {
          // //  for dias da semana
          // //
          // //
          // for (var i2 = 0; i2 < 7; i2++) {
          //   DateTime dia = segundaDessaSEmana.add(Duration(days: i2));

          //   List<Aviso> avisosDesseMed =
          //       await _db.getAvisos(medicamentosLista[i1].id);
          //   //
          //   //for avisos
          //   //
          //   List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
          //   for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
          //     //  List<dynamic> suporte01 = [];
          //     //   suporte01.addAll(avisosEvento);
          //     avisosEvento.add('Tomar ' +
          //         medicamentosLista[i1].nome +
          //         ' ás ' +
          //         avisosDesseMed[i3].hora +
          //         ' QTD: ' +
          //         avisosDesseMed[i3].qtd.toString());
          //   }
          //   // map.putIfAbsent(dia, () => avisosEvento);
          // }
          // // if dias especificaos da semana
          // //
          //
        }
        //

        else if (medicamentosLista[i1].frequencia == bundle.frequencia[1]) {
          // List list2 = jsonDecode(medicamentosLista[i1].diasDasemana);
          // for (var i2 = 0; i2 < list2.length; i2++) {
          //   DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
          //   if (list2[i2]) {
          //     List<Aviso> avisosDesseMed =
          //         await _db.getAvisos(medicamentosLista[i1].id);
          //     //
          //     //for avisos
          //     //
          //     // print(i2.toString() + ' iiiii2222');
          //     // print(map);
          //     print('sssssss');

          //     print(i2.toString() + map[dia].toString());
          //     List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
          //     for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
          //       //  List<dynamic> suporte01 = [];
          //       //   suporte01.addAll(avisosEvento);
          //       avisosEvento.add('Tomar ' +
          //           medicamentosLista[i1].nome +
          //           ' ás ' +
          //           avisosDesseMed[i3].hora +
          //           ' QTD: ' +
          //           avisosDesseMed[i3].qtd.toString());
          //     }

          //     // if (map.containsKey(dia)) {
          //     //   List l = map[dia];
          //     //   l.addAll(avisosEvento);
          //     //   map.update(dia, (dynamic val) => val);
          //     // }
          //     map.putIfAbsent(dia, () => avisosEvento);
          //   }
          // }
        } else if (medicamentosLista[i1].frequencia == bundle.frequencia[2]) {
          //   // ou pega dfo ultimo ou com base data de inicio
          //  // List list2 = jsonDecode(medicamentosLista[i1].diasDasemana);
          //   for (var i2 = 0; i2 < list2.length; i2++) {
          //     DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
          //     if (list2[i2]) {
          //       List<Aviso> avisosDesseMed =
          //           await _db.getAvisos(medicamentosLista[i1].id);
          //       //
          //       //for avisos
          //       //
          //       // print(i2.toString() + ' iiiii2222');
          //       // print(map);
          //       // print('sssssss');

          //       print(i2.toString() + map[dia].toString());
          //       List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
          //       for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
          //         //  List<dynamic> suporte01 = [];
          //         //   suporte01.addAll(avisosEvento);
          //         avisosEvento.add('Tomar ' +
          //             medicamentosLista[i1].nome +
          //             ' ás ' +
          //             avisosDesseMed[i3].hora +
          //             ' QTD: ' +
          //             avisosDesseMed[i3].qtd.toString());
        }

        // if (map.containsKey(dia)) {
        //   List l = map[dia];
        //   l.addAll(avisosEvento);
        //   map.update(dia, (dynamic val) => val);
        // }
        //  map.putIfAbsent(dia, () => avisosEvento);
      }
      //     }
      //   }
      // }
    }
    events = map;
    _carregaEventos();
  }

  @action
  void _carregaEventos() {
    // print(lembretes.length.toString() + '  tamanho');
    // Map<DateTime, List> map = events;
    // for (var i = 0; i < lembretes.length; i++) {
    //   // print(i);
    //   // print(lembretes[i].remedio);
    //   // print(lembretes[i].dia);
    //   map.addAll({
    //     lembretes[i].dia: [
    //       lembretes[i].remedio,
    //       lembretes[i].remedio,
    //       lembretes[i].remedio
    //     ],
    //   });
    //}
    // print(map);

    //  events = map;
  }

  @action
  Future getMedicamentos() async {
    medicamentosLista = await _db.getAllMedicamentos();
    // print(medicamentosLista.length.toString() + '    tamanho ');
    // for (var i = 0; i < medicamentosLista.length; i++) {
    //   print(medicamentosLista[i].icone);
    // }
  }
}
