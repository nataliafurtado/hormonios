import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HormonioPage extends StatefulWidget {
  final String title;
  const HormonioPage({Key key, this.title = "Hormonio"}) : super(key: key);
  @override
  _HormonioPageState createState() => _HormonioPageState();
}

// final Map<DateTime, List> _holidays = {
//   DateTime(2019, 1, 1): ['New Year\'s Day'],
//   DateTime(2019, 1, 6): ['Epiphany'],
//   DateTime(2019, 2, 14): ['Valentine\'s Day'],
//   DateTime(2019, 4, 21): ['Easter Sunday'],
//   DateTime(2019, 4, 22): ['Easter Monday'],
// };

// List<Medicamento> medicamentos = [
//   Medicamento(nome: 'Perluan'),
//   Medicamento(nome: 'Acetato')
// ];

final controllerListaHormonios = Modular.get<ListaHomoniosController>();

class _HormonioPageState extends State<HormonioPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    controllerListaHormonios.getMedicamentos();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //color: Colors.cyanAccent.shade100,
            height: MediaQuery.of(context).size.height - 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                builder: (_) {
                  return
                      //  controllerListaHormonios.medicamentosLista.isEmpty
                      //     ? Center(
                      //         child: CircularProgressIndicator(),
                      //       )
                      //     :
                      ListView.builder(
                    itemCount:
                        controllerListaHormonios.medicamentosLista.length,
                    itemBuilder: (ctx, indexMedicamentos) {
                      return Card(
                        child: InkWell(
                          // splashColor: Colors.orange,
                          onTap: () {
//
                            controllerListaHormonios.getMedicamento(
                                controllerListaHormonios
                                    .medicamentosLista[indexMedicamentos].id);
//medicamentopage
                            Modular.to.pushNamed('/medicamento');
                            // Modular.to.pushNamed(
                            //     '/medicamento/${controllerListaHormonios.medicamentosLista[indexMedicamentos].id}');
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: ListTile(
                                // contentPadding: EdgeInsets.symmetric(
                                //     horizontal: 10.0, vertical: 10.0),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 0, 10),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade800))),
                                  child:
                                      //  Icon(FontAwesomeIcons.yinYang.hashCode),

                                      Icon(IconData(
                                          controllerListaHormonios
                                              .medicamentosLista[
                                                  indexMedicamentos]
                                              .icone,
                                          fontPackage: 'font_awesome_flutter',
                                          fontFamily: 'FontAwesomeSolid')),
                                  //    Icon(Icons.autorenew, color: Colors.blue),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      controllerListaHormonios
                                          .medicamentosLista[indexMedicamentos]
                                          .nome,
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: controllerListaHormonios
                                                  .medicamentosLista[
                                                      indexMedicamentos]
                                                  .ativo ==
                                              true
                                          ? Icon(
                                              FontAwesomeIcons.bell,
                                              size: 16,
                                              color: Colors.blue,
                                            )
                                          : Icon(
                                              FontAwesomeIcons.bellSlash,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                    ),
                                  ],
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today,
                                            size: 15, color: Colors.pink),
                                        Text(
                                            controllerListaHormonios
                                                .carregaTituloDaLista(
                                                    controllerListaHormonios
                                                            .medicamentosLista[
                                                        indexMedicamentos]),
                                            style: TextStyle(
                                                color: Colors.grey.shade600))
                                      ],
                                    ),
                                    Visibility(
                                      visible: controllerListaHormonios
                                              .medicamentosLista[
                                                  indexMedicamentos]
                                              .dosagem !=
                                          null,
                                      child: Row(
                                        children: <Widget>[
                                          // Icon(Icons.calendar_today,
                                          //     color: Colors.pink),

                                          Text(
                                            '${controllerListaHormonios.medicamentosLista[indexMedicamentos].dosagem != null ? controllerListaHormonios.medicamentosLista[indexMedicamentos].dosagem.toString() : ''}' +
                                                '${controllerListaHormonios.medicamentosLista[indexMedicamentos].medida != null ? controllerListaHormonios.medicamentosLista[indexMedicamentos].medida : ''}',
                                            style: TextStyle(
                                                color: Colors.blue.shade600),
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                    ),

//
                                    Visibility(
                                      visible: controllerListaHormonios
                                              .medicamentosLista[
                                                  indexMedicamentos]
                                              .dosagem !=
                                          null,
                                      child: Row(
                                        children: <Widget>[
                                          // Icon(Icons.calendar_today,
                                          //     color: Colors.pink),
                                          Expanded(
                                            child: Text(
                                                'Dosagem: ' +
                                                    '${controllerListaHormonios.medicamentosLista[indexMedicamentos].observacoes != null ? controllerListaHormonios.medicamentosLista[indexMedicamentos].observacoes.toString() : ''}',
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade600)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white, size: 30.0)),
                          ),
                        ),
                        elevation: 2,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.only(bottom: 15),
            //width: 300,

            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.all(const Radius.circular(20)),
            ),
            // color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                // splashColor: Colors.pink,
                onTap: () {
                  Modular.to.pushNamed('/novohormonio');
                  // Navigator.push(
                  //   context,

                  //   MaterialPageRoute(builder: (context) => NovoHormonioPage()),
                  // );
                  //   controllerListaHormonios.carregaTituloDaLista(4);

                  //controllerListaHormonios.apagarMedicamento(1);

                  // IconData a = Icons.watch_later;

                  // int tt = a.codePoint;
                  // print(tt);
                  // setState(() {
                  //   teste = tt;
                  // });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    Container(
                      width: 20,
                    ),
                    Text(
                      'ADICIONAR MEDICAMENTO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
