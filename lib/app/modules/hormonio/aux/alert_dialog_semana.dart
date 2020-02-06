import 'package:flutter/material.dart';

class AlertaDialogSemana extends StatefulWidget {
  final List<bool> diasDaSemana;
  final VoidCallback frequenciaSelecionada;

  AlertaDialogSemana({this.diasDaSemana, this.frequenciaSelecionada});

  @override
  _AlertaDialogSemanaState createState() => _AlertaDialogSemanaState();
}

class _AlertaDialogSemanaState extends State<AlertaDialogSemana>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "ESCOLHA OS DIAS DA SEMANA",
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[0],
                onChanged: (t) {
                  print(widget.diasDaSemana[0]);
                  widget.diasDaSemana[0] = !widget.diasDaSemana[0];
                  setState(() {});
                },
              ),
              Text('SEGUNDA')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[1],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[1] = !widget.diasDaSemana[1];
                  });
                },
              ),
              Text('TERÇA')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[2],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[2] = !widget.diasDaSemana[2];
                  });
                },
              ),
              Text('QUARTA')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[3],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[3] = !widget.diasDaSemana[3];
                  });
                },
              ),
              Text('QUINTA')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[4],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[4] = !widget.diasDaSemana[4];
                  });
                },
              ),
              Text('SEXTA')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[5],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[5] = !widget.diasDaSemana[5];
                  });
                },
              ),
              Text('SABADO')
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.diasDaSemana[6],
                onChanged: (t) {
                  setState(() {
                    widget.diasDaSemana[6] = !widget.diasDaSemana[6];
                  });
                },
              ),
              Text('DOMINGO')
            ],
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            setState(() {});
            widget.frequenciaSelecionada();
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
  }
}
