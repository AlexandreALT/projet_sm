import 'package:flutter/material.dart';
import 'package:projet_sm/alerts.dart';
import 'package:projet_sm/chantiers.dart';
import 'package:projet_sm/choice_capture.dart';
import 'package:projet_sm/logout.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/stock.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 45,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/deconnexion.png'),
              onPressed: () {
                Navigator.pushNamed(context, '/logout');
              },
            );
          },
        ),
        title: const Text(
          "Accueil",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/role.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/parametre.png'),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          Container(
              child: Text("Bienvenue, ... !",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              alignment: Alignment.center),
          SizedBox(height: 50),
          Text("Il y a X chantiers en cours.", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text("Il y a X articles en magasin", style: TextStyle(fontSize: 20)),
          Text("dont X sur chantier.", style: TextStyle(fontSize: 20)),
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {},
                    child: Column(children: [
                      Image.asset('assets/sorties_icon.png',
                          height: 30, fit: BoxFit.cover),
                      SizedBox(height: 10),
                      Text(
                        'V??rifier les \nsorties',
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      )
                    ])),
              ),
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chantiers');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [
                        Image.asset('assets/chantier_icon.png',
                            height: 30, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'Chantiers',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
              ),
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/stock');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [
                        Image.asset('assets/stock_icon.png',
                            height: 30, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'V??rifier les \nstocks',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/alerts');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [
                        Image.asset('assets/alert_icon.png',
                            height: 30, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'Alertes',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
              ),
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [
                        Image.asset('assets/data_icon.png',
                            height: 30, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'Exporter les \ndonn??es',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
              ),
              Container(
                width: 105,
                height: 105,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/choice_capture');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [
                        Image.asset('assets/arrows_icon.png',
                            height: 30, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'Entr??e / Sortie',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
