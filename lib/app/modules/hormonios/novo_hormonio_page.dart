import 'package:Projeto02/app/models/avisos.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  var _lemrete = 0;
  var _instrucoes = 0;

  var _avisos = [Aviso(data: '13:00', qtd: 2), Aviso(data: '14:00', qtd: 3)];

  // var _cidades = ['Santos', 'Porto Alegre', 'Campinas', 'Rio de Janeiro'];
  var _itemSelecionado;
  var _itemSelecionadoFrequencia = 'TODOS OS DIAS';
  String _dataInicio;
  var _iconesRemedios = [
    FontAwesomeIcons.capsules,
    FontAwesomeIcons.syringe,
    FontAwesomeIcons.tablets,
    FontAwesomeIcons.wineBottle,
    FontAwesomeIcons.utensilSpoon,
    FontAwesomeIcons.prescriptionBottle,
    FontAwesomeIcons.prescriptionBottleAlt,
    FontAwesomeIcons.cannabis,
  ];

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
          title: Text('NOVO MEDICAMENTO'),
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
                          margin: EdgeInsets.only(left: 10),
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
                          color: Colors.grey,
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
                            'TIPO DO ÍCONE',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        // color: Colors.indigo.shade100,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: CarouselSlider(
                          enlargeCenterPage: true,
                          viewportFraction: 0.5,
                          items: _iconesRemedios.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade50),
                                    child: Center(
                                      child: Icon(
                                        i,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                      ),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_instrucoes == 0) {
                              _instrucoes = 2;
                            } else if (_instrucoes == 2) {
                              _instrucoes = 0;
                            }
                          });
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                // width: double.infinity,
                                //color: Colors.yellow,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'INSTRUÇÕES',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.lightBlue,
                                margin: EdgeInsets.only(right: 20),
                                child: RotatedBox(
                                    quarterTurns: _instrucoes,
                                    child: Container(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Colors.grey.shade700,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: _instrucoes == 0 ? 0 : 60,
                        // color: Colors.indigo.shade100,
                        // width: MediaQuery.of(context).size.width * 0.7,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return alertaDosagem();
                                },
                              );
                              // this._itemSelecionado = novoItemSelecionado;
                            });
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text('DOSAGEM :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  ' APERTE PARA DEFINIR',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _instrucoes == 0 ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        height: _instrucoes == 0 ? 0 : 60,
                        // color: Colors.indigo.shade100,
                        // width: MediaQuery.of(context).size.width * 0.7,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return alertaObservacoes();
                                },
                              );
                              // this._itemSelecionado = novoItemSelecionado;
                            });
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text('OBSERVAÇÕES : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  ' APERTE PARA DEFINIR',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_lemrete == 0) {
                              _lemrete = 2;
                            } else if (_lemrete == 2) {
                              _lemrete = 0;
                            }
                          });
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                // width: double.infinity,
                                //color: Colors.yellow,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'AVISAR ANTES QUE ACABE',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.lightBlue,
                                margin: EdgeInsets.only(right: 20),
                                child: RotatedBox(
                                    quarterTurns: _lemrete,
                                    child: Container(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: Colors.grey.shade700,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // card
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: _lemrete == 0 ? 0 : 30,

                        // color: Colors.indigo.shade100,
                        // width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                            'Informe a quantidade de doses que você possui : ',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ),
                      // card
                      Container(
                        height: _lemrete == 0 ? 0 : 50,
                        margin: EdgeInsets.only(left: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Quantidade nesse momento'),
                        ),
                      ),

                      Container(
                        height: _lemrete == 0 ? 0 : 60,
                        // color: Colors.indigo.shade100,
                        // width: MediaQuery.of(context).size.width * 0.7,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return alertaObservacoes();
                                },
                              );
                              // this._itemSelecionado = novoItemSelecionado;
                            });
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text('QUANDO ?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  ' APERTE PARA DEFINIR',
                                  // QUANDO RESTAREM XX DOSES
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20)),
                ),
                // color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    // splashColor: Colors.pink,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NovoHormonioPage()),
                      );
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
              Container(
                height: 150,
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

  Widget alertaObservacoes() {
    return AlertDialog(
      title: Text(
        "OBSERVAÇÕES",
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
            //    width: 10,

            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Escreva alguma instrução:'),
            ),
          )
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

  Widget alertaDosagem() {
    return AlertDialog(
      title: Text(
        "Qual a dosagem ?",
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('QUANTIDADE:'),
                Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '00,00'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('MEDIDA:'),
                Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'GRAMA MILIGRA ETC'),
                  ),
                ),
              ],
            ),
          )
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
