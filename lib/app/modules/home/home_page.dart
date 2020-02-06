// import 'package:Projeto02/app/modules/hormonios/calendario_page.dart';
// import 'package:Projeto02/app/modules/hormonios/hormonios_page.dart';
import 'package:Projeto02/app/modules/calendario/calendario_page.dart';
import 'package:Projeto02/app/modules/home/controller.dart';
import 'package:Projeto02/app/modules/hormonio/hormonio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//import 'package:firebase_admob/firebase_admob.dart';
// import 'package:Projeto02/app/modules/hormonios/novo_hormonio_controller.dart';

enum OrderOptions { comofunciona, logout, comprar }

//final FirebaseAuth _auth = FirebaseAuth.instance;
final controller = Controller();

class HomePage extends StatefulWidget {
  HomePage();
  static const route = '/home-ui';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final controllerNovoMedicamento = Modular.get<NovoHormonioController>();

  //int _index1 = 0;
  //List<Tab> listTab = new List();
  List<Widget> listWidgets = new List();

  String titulo = '';

  @override
  void initState() {
    // FirebaseAdMob.instance
    //     .initialize(appId: "ca-app-pub-4315692542852907~8105772849");

    // startBanner();
    // displayBanner();
    super.initState();
  }

  // @override
  // void dispose() {
  //   myBanner?.dispose();
  //   //myInterstitial?.dispose();
  //   super.dispose();
  // }

  // void displayBanner() {
  //   myBanner
  //     ..load()
  //     ..show(
  //       anchorOffset: 0.0,
  //       anchorType: AnchorType.bottom,
  //     );
  // }

  // void startBanner() {
  //   myBanner = BannerAd(
  //     //
  //     //4315692542852907/4611033356
  //     adUnitId:
  //         // BannerAd.testAdUnitId,
  //         'ca-app-pub-4315692542852907/4611033356',
  //     size: AdSize.smartBanner,

  //     targetingInfo: targetingInfo,
  //     listener: (MobileAdEvent event) {
  //       if (event == MobileAdEvent.failedToLoad) {
  //         //  print('ddddddddddddddddddddddddddddddddeweeeeeeeeeeeeeeee');
  //         blocSingleton.bannerEvent.add(0);
  //         // MobileAdEvent.opened
  //         // MobileAdEvent.clicked
  //         // MobileAdEvent.closed
  //         // MobileAdEvent.failedToLoad
  //         // MobileAdEvent.impression
  //         // MobileAdEvent.leftApplication
  //       }
  //       print("BannerAd event is $event");
  //     },
  //   );
  // }

  // MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   keywords: <String>['industry', 'safety'],
  //   contentUrl: 'https://flutter.io',
  //   childDirected: false,
  //   testDevices: <String>[],
  // );

  // BannerAd myBanner;

  @override
  Widget build(BuildContext context) {
    //final  = Provider.of<Controller>(context);
    // final controllerHome = Modular.get<H>();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: Text('TRANSAPP')),
      body: Observer(
        builder: (_) {
          return carreagarPAginas();
        },
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('TRANSAPP'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('CALENDÁRIO'),
              onTap: () {
                Navigator.pop(context);
                controller.mudarPaginaCalendarios();
//Modular.to.pushNamed('/calendario');
              },
            ),
            ListTile(
              title: Text('HORMÔNIOS'),
              onTap: () {
                Navigator.pop(context);
                controller.mudarPaginaHormonios();
//Modular.to.pushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget carreagarPAginas() {
    if (controller.mostrarPagina == Pages.hormonios) {
      return HormonioPage();
    } else if (controller.mostrarPagina == Pages.calendario) {
      return CalendarioPage();
    }
    return CalendarioPage();
  }
}
