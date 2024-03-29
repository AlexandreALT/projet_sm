import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_sm/accueil.dart';
import 'package:projet_sm/chantiers/pages/add_chantier.dart';
import 'package:projet_sm/chantiers/pages/chantiers.dart';
import 'package:projet_sm/chantiers/pages/new_chantier.dart';
import 'package:projet_sm/firebase_options.dart';
import 'package:projet_sm/log/login.dart';
import 'package:projet_sm/roles/gestion_roles.dart';
import 'package:projet_sm/scan/affect_success.dart';
import 'package:projet_sm/scan/choice_capture.dart';
import 'package:projet_sm/scan/manual_entry.dart';
import 'package:projet_sm/scan/retour_success.dart';
import 'package:projet_sm/scan/scan_error.dart';
import 'package:projet_sm/stock/pages/add_category.dart';
import 'package:projet_sm/stock/pages/add_product.dart';
import 'package:projet_sm/stock/pages/add_reference.dart';
import 'package:projet_sm/alerts.dart';
import 'package:projet_sm/profile/edit_profile.dart';
import 'package:projet_sm/log/leave_app.dart';
import 'package:projet_sm/stock/pages/choice_picture.dart';
import 'package:projet_sm/stock/pages/delete_product.dart';
import 'package:projet_sm/stock/pages/new_category.dart';
import 'package:projet_sm/stock/pages/new_product.dart';
import 'package:projet_sm/stock/pages/new_reference.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/profile/profile.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/stock/pages/stock.dart';
import 'package:projet_sm/log/verification_code.dart';
import 'package:projet_sm/log/logout.dart';
import 'package:projet_sm/stock/pages/historique.dart';

import 'Services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.camera}) : super(key: key);

  final camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: AuthService().userChanged,
        builder: (context, snapshot){
          return snapshot.data == null ? Login() : Accueil();
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'StockMag\'',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // Log :
        '/leave_app': (context) => new LeaveApp(),
        '/logout': (context) => new Logout(),
        '/verification_code': (context) => new VerificationCode(),

        // Chantiers :
        '/chantiers': (context) => new Chantiers(),
        '/add_chantier': (context) => new AddChantier(),
        '/new_chantier': (context) => new NewChantier(),

        // Profile :
        '/profile': (context) => new Profile(),
        '/edit_profile': (context) => new EditProfile(),

        // Stock :
        '/add_category': (context) => new AddCategory(),
        '/add_product': (context) => new AddProduct(image: null),
        '/add_reference': (context) => new AddReference(),
        '/choice_picture': (context) => new ChoicePicture(camera: camera,),
        '/new_category': (context) => new NewCategory(),
        '/new_product': (context) => new NewProduct(),
        '/new_reference': (context) => new NewReference(),
        '/stock': (context) => new Stock(),
        '/delete_product': (context) => new DeleteProduct(),
        '/historique': (context) => new Historique(),


        // Rôles :
        '/gestion_roles' :(context) => new GestionRoles(),

        // Tools :
        '/menu': (context) => new Menu(),

        '/accueil': (context) => new Accueil(),
        '/alerts': (context) => new Alerts(),
        '/choice_capture': (context) => new ChoiceCapture(),
        '/settings': (context) => new Settings(),
        '/manual_entry': (context) => new ManualEntry(),
        '/scan_error': (context) => new ScanError(),
        '/affect_success': (context) => new AffectSuccess(),
        '/retour_success': (context) => new RetourSuccess(),
      },
    );
  }
}
