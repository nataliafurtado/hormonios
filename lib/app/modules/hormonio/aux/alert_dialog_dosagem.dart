// import 'package:flutter/material.dart';

// class AlertaDialogDosagem extends StatefulWidget {
//   final int  quantidade;
//   String medida;
//   List<String> medidas;
//   final VoidCallback carregarDosagem;

//   AlertaDialogDosagem(
//       {this.quantidade, this.medida, this.medidas, this.carregarDosagem});

//   @override
//   _AlertaDialogDosagemState createState() => _AlertaDialogDosagemState();
// }

// class _AlertaDialogDosagemState extends State<AlertaDialogDosagem>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController(
//         text: widget.quantidade == null ? '' : widget.quantidade.toString());
//     return

//     AlertDialog(
//       title: Text(
//         "Qual a dosagem ?",
//         style: TextStyle(color: Colors.blue),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//             height: 100,
//             width: 300,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Text('QUANTIDADE:'),
//                 Container(
//                   width: 100,
//                   child: TextField(
//                     controller: controller,
//                     keyboardType: TextInputType.number,
//                     onChanged: (t) {
//                       setState(() {
//                         widget.quantidade = int.parse(t);
//                       });
//                     },
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: '00,00'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 100,
//             //  width: 600,
//             // color: Colors.red.shade200,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Text('MEDIDA:'),
//                 Container(
//                     //width: 30,
//                     child: DropdownButton<String>(
//                         isExpanded: false,
//                         // hint: Text(''),
//                         items: widget.medidas.map((String dropDownStringItem) {
//                           return DropdownMenuItem<String>(
//                             value: dropDownStringItem,
//                             child: Text(dropDownStringItem),
//                           );
//                         }).toList(),
//                         onChanged: (String novoItemSelecionado) {
//                           setState(() {
//                             this.widget.medida = novoItemSelecionado;
//                           });
//                         },
//                         value: widget.medida)),
//               ],
//             ),
//           )
//         ],
//       ),
//       actions: [
//         FlatButton(
//           child: Text("Cancelar"),
//           onPressed: () {
//             setState(() {});
//             Navigator.pop(context);
//           },
//         ),
//         FlatButton(
//           child: Text("Continar"),
//           onPressed: () {
//             print(widget.quantidade);
//             widget.carregarDosagem();
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }
