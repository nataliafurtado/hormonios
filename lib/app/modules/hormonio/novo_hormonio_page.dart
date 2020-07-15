import 'package:Projeto02/app/helpers/styles.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/modules/hormonio/aux/alert_dialog_semana.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:Projeto02/app/modules/hormonio/novo_medicamento_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

// class NovoHormonio extends StatefulWidget {
//   final String title;
//   const NovoHormonio({Key key, this.title = "Hormonio"}) : super(key: key);

//   @override
//   _NovoHormonioState createState() => _NovoHormonioState();
// }

// class _NovoHormonioState extends State<NovoHormonio> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[Text('controller.value.toString()')],
//       ),
//     );
//   }
// }

class NovoHormonioPage extends StatefulWidget {
  @override
  _NovoHormonioPageState createState() => _NovoHormonioPageState();
}

class _NovoHormonioPageState extends State<NovoHormonioPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String _alerta;

// nome
  String _nome;
// Horário dos avisos
  var _tipoAviso = ['A CADA X HORAS', 'X VEZES POR DIA'];
  String _avisoSelecionado;
  var _aCadaXHoras = [1, 2, 3, 4, 6, 8, 12, 24];

  var _qtdDose;
  List<Aviso> _avisos = [];
  int indexQtdPorHoras;
  int indexXVezesPorDia;
// Frequencia
  DateTime _dataInicio = DateTime.now();
  List<String> frequencia = [
    'TODOS OS DIAS',
    'DIAS ESPECÍFICOS DA SEMANA',
    'INTERVALO DE DIAS',
    'CICLO RECORRENTE'
  ];
  int _duracao = 0;
  int _intervaloDeDias;
  var _frequenciaSelecionada = 'TODOS OS DIAS';
  List<bool> diasDaSemana = [false, false, false, false, false, false, false];
// Tipo do icone
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
  int _indexIcone;
// Instruções
//dosagens
  List<String> _medidas = [
    'g',
    'mg',
    'UI',
    'mcg',
    'mcg/ml',
    'mEq',
    'ml',
    '%',
    'mg/g',
    'mg/cm2',
    'mg/ml',
    'mcg/h',
    'Ampola',
    'Dose',
  ];
