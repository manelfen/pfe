import 'package:flutter/material.dart';
import 'package:welcome_login/ui/custRecherche.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/welcome.dart';
import '../constants.dart';
import 'home.dart';

// class LogInProfilePharm extends StatelessWidget {
//   const LogInProfilePharm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => StreamBuilder<User?>(
//     stream: FirebaseAuth.instance.authStateChanges(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         //MyHomePage();
//         return const Home();
//       } else {
//         return const Home();
//       }
//     },
//   );
// }

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);
//
//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }
//
// class _AuthPageState extends State<AuthPage> {
//   bool isLogin = true ;
//
//   @override
//   Widget build(BuildContext context) => isLogin
//       ? const Home(onClickedSignUp: toggle)
//       : const ProfSignup(onclickedSignIn: toggle);
//
//   void toggle() => setState(() => isLogin = !isLogin );
// }

class ProfOrCust extends StatefulWidget {
  const ProfOrCust({Key? key}) : super(key: key);

  @override
  State<ProfOrCust> createState() => _ProfOrCustState();
}

class _ProfOrCustState extends State<ProfOrCust> {
/*
  late UserCredential userCredential;
*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: basicBackground,
            padding: const EdgeInsets.all(18),
            // height: size.height,
            // width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Your',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF00796B),
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Health First',
                                style: TextStyle(
                                  color: Colors.black87,
                                ))
                          ])),
                ),
                //logo
                SizedBox(
                  width: size.width,
                  height: size.height * .3,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo3.png',
                        width: 130,
                      ),
                      const SizedBox(height: 100),
                      ShadowDemo(),
                    ],
                  ),
                ),
                //professional
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                            return const Home();
                            /*return StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return const Center(child: Text('Something went wrong!'));
                                } else if (snapshot.hasData) {
                                  //MyHomePage();
                                  return ProfilePharm();
                                } else {
                                  //login form !!
                                  return const Home();
                                }
                              },
                            );*/
                            },
                          )
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Interface Pharmacien',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //vous voulez chercher
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const CustRecherche())
                      );
                    },
                    /*async {
                      final userCredential = await FirebaseAuth.instance.signInAnonymously();
                      if (kDebugMode) {
                        print(userCredential.user?.uid);
                      }
                      //call next page
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const CustRecherche())
                      );
                    },*/
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Localisation Pharmacie',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
