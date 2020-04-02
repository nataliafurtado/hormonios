import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cheganotificacao_controller.dart';

class CheganotificacaoPage extends StatefulWidget {
  final String title;
  const CheganotificacaoPage({Key key, this.title = "Cheganotificacao"})
      : super(key: key);

  @override
  _CheganotificacaoPageState createState() => _CheganotificacaoPageState();
}

class _CheganotificacaoPageState
    extends ModularState<CheganotificacaoPage, CheganotificacaoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            //  color: Colors.blue.shade50,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 60.0),
                  // height: 100,
                  child: Text(
                    'Título reportagem trans',
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
                ),
                Container(
                  child: Text(
                    'www.link.com.br',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                //   color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      '19:30',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // color: Colors.blueGrey,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(Icons.next_week),
                                title: Text('data'),
                                subtitle: Text('aaaa'),
                              ),
                            );
                          })),
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child:
                      // Padding(
                      //  padding: const EdgeInsets.all(5.0),
                      //  child:
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.cancel,
                              color: Colors.blue.shade700,
                              size: 30,
                            ),
                            Text(
                              'PULAR\nTODOS',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue.shade700,
                              size: 30,
                            ),
                            Text(
                              'TOMAR\nTODOS',
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.watch_later,
                              color: Colors.blue.shade700,
                              size: 30,
                            ),
                            Text(
                              'ADIAR',
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
