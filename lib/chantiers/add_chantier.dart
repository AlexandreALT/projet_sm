import 'package:flutter/material.dart';

class AddChantier extends StatelessWidget {
  const AddChantier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text(
          "Ajouter un chantier",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Intitulé du chantier',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Nom du client',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.datetime,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Date de début',
                suffixIcon: IconButton(icon: Icon(Icons.calendar_month), onPressed: () {},)
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Adresse du chantier',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 3),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/new_chantier');
                    },
                    child: const Text(
                      'Valider',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Annuler',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}