import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  var _passwordVisible = false;
  bool? _value = false;

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
                  Image.asset('assets/logo.png',
                      height: 200.0, fit: BoxFit.cover),
                  const Text(
                    'StockMag\'',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Connexion',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  labelText: 'Adresse mail',
                  hintText: 'Entrez votre adresse mail',
                  filled: true,
                  fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe',
                  filled: true,
                  fillColor: const Color.fromRGBO(232, 232, 232, 1),

                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      _passwordVisible = !_passwordVisible;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/verification_code');
                    },
                    child: const Text(
                      'Mot de passe oubli?? ?',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              Row(children: <Widget>[
                Checkbox(
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(width: 2, color: Colors.black),
                  ),
                  value: _value,
                  onChanged: (bool? val) {
                    _value = val;
                  },
                ),
                const Text(
                  'Rester connect?? ',
                  style: TextStyle(fontSize: 17.0),
                ),
              ]),
              const SizedBox(height: 50), //SizedBox
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
                      Navigator.pushNamed(context, '/accueil');
                    },
                    child: const Text(
                      'Connexion',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          )),
    );
  }
}
