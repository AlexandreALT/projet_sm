import 'package:flutter/material.dart';
import 'package:projet_sm/Services/historiqueDB.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/chantiers/widgets/selectChantierListWidget.dart';
import 'package:projet_sm/models/historique.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:intl/intl.dart';

class AffectSite extends StatefulWidget {
  const AffectSite({Key? key, required this.produit}) : super(key: key);

  final Product produit;

  @override
  _AffectSiteState createState() => _AffectSiteState();
}

class _AffectSiteState extends State<AffectSite> {
  String _selectedChantierId = "YgF6enUZWycfQzG9U1wX";
  var numbercontroller = TextEditingController();

  void _onChantierChanged(String? value) {
    setState(() {
      _selectedChantierId = value ?? "YgF6enUZWycfQzG9U1wX";
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Affecter à un chantier",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      widget.produit.reference,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(widget.produit.numeroSerie!,
                        style: TextStyle(fontSize: 20)),
                    //Image.file(
                    //File(product.image),
                    //),
                    SizedBox(height: 40),
                    Text(
                      'Sélectionner un chantier',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: SelectChantierListWidget(
                        onChanged: _onChantierChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if(widget.produit.categorie == "Consommable")
              TextFormField(
                controller: numbercontroller,
                keyboardType: TextInputType.number,
                style:
                const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(50.0))),
                  filled: true,
                  fillColor:
                  Color.fromRGBO(232, 232, 232, 1.0),
                  hintText: 'Quantité',
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          onPressed: () {
            if(widget.produit.categorie == "Consommable"){
              num newquantite = widget.produit.quantite! - int.parse(numbercontroller.text);
              ProductDB().updateConsumable2(newquantite, widget.produit.reference);
              String statut = "Sortie";
              DateTime dateNow = DateTime.now();
              String formattedDate = DateFormat('dd/MM/yyyy').format(dateNow);
              Historique historiqueData = new Historique(chantier: _selectedChantierId, date: formattedDate, statut: statut, numSerieProduit: widget.produit.numeroSerie!, refProduit: widget.produit.reference, quantite: int.parse(numbercontroller.text));
              HistoriqueDB().addHistorique(historiqueData);
            } else{
              ProductDB().updateProduct(widget.produit.numeroSerie!, _selectedChantierId);
              numbercontroller.text = "1";
              String statut = widget.produit.idChantier != null ? "Entré" : "Sortie";
              DateTime dateNow = DateTime.now();
              String formattedDate = DateFormat('dd/MM/yyyy').format(dateNow);
              Historique historiqueData = new Historique(chantier: _selectedChantierId, date: formattedDate, statut: statut, numSerieProduit: widget.produit.numeroSerie!, refProduit: widget.produit.reference, quantite: int.parse(numbercontroller.text));
              HistoriqueDB().addHistorique(historiqueData);
            }
            Navigator.pushNamed(context, '/affect_success');
          },
          child: const Text(
            'Valider',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
