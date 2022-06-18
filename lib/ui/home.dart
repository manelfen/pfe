import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/ui/emailAuth.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/proforcust.dart';
import 'package:welcome_login/ui/profsignup.dart';
import 'package:welcome_login/ui/welcome.dart';
import '../constants.dart';


class LogInProfilePharm extends StatelessWidget {
  const LogInProfilePharm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ProfilePharm();
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late final UserCredential credential;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override

  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

 /*   Future signIn() async {

      try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }

        //Navigator.of(context) not working!
        // navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
    }*/

    return Scaffold(
      // backgroundColor: const Color(0xfff0f1f5),
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // width: double.infinity,
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: basicBackground,
          padding: const EdgeInsets.all(18),
            child: SizedBox(
              height: double.infinity,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: RichText(
                            text: const TextSpan(
                                text: 'Your',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color(0xFF00796B),
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                              TextSpan(
                                  text: ' Health First',
                                  style: TextStyle(
                                    color: Colors.black87,
                                  )
                              )
                            ])
                        ),
                      ),
                    ],
                  ),
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
                        const ShadowDemo(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ]
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        //login here text
                        const Positioned(
                          top: 10,
                          left: 20,
                          child: Text(
                            'Connectez-Vous Ici',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        //email input
                        Positioned(
                            top: 50,
                            left: 20,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail_outline,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: 300,
                                      child: TextFormField(
                                        controller: emailController,
                                        cursorColor: Colors.grey,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'example@gmail.com',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * .8,
                                  child: const Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                        ),
                        //pw
                        Positioned(
                            top: 120,
                            left: 20,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: 300,
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        cursorColor: Colors.grey,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'mot de passe',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * .8,
                                  child: const Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                        ),
                        //create an account text
                        Positioned(
                            top: 160,
                            left: -10,
                            child: SizedBox(
                              // width: size.width * .8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (_) => const ProfSignup()
                                                /*StreamBuilder<User?>(
                                                  stream: FirebaseAuth.instance.authStateChanges(),
                                                  builder: (context, snapshot) {
                                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                                    return const Center(child: CircularProgressIndicator());
                                                  } else if (snapshot.hasError) {
                                                    return const Center(child: Text("Quelque chose s'est Mal passé!"));
                                                  } else if (snapshot.hasData) {
                                                    //MyHomePage();
                                                    return ProfilePharm();
                                                  } else {
                                                    //login form !!
                                                    return const ProfSignup();
                                                  }
                                                },
                                        ),*/

                                        )
                                        );
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Créer Compte',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (_) => const Home()));
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Mot De Passe Oublier',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        //arrow
                        Positioned(
                          bottom: -30,
                          right: 30,
                          //arrow
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => ProfilePharm()
                                  ));
                            },
                            /*signIn,*/
                            child: Container(
                              padding: const EdgeInsets.all(22),
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff004D40),
                                      Color(0xff1DE9B6),
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/right-arrow.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          )
        ),
    ));
  }
}
