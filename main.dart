import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/ui/profsignup.dart';
import 'package:welcome_login/ui/rechercherPharmacie.dart';
import 'package:welcome_login/ui/utils.dart';
import 'ui/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(apiKey: "AIzaSyD4V3ZN229xZqbSWaUzbu6gVELoFsTQzwU",
          appId: "1:758748177876:web:ea4b372a1286a5ab796241",
          messagingSenderId: "758748177876",
          projectId: "mypharm-2874a"
          ,storageBucket: "mypharm-2874a.appspot.com",)
    ); } else
  {await Firebase.initializeApp();}
  runApp(const MyApp()
  );
}

// final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // navigatorKey: navigatorKey,
      // scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: SearchScreen (),
      // debugShowCheckedModeBanner: false,
    );
  }
}
