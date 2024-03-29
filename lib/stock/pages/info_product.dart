import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/stock/pages/verif_delete_product.dart';
import 'package:projet_sm/tools/menu.dart';

class InfoProduct extends StatelessWidget {
  InfoProduct({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseStorage.instance.ref().child(product.image!);
    return FutureBuilder<String>(
        future: ref.getDownloadURL(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text(
                "Produit",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            drawer: Menu(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Text(
                    product.statut!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Container(
                    //height: MediaQuery.of(context).size.height - 500,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            product.reference,
                            style: TextStyle(fontSize: 25),
                          ),
                          Text('N° Série : ' + product.numeroSerie!,
                              style: TextStyle(fontSize: 20)),
                          snapshot.data == null
                              ? Text('Aucune image pour ce produit')
                              : Image.network(
                                  snapshot.data!,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Catégorie : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(product.categorie, style: TextStyle(fontSize: 20))
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Prix par jour : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(product.cout.toString(),
                          style: TextStyle(fontSize: 20))
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "Date d'ajout : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(product.date_ajout!, style: TextStyle(fontSize: 20))
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerifDeleteProduct(produit: product)));
                },
                child: const Text(
                  'Supprimer ce produit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}
