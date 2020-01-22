import 'package:Projeto02/app/models/avisos.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class NovoHormonioPage extends StatefulWidget {
  @override
  _NovoHormonioPageState createState() => _NovoHormonioPageState();
}

class _NovoHormonioPageState extends State<NovoHormonioPage> {
  @override
  void initState() {
    _dataInicio = 'HOJE , ' +
        DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(DateTime.now());
    super.initState();
  }

  String nomeCidade = "";
  var _cidades = ['A CADA X HORAS', 'X VEZES POR DIA'];
  var _frequencia = [
    'TODOS OS DIAS',
    'DIAS ESPECÍFICOS DA SEMANA',
    'INTERVALO DE DIAS',
    'CICLO RECORRENTE'
  ];
  int _duracao = 0;

  var _avisos = [Aviso(data: '13:00', qtd: 2), Aviso(data: '14:00', qtd: 3)];

  // var _cidades = ['Santos', 'Porto Alegre', 'Campinas', 'Rio de Janeiro'];
  var _itemSelecionado;
  var _itemSelecionadoFrequencia = 'TODOS OS DIAS';
  String _dataInicio;

  AlertDialog alertAcadaXHoras = AlertDialog(
    title: Text(""),
    content: Text("Deseja continuar aprendendo Flutter ?"),
    actions: [
      // cancelaButton,
      //continuaButton,
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        // color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'NOME DO MEDICAMENTO',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TextField(
                          // decoration: InputDecoration(
                          //     border: InputBorder.none,
                          //     hintText: 'Enter a search term'),
                          )
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        // color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'HORÁRIO DOS AVISOS',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      criaDropDownButton()
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        // color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'FREQUÊNCIA',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          child: Row(
                            children: <Widget>[
                              Text('DATA DE INÍCIO:  ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                _dataInicio,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        // width: double.infinity,
                        //color: Colors.indigo.shade100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('DURAÇÂO:   ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            RaisedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return carregaDuracao();
                                  },
                                );
                              },
                              child: Text(_duracao == 0
                                  ? 'SEM DATA DE FIM'
                                  : _duracao.toString()),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      DropdownButton<String>(
                          isExpanded: false,

                          //  hint: Text('Selecione um tipo'),
                          items: _frequencia.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String novoItemSelecionado) {
                            _dropDownItemSelected(novoItemSelecionado);
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  //  return alertaXvezesPorDia();
                                },
                              );
                              this._itemSelecionadoFrequencia =
                                  novoItemSelecionado;
                            });
                          },
                          value: _itemSelecionadoFrequencia)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        // color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'TIPO DO REMÉDIO',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  criaDropDownButton() {
    return Container(
      child: Column(
        children: <Widget>[
          // Text("QUAL O TIPO DE AVISO ? "),
          DropdownButton<String>(
              isExpanded: false,
              hint: Text('Selecione um tipo'),
              items: _cidades.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String novoItemSelecionado) {
                _dropDownItemSelected(novoItemSelecionado);
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return alertaXvezesPorDia();
                    },
                  );
                  this._itemSelecionado = novoItemSelecionado;
                });
              },
              value: _itemSelecionado),
          Container(
            height: 20,
          ),
          Container(
            height: 100,
            color: Colors.amberAccent.shade100,
            child: ListView.builder(
              itemCount: _avisos.length,
              itemBuilder: (ctx, indexAvisos) {
                return ListTile(
                  onTap: () {
                    // setState(() {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return avisoDialog();
                    //     },
                    //   );
                    // });
                  },
                  title: InkWell(
                      onTap: () {
                        _selectTime(indexAvisos);
                      },
                      child: Container(child: Text(_avisos[indexAvisos].data))),
                  trailing: InkWell(
                      onTap: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return alertaQTDDoses();
                            },
                          );
                        });
                      },
                      child: Container(
                          child: Text(
                              '${_avisos[indexAvisos].qtd.toString()} DOSE(S)'))),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  Widget carregaDuracao() {
    return AlertDialog(
      title: Text(
        "QUANTIDADE DE DIAS ?",
        style: TextStyle(color: Colors.blue),
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new NumberPicker.integer(
              initialValue: 0,
              highlightSelectedValue: false,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              minValue: 0,
              maxValue: 100,
              onChanged: (d) {
                setState(() {
                  _duracao = d;
                });
              })
        ],
      ),
      actions: [
        FlatButton(
          child: Text("SEM DATA DE FIM"),
          onPressed: () {
            setState(() {
              _duracao = 0;
            });
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("CONTINUAR"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget alertaQTDDoses() {
    return AlertDialog(
      title: Text(
        "Quantas doses ?",
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RotatedBox(
              quarterTurns: 2,
              child: Container(
                child: Icon(
                  Icons.navigation,
                  size: 20,
                  color: Colors.blue,
                ),
              )),
          Container(
            height: 80,
            // width: 100,
            child: CarouselSlider(
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        //  width: 50,
                        //height: 40.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: Center(
                          child: Text(
                            '$i',
                            style: TextStyle(fontSize: 32.0),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          RotatedBox(
              quarterTurns: 2,
              child: Container(
                child: Icon(
                  Icons.swap_horiz,
                  size: 30,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {
              _itemSelecionado = null;
            });
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Continar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget alertaXvezesPorDia() {
    return AlertDialog(
      title: Text(
        "Quantos avisos por dia ?",
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RotatedBox(
              quarterTurns: 2,
              child: Container(
                child: Icon(
                  Icons.navigation,
                  size: 20,
                  color: Colors.blue,
                ),
              )),
          Container(
            height: 80,
            // width: 100,
            child: CarouselSlider(
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        //  width: 50,
                        //height: 40.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: Center(
                          child: Text(
                            '$i',
                            style: TextStyle(fontSize: 32.0),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          RotatedBox(
              quarterTurns: 2,
              child: Container(
                child: Icon(
                  Icons.swap_horiz,
                  size: 30,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {
              _itemSelecionado = null;
            });
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Continar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future _selectDate() async {
    //  print(tempo[0].trim());
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    DateTime data = DateTime.now();
    // if (tempo[0].isNotEmpty) {
    //   DateTime data = dateFormat.parse(tempo[0].trim());
    // }
    DateTime picked =
        await showDatePicker(context: context, initialDate: DateTime.now());
    if (picked != null) {
      // if (blocnovoRelat
      //         .perguntasRelatoController.value[indexPergunta].resposta ==
      //     null) {
      //   blocnovoRelat
      //           .perguntasRelatoController.value[indexPergunta].resposta =
      //       formatDate(picked, [dd, '/', mm, '/', yyyy]) + ' : 00:00';
      // } else {
      //   blocnovoRelat
      //           .perguntasRelatoController.value[indexPergunta].resposta =
      //       formatDate(picked, [dd, '/', mm, '/', yyyy]) +
      //           blocnovoRelat
      //               .perguntasRelatoController.value[indexPergunta].resposta
      //               .substring(10);
      // }
    }
  }

  Future _selectTime(int index) async {
    TimeOfDay picked = await showTimePicker(
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
      context: context,
      initialTime: TimeOfDay.now()
      // : TimeOfDay(
      //     hour: int.parse(tempo[1].trim()),
      //     minute: int.parse(tempo[2].trim())
      //     )
      ,
    );
    if (picked != null) {
      setState(() {
        _avisos[index].data =
            picked.hour.toString() + ':' + picked.minute.toString();
      });

      // if (blocnovoRelat
      //         .perguntasRelatoController.value[indexPergunta].resposta ==
      //     null) {
      //   blocnovoRelat
      //           .perguntasRelatoController.value[indexPergunta].resposta =
      //       '00/00/0000 : ' +
      //           picked.hour.toString() +
      //           ':' +
      //           picked.minute.toString();
      // } else {
      //   blocnovoRelat.perguntasRelatoController.value[indexPergunta]
      //       .resposta = blocnovoRelat
      //           .perguntasRelatoController.value[indexPergunta].resposta
      //           .substring(0, 10) +
      //       ' : ' +
      //       picked.hour.toString() +
      //       ':' +
      //       picked.minute.toString();
      // }
    }
    // blocnovoRelat.perguntasRelatoEvent
    //    .add(blocnovoRelat.perguntasRelatoController.value);
  }
}
