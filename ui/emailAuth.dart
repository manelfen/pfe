import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/ui/home.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/profsignup.dart';
import 'package:welcome_login/ui/welcome.dart';
import '../constants.dart';

class ProfSignup extends StatefulWidget {
  const ProfSignup({Key? key}) : super(key: key);

  @override
  State<ProfSignup> createState() => _ProfSignupState();
}

class _ProfSignupState extends State<ProfSignup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
 /* void dispose() {

    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*Future signUp() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
          // Utils.showSnackBar(e.message) ;
          // Utils.showSnackBar(e.message);

      }
    }*/

    return Scaffold(
      // backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: basicBackground,
          padding: const EdgeInsets.all(18),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * .3,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo3.png',
                          width: 130,
                        ),
                        const SizedBox(height: 10),
                        const ShadowDemo(),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .35, //sign up box size
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ]
                    ),
                    // key: formState,
                    child: Form(
                      key: formKey,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          //signup here text
                          const Positioned(
                            top: 10,
                            left: 20,
                            child: Text(
                              'Inscrivez-Vous Ici',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          //email input
                          Positioned(
                              top: 80,
                              left: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                         /* autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(email)
                                              ? 'Enter a valid email'
                                              : null,*/
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .6,
                                    child: greyDivider,
                                  ),
                                ],
                              )
                          ),
                          //pw
                          Positioned(
                              top: 160,
                              left: 15,
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          validator: (value) =>
                                              value != null && value.length < 6
                                                  ? 'Enter 6 or more char'
                                                  : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .6,
                                    child: greyDivider,
                                  ),
                                ],
                              )
                          ),
                          //i already have an account
                          Positioned(
                              top: 210,
                              // left: 20,
                              child: SizedBox(
                                width: size.width * 1.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => const Home()
                                              )
                                          );
                                        },
                                        child: const Center(
                                          child: Text(
                                            "J'ai déjà un compte",
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
                            child: GestureDetector(
                              onTap: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ProfilePharm();
                                    },
                                  ),
                                );

                              /*async {

                                try {
                                  signUp;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const PickFile(),
                                      )
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (kDebugMode) {
                                    print(e);
                                    return;
                                  }
                                }*/

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return const PickFile();
                                //     },
                                //   ),
                                // );
                              },
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
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

class PickFile extends StatefulWidget {
  const PickFile({Key? key}) : super(key: key);

  @override
  State<PickFile> createState() => _PickFileState();
}

class _PickFileState extends State<PickFile> {
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? file!.path : 'Aucun fichier selectionner';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter Votre Certificat",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 5.5,
        iconTheme: const IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          decoration: basicBackground,
        ),
      ),
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {

                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );

                  if (result == null) return;
                  final path = result.files.single.path!;

                  setState(() => file = File(path));
                },
                child: const Text(
                    "choisir Fichier du Certificat",
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.tealAccent[700],
                shadowColor: Colors.teal[800],
                padding: const EdgeInsets.all(10.0),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              fileName,
              style: const TextStyle(fontSize: 16),
            ),
            sizedBoxTwenty,
            ElevatedButton(
                onPressed: () {

                },
             /*   async {
                  if (file == null) return;
                  final destination = 'files/$fileName';

                  try {
                    final ref = FirebaseStorage.instance.ref(destination);
                    ref.putFile(file!);
                  } on FirebaseException catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                    return;
                  }
                },*/
                child: const Text(
                    "Uploader Fichier",
                ),

              style: ElevatedButton.styleFrom(
                primary: Colors.tealAccent[700],
                shadowColor: Colors.teal[800],
                padding: const EdgeInsets.all(10.0),
              ),
            ),
            sizedBoxForty,
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PharmInfo();
                    },
                  ),
                );
              },
              child: const Text(" Voir Info Pharmacie "),
              style: ElevatedButton.styleFrom(
                primary: Colors.tealAccent[700],
                shadowColor: Colors.teal[800],
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
