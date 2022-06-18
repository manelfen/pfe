// import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome_login/constants.dart';
import 'package:welcome_login/ui/ModifierStock.dart';
import 'package:welcome_login/model/pharmacy.dart';
import 'package:welcome_login/ui/recherchemedicament.dart';
import 'package:welcome_login/ui/rechercherPharmacie.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePharmcus extends StatefulWidget {
  Pharmacy pharmacy;

  ProfilePharmcus({Key? key, required this.pharmacy}) : super(key: key);

  @override
  State<ProfilePharmcus> createState() => _ProfilePharmcusState();
}

class _ProfilePharmcusState extends State<ProfilePharmcus> {
  /* User user = FirebaseAuth.instance.currentUser!;*/

  void _userEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Column(children: <Widget>[
                //update profile
                Row(children: <Widget>[
                  const Text("Update Profile"),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      //Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel),
                    color: Colors.deepOrange,
                    iconSize: 25,
                  ),
                ]),
                //update pharm name
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                            helperText: "Nom de Pharmacie",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //update phone number
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                            helperText: "Numero de telephone",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //update garde
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                            helperText: "Ouverture",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
                      style: ElevatedButton.styleFrom(primary: Colors.teal),
                    )
                  ],
                ),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.teal[900],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SearchScreen();
                },
              ),
            );
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 5.5,
        iconTheme: const IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          decoration: basicBackground,
        ),
      ),
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  sizedBoxTwenty,
                  Text(
                    widget.pharmacy.pharmName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  sizedBoxTwenty,
                  const Text(
                    "PHARMACIEN",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  sizedBoxTen,
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                          const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Les informations de la pharmacie ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          leading: Icon(Icons.location_city),
                                          title: Text("Ville "),
                                          subtitle: Text(widget.pharmacy.ville),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.email),
                                          title: const Text("Email"),
                                          subtitle: Text(widget.pharmacy.pharmEmail
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("N=Telephone "),
                                          subtitle: Text(widget.pharmacy.phone),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.add_box_rounded),
                                          title: Text("Garde"),
                                          subtitle: Text(widget.pharmacy.ouvert.toString()),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.all_inbox),
                                          title: Text("CNAS"),
                                          subtitle: Text(widget.pharmacy.CNAS.toString()),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.all_inbox),
                                          title: Text("CASNOS"),
                                          subtitle: Text(widget.pharmacy.CASNOS.toString()),
                                        ),

                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),

                                          title: Text("Location"),
                                          //link
                                          subtitle: Text(
                                              widget.pharmacy.adressemap
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        sizedBoxTwenty,

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              ;},
                            child: const Text(" localiser la pharmacie "),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.tealAccent[700],
                              shadowColor: Colors.teal[800],
                              padding: const EdgeInsets.all(10.0),

                            ),
                          ),
                        ),
                        sizedBoxTwenty,
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) {
    return const SearchMed();
                               }
                            )
                            );},
                            child: const Text(" rechercher un médicament "),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.tealAccent[700],
                              shadowColor: Colors.teal[800],
                              padding: const EdgeInsets.all(10.0),
                            ),
                          ),
                        ),
                        sizedBoxTwenty,

                        sizedBoxForty,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
