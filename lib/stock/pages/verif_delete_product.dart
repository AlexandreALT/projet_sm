import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';

import '../../models/product.dart';

class VerifDeleteProduct extends StatelessWidget {

  final Product produit;

  VerifDeleteProduct({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset('assets/info.png',
                      height: 150.0, fit: BoxFit.cover),
                  const SizedBox(height: 40),
                  const Text(
                    'Ce produit est sur le point d\'être supprimé.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                  const Text(
                    'Voulez-vous vraiment le retirer ?',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                  const SizedBox(height: 40),
                ],
              ), //SizedBox
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      ProductDB().deleteProduit(produit);
                      Navigator.pushNamed(context, '/delete_product');
                    },
                    child: const Text(
                      'Oui',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              const SizedBox(height: 40),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      'Non',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          )),
    );
  }
}
