
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/ui/home.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/welcome.dart';
import '../model/pharmacy.dart';
import '../constants.dart';
import '../repositiry/pharmRepo.dart';


class PharmInfo extends StatefulWidget {
  const PharmInfo({Key? key}) : super(key: key);

  @override
  State<PharmInfo> createState() => _PharmInfoState();
}

class _PharmInfoState extends State<PharmInfo> {

/*final FirebaseAuth auth = FirebaseAuth.instance;

Future<User> getCurrentUser() async {
  return await auth.currentUser!;
}*/
// User user = FirebaseAuth.instance.currentUser!;


  final formKey = GlobalKey<FormState>();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final controllerPharmName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerVille = TextEditingController();
  final controllerLocationLink = TextEditingController();
  final controllerCnas = TextEditingController();
  final controllerCasnos = TextEditingController();
  final controllerGarde = TextEditingController();
  int group = 1;

  @override


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

      return Scaffold(
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
                        height: size.height * .7,//sign up box size
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.teal[50],
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
                                  'Entre Vous Informations',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              //pharmacy name
                              Positioned(
                                  top: 60,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.account_circle,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerPharmName,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Nom Prénom',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: const Divider(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              //phone number
                              Positioned(
                                  top: 140,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.call_sharp,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerPhoneNumber,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'phone number',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //ville
                              Positioned(
                                  top: 220,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_city,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerVille,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'OULED CHEBEL',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //address location link
                              Positioned(
                                  top: 300,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerLocationLink,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'https://goo.gl/maps/algeria',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //cnas
                              Positioned(
                                  top: 370,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.all_inbox,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            // child: Radio(
                                            //   value: 1,
                                            //   groupValue: group,
                                            //   onChanged: (T) {
                                            //     if (kDebugMode) {
                                            //       print(T);
                                            //     }
                                            //     setState(() {
                                            //       group = T;
                                            //     });
                                            //   },
                                            // ),
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerCnas,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'CNAS oui / non',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //casnos
                              Positioned(
                                  top: 440,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.all_inbox,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            // child: Radio(
                                            //   value: 1,
                                            //   groupValue: group,
                                            //   onChanged: (T) {
                                            //     if (kDebugMode) {
                                            //       print(T);
                                            //     }
                                            //     setState(() {
                                            //       group = T;
                                            //     });
                                            //   },
                                            // ),
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerCasnos,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'CASNOS oui / non',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //garde
                              Positioned(
                                  top: 510,
                                  left: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.all_inbox,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: 300,
                                            // child: Radio(
                                            //   value: 1,
                                            //   groupValue: group,
                                            //   onChanged: (T) {
                                            //     if (kDebugMode) {
                                            //       print(T);
                                            //     }
                                            //     setState(() {
                                            //       group = T;
                                            //     });
                                            //   },
                                            // ),
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                              controller: controllerGarde,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'GARDE de nuit oui/non',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * .7,
                                        child: greyDivider,
                                      ),
                                    ],
                                  )
                              ),
                              //arrow
                              Positioned(
                                bottom: -30,
                                right: 30,
                                child: GestureDetector(
                                  onTap:() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) {
                                            return ProfilePharm();
                                            },
                                            ),
                                    );
                                    /*final pharmacy = Pharmacy(controllerPharmName.text, int.parse(controllerPhoneNumber.text),
                                        controllerVille.text, controllerLocationLink.text, true, false, true);
                                    addUser(pharmacy);
                                    if (kDebugMode) {
                                      print(pharmacy);*/

                                    // _pharmacy.pharmName = controllerPharmName.text;
                                    // _pharmacy.phoneNumber = controllerPhoneNumber as num;
                                    // _pharmacy.ville = controllerVille.text;
                                    // _pharmacy.locationLink = controllerLocationLink.text;
                                    // _pharmacy.assurance = controllerAssurance.text;
                                    // // final uid = Provider.of(context).auth;
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const Home();
                                        },
                                      ),
                                    );*/
                                  },
                                  //arrow shape
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