// observacoes

  List<String> _observacoes = [
    'Antes das refeições',
    'Depois das refeições',
    'Durante as Refeiçoes',
    'Em jejum',
  ];

  // avisar antes q acabe  reabastecimento
  int quantidadeAntesAvisarReabastecimento;
  int estoque;
  String horaAvisarReabastecimento;
  bool avisarReabastecimento = false;

  final controllerNovoMedicamento = Modular.get<NovoMedicamentoController>();

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerquantidadeAntesAvisarReabastecimento =
      TextEditingController();
  TextEditingController controllerestoque = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title:
              Text('NOVO MEDICAMENTO', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                              'NOME DO MEDICAMENTO (*)',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextFormField(
                          onChanged: (t) {
                            _nome = t;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              String alert = 'O campo nome é obrigatório';
                              _alerta = alert;
                              return alert;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Digite aqui o medicamento'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),

                ///
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      elevation: 2,
                      child: ConfigurableExpansionTile(
                        animatedWidgetFollowingHeader: const Icon(
                          Icons.expand_more,
                          color: const Color(0xFF707070),
                        ),
                        headerExpanded: Flexible(
                          child: Container(
                            width: double.infinity,
                            // color: Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'FREQUÊNCIA',
                                style: TextStyle(
                                    color: blueTrans.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        header: Expanded(
                          child: Container(
                            // color: Colors.yellow,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'FREQUÊNCIA',
                                      style: TextStyle(
                                          color: blueTrans.shade900,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    DropdownButton<String>(
                                        isExpanded: false,

                                        //  hint: Text('Selecione um tipo'),
                                        items: frequencia
                                            .map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(dropDownStringItem),
                                          );
                                        }).toList(),
                                        onChanged:
                                            (String novoItemSelecionado) {
                                          setState(() {
                                            this._frequenciaSelecionada =
                                                novoItemSelecionado;

                                            if (novoItemSelecionado !=
                                                'TODOS OS DIAS') {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  if (novoItemSelecionado ==
                                                      'DIAS ESPECÍFICOS DA SEMANA') {
                                                    return AlertaDialogSemana(
                                                      diasDaSemana:
                                                          diasDaSemana,
                                                      frequenciaSelecionada:
                                                          selecionarFrequeTodosOsDia,
                                                    );
                                                  } else if (novoItemSelecionado ==
                                                      'INTERVALO DE DIAS') {
                                                    return alertaIntervaloDeDias();
                                                  } else {
                                                    // return alertaDialogSemana();
                                                  }
                                                },
                                              );
                                            }
                                          });
                                        },
                                        value: _frequenciaSelecionada),
                                    Text(
                                      (_intervaloDeDias == 0 ||
                                              _intervaloDeDias == null)
                                          ? ''
                                          : '${_intervaloDeDias.toString()} dias',
                                      style:
                                          TextStyle(color: blueTrans.shade900),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton<String>(
                                  isExpanded: false,

                                  //  hint: Text('Selecione um tipo'),
                                  items: frequencia
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String novoItemSelecionado) {
                                    setState(() {
                                      this._frequenciaSelecionada =
                                          novoItemSelecionado;

                                      if (novoItemSelecionado !=
                                          'TODOS OS DIAS') {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            if (novoItemSelecionado ==
                                                'DIAS ESPECÍFICOS DA SEMANA') {
                                              return AlertaDialogSemana(
                                                diasDaSemana: diasDaSemana,
                                                frequenciaSelecionada:
                                                    selecionarFrequeTodosOsDia,
                                              );
                                            } else if (novoItemSelecionado ==
                                                'INTERVALO DE DIAS') {
                                              return alertaIntervaloDeDias();
                                            } else {
                                              // return alertaDialogSemana();
                                            }
                                          },
                                        );
                                      }
                                    });
                                  },
                                  value: _frequenciaSelecionada),
                              Text(
                                (_intervaloDeDias == 0 ||
                                        _intervaloDeDias == null)
                                    ? ''
                                    : '${_intervaloDeDias.toString()} dias',
                                style: TextStyle(color: blueTrans.shade900),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _selectDate();
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: <Widget>[
                                  Text('DATA DE INÍCIO:  ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    DateFormat(
                                            DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                                        .format(_dataInicio),
                                    style: TextStyle(
                                        color: blueTrans.shade900,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                RaisedButton(
                                  elevation: 2,
                                  color: Colors.grey.shade200,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return carregaDuracao();
                                      },
                                    );
                                  },
                                  child: Text(
                                    _duracao == 0
                                        ? 'SEM DATA DE FIM'
                                        : '${_duracao.toString()} dias',
                                    style: TextStyle(
                                        color: blueTrans.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 10,
                          )
                        ],
                      )

                      //

                      //
                      ),
                ),

//
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
                              'HORÁRIO DOS AVISOS (*)',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        horarioDosAvisosDropDown()
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
                              'TIPO DO ÍCONE',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          //  color: Colors.indigo.shade100,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CarouselSlider(
                            enlargeCenterPage: true,
                            viewportFraction: 0.55,
                            onPageChanged: (indexIcone) {
                              _indexIcone = indexIcone;
                            },
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
                                          color: blueTrans.shade900,
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
                    child:

                        //
                        ConfigurableExpansionTile(
                      animatedWidgetFollowingHeader: const Icon(
                        Icons.expand_more,
                        color: const Color(0xFF707070),
                      ),
                      headerExpanded: Flexible(
                        child: Container(
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'INSTRUÇÕES',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      header: Flexible(
                        child: Container(
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'INSTRUÇÕES',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      children: [
                        Container(
                          height: 60,
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
                              });
                            },
                            child: Observer(
                              builder: (_) {
                                return Container(
                                  height: 50,
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text('DOSAGEM :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        controllerNovoMedicamento
                                            .carregardosagem,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
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
                              });
                            },
                            child: Container(
                              height: 50,
                              // width: MediaQuery.of(context).size.width * 0.7,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: <Widget>[
                                  Text('OBSERVAÇÕES : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Observer(
                                    builder: (_) {
                                      return Expanded(
                                        child: Text(
                                          controllerNovoMedicamento
                                              .carregaObservacoes,
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: blueTrans.shade900,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      // height: 600,
                      child: ConfigurableExpansionTile(
                        animatedWidgetFollowingHeader: const Icon(
                          Icons.expand_more,
                          color: const Color(0xFF707070),
                        ),
                        headerExpanded: Flexible(
                            child: Container(
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'AVISAR ANTES QUE ACABE',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                        header: Flexible(
                            child: Container(
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'AVISAR ANTES QUE ACABE',
                              style: TextStyle(
                                  color: blueTrans.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                        children: [
                          Container(
                            height: 60,
                            child: Switch(
                              value: avisarReabastecimento,
                              onChanged: (value) {
                                setState(() {
                                  avisarReabastecimento = value;
                                });
                              },
                              activeTrackColor: Colors.lightBlue.shade100,
                              activeColor: blueTrans.shade900,
                            ),
                          ),
                          Container(
                            height: avisarReabastecimento ? 30 : 0,

                            // color: Colors.indigo.shade100,
                            // width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                                'Informe a quantidade total de doses que você possui : ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          // card
                          Container(
                            height: avisarReabastecimento ? 50 : 0,
                            margin: EdgeInsets.only(left: 10),
                            child: TextField(
                              onChanged: (t) {
                                estoque = int.parse(t);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Digite a quantidade em estoque nesse momento'),
                            ),
                          ),

                          Container(
                            height: avisarReabastecimento ? 30 : 0,

                            // color: Colors.indigo.shade100,
                            // width: MediaQuery.of(context).size.width * 0.7,
                            child: Text('Avisar quando faltar quantas doses ?',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          // card
                          Container(
                            height: avisarReabastecimento ? 50 : 0,
                            margin: EdgeInsets.only(left: 10),
                            child: TextField(
                              onChanged: (t) {
                                quantidadeAntesAvisarReabastecimento =
                                    int.parse(t);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Digite a quantidade aqui'),
                            ),
                          ),

                          Container(
                            height: avisarReabastecimento ? 60 : 0,
                            // color: Colors.indigo.shade100,
                            // width: MediaQuery.of(context).size.width * 0.7,
                            child: InkWell(
                              onTap: () {
                                selectTimeAvisoReabasteciemnto();
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text('QUE HORAS AVISAR ?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      horaAvisarReabastecimento == null
                                          ? ' APERTE PARA DEFINIR'
                                          : '    $horaAvisarReabastecimento',
                                      // QUANDO RESTAREM XX DOSES
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: blueTrans.shade900,
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
                ),
                Container(
                  height: 20,
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: blueTrans,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20)),
                  ),
                  // color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: InkWell(
                      // splashColor: Colors.pink,
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          if (_avisos.isEmpty) {
                            _alerta = 'Selecione o horário dos avisos';
                            mostrarDialogValidacao();
                          } else {
                            salvar();
                            Modular.to.pushNamed('/listaMedicamentos');
                          }
                        } else {
                          mostrarDialogValidacao();
                        }
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
                // Container(
                //   height: 50,
                //   child: RaisedButton(
                //     onPressed: () {
                //       controllerNovoMedicamento.getMedicamento();
                //     },
                //   ),
                // ),
                Container(
                  height: 150,
                )
              ],
            ),
          ),
        ));
  }

  Future<void> salvar() {
    return controllerNovoMedicamento.salvarNovoMedcicamento(
        _nome,
        _avisos,
        _dataInicio,
        _duracao,

        // freqeuncia
        _frequenciaSelecionada,
        diasDaSemana,
        _intervaloDeDias,
        // icone
        _indexIcone == null ? _iconesRemedios[0] : _iconesRemedios[_indexIcone],
        //
        //reabastecimento
        estoque,
        quantidadeAntesAvisarReabastecimento,
        horaAvisarReabastecimento,
        avisarReabastecimento);
  }

  selecionarFrequeTodosOsDia() {
    setState(() {
      _frequenciaSelecionada = 'TODOS OS DIAS';
    });
  }

  horarioDosAvisosDropDown() {
    return Container(
      child: Column(
        children: <Widget>[
          // Text("QUAL O TIPO DE AVISO ? "),
          DropdownButton<String>(
              isExpanded: false,
              hint: Text('Selecione um tipo'),
              items: _tipoAviso.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String novoItemSelecionado) {
                setState(() {
                  this._avisoSelecionado = novoItemSelecionado;
                });
                setState(() {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      if (novoItemSelecionado == 'X VEZES POR DIA') {
                        return alertaXvezesPorDia();
                      } else {
                        return alertaACadaXHoras();
                      }
                    },
                  );
                  this._avisoSelecionado = novoItemSelecionado;
                });
              },
              value: _avisoSelecionado),
          Container(
            height: 20,
          ),
          Visibility(
            visible: _avisos.isNotEmpty,
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('HORA'),
                  Text('QTDE'),
                ],
              ),
            ),
          ),
          Container(
            height: 55.0 * _avisos.length,
            color: Colors.grey.shade100,
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
                      child: Container(
                          child: Text(
                        _avisos[indexAvisos].hora.toString() +
                            ':' +
                            _avisos[indexAvisos].minuto.toString(),
                        style: TextStyle(
                            color: blueTrans.shade900,
                            fontWeight: FontWeight.bold),
                      ))),
                  trailing: InkWell(
                      onTap: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return alertaQTDDoses(indexAvisos);
                            },
                          );
                        });
                      },
                      child: Container(
                          child: Text(
                        '${_avisos[indexAvisos].qtd.toString()} DOSE(S)',
                        style: TextStyle(color: blueTrans.shade900),
                      ))),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget alertaIntervaloDeDias() {
    return AlertDialog(
      title: Text(
        "A cada quantos dias ?",
        style: TextStyle(color: blueTrans.shade900),
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
              maxValue: 60,
              onChanged: (d) {
                setState(() {
                  _intervaloDeDias = d;
                });
              })
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {
              _intervaloDeDias = 0;
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

  Widget carregaDuracao() {
    return AlertDialog(
      title: Text(
        "QUANTIDADE DE DIAS ?",
        style: TextStyle(color: blueTrans.shade900),
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberPicker.integer(
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

  Widget alertaQTDDoses(int indexAvisos) {
    return AlertDialog(
      title: Text(
        "Quantas doses ?",
        style: TextStyle(color: blueTrans.shade900),
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
                  color: blueTrans.shade900,
                ),
              )),
          Container(
            height: 80,
            // width: 100,
            child: CarouselSlider(
              initialPage: 0,
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              onPageChanged: (indexPage) {
                _qtdDose = indexPage;
              },
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
                  color: blueTrans.shade900,
                ),
              )),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {});
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Continuar"),
          onPressed: () {
            setState(() {
              _avisos[indexAvisos].qtd = _qtdDose == null ? 1 : _qtdDose + 1;
            });
            _qtdDose = null;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget alertaValidacao() {
    return AlertDialog(
      title: Text(
        "AVISO",
        style: TextStyle(color: blueTrans.shade900),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            child: Icon(
              Icons.warning,
              size: 30,
              color: Colors.red,
            ),
          ),
          Container(
            height: 80,
            child: Text(_alerta),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Continuar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget alertaObservacoes() {
    TextEditingController controller2 = TextEditingController(
        text: controllerNovoMedicamento.observacaoEscrita == null
            ? ''
            : controllerNovoMedicamento.observacaoEscrita);
    return Observer(
      builder: (_) {
        return AlertDialog(
          title: Text(
            "OBSERVAÇÕES",
            style: TextStyle(color: blueTrans.shade900),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButton<String>(
                isExpanded: false,
                hint: Text('Selecione um tipo'),
                items: _observacoes.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String novoItemSelecionado) {
                  controllerNovoMedicamento.observacaoSelecionada =
                      novoItemSelecionado;
                },
                value: controllerNovoMedicamento.observacaoSelecionada,
              ),
              Container(
                //    width: 10,

                child: TextField(
                  controller: controller2,
                  onChanged: (t) {
                    controllerNovoMedicamento.observacaoEscrita = t;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Escreva alguma instrução:'),
                ),
              )
            ],
          ),
          actions: [
            FlatButton(
              child: Text("Zerar"),
              onPressed: () {
                setState(() {});
                controllerNovoMedicamento.zerarObservacao();
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Continuar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget alertaDosagem() {
    TextEditingController controller1 = TextEditingController(
        text: controllerNovoMedicamento.quantidadeDsagem == null
            ? ''
            : controllerNovoMedicamento.quantidadeDsagem.toString());
    return Observer(builder: (_) {
      return AlertDialog(
        title: Text(
          "Qual a dosagem ?",
          style: TextStyle(color: blueTrans.shade900),
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
                      controller: controller1,
                      keyboardType: TextInputType.number,
                      onChanged: (t) {
                        setState(() {
                          controllerNovoMedicamento.quantidadeDsagem =
                              int.parse(t);
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '00,00'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              //  width: 600,
              // color: Colors.red.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('MEDIDA:'),
                  Container(
                      //width: 30,
                      child: DropdownButton<String>(
                          isExpanded: false,
                          // hint: Text(''),
                          items: _medidas.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String novoItemSelecionado) {
                            setState(() {
                              controllerNovoMedicamento.medidaDOsagem =
                                  novoItemSelecionado;
                            });
                          },
                          value: controllerNovoMedicamento.medidaDOsagem)),
                ],
              ),
            )
          ],
        ),
        actions: [
          FlatButton(
            child: Text("Zerar"),
            onPressed: () {
              controllerNovoMedicamento.zerarDosagem();
              // controllerNovoMedicamento.carregardosagem();
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Continuar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  Widget alertaXvezesPorDia() {
    return AlertDialog(
      title: Text(
        "Quantos avisos por dia ?",
        style: TextStyle(color: blueTrans.shade900),
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
                  color: blueTrans.shade900,
                ),
              )),
          Container(
            height: 80,
            // width: 100,
            child: CarouselSlider(
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              initialPage: 3,
              onPageChanged: (indepassada) {
                indexXVezesPorDia = indepassada;
                // print(indexQtsHoras);
              },
              items: [
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24
              ].map((i) {
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
                  color: blueTrans.shade900,
                ),
              )),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {
              print('vrrvr');
              indexXVezesPorDia = null;
              _avisoSelecionado = null;
              _avisos.clear();
            });
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Continuar"),
          onPressed: () {
            carregarAvisosPorDia();
            indexXVezesPorDia = null;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget alertaACadaXHoras() {
    return AlertDialog(
      title: Text(
        "A cada quantas horas ?",
        style: TextStyle(color: blueTrans.shade900),
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
                  color: blueTrans.shade900,
                ),
              )),
          Container(
            height: 80,
            // width: 100,
            child: CarouselSlider(
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              initialPage: 3,
              onPageChanged: (indexQtsPorHorasPassada) {
                indexQtdPorHoras = indexQtsPorHorasPassada;
                // print(indexQtsHoras);
              },
              items: _aCadaXHoras.map((i) {
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
                  color: blueTrans.shade900,
                ),
              )),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {
              indexQtdPorHoras = null;
              _avisoSelecionado = null;
              _avisos.clear();
            });
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Continuar"),
          onPressed: () {
            carreagarAvisosAcadaXHoras();
            indexQtdPorHoras = null;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future _selectDate() async {
    // DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    // DateTime data = DateTime.now();
    // if (tempo[0].isNotEmpty) {
    //   DateTime data = dateFormat.parse(tempo[0].trim());
    // }
    DateTime picked = await showDatePicker(
      context: context,
      //locale: Locale('pt'),
      initialDate: _dataInicio,
      firstDate: DateTime(2020),
      lastDate: DateTime(2021),
    );
    if (picked != null) {
      setState(() {
        _dataInicio = picked;
      });
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
        _avisos[index].hora = picked.hour;
        _avisos[index].minuto = picked.minute;
        //.toString() + ':' + picked.minute.toString();
      });
    }
  }

  Future selectTimeAvisoReabasteciemnto() async {
    TimeOfDay picked = await showTimePicker(
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    print(picked);
    if (picked != null) {
      setState(() {
        horaAvisarReabastecimento =
            picked.hour.toString() + ':' + picked.minute.toString();
      });
    } else {
      setState(() {
        horaAvisarReabastecimento = null;
      });
    }
  }

  void carreagarAvisosAcadaXHoras() {
    //print(indexQtdPorHoras);
    int qtd = indexQtdPorHoras == null ? 4 : _aCadaXHoras[indexQtdPorHoras];
    qtd = (24 / qtd).round();
    _avisos.clear();
    setState(() {
      for (var i = 0; i < qtd; i++) {
        _avisos.add(Aviso(hora: 13, minuto: 00, qtd: 1));
      }
    });
  }

  void carregarAvisosPorDia() {
    print(indexXVezesPorDia);
    int qtd = indexXVezesPorDia == null ? 4 : indexXVezesPorDia + 1;
    _avisos.clear();
    setState(() {
      for (var i = 0; i < qtd; i++) {
        _avisos.add(Aviso(hora: 13, minuto: 00, qtd: 1));
      }
    });
  }

  void mostrarDialogValidacao() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return alertaValidacao();
      },
    );
  }
}
