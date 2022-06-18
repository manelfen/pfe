import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/model/medicament.dart';
import 'package:welcome_login/model/pharmacy.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/profilePharmacienp.dart';
import 'package:welcome_login/ui/proforcust.dart';
import 'package:url_launcher/url_launcher.dart';
class SearchMed extends StatefulWidget {
  // Pharmacy pharmacy;
  // Medicament medicament;
  const SearchMed({Key? key, }) : super(key: key);

  @override
  State<SearchMed> createState() => _SearchMedState();
}
class _SearchMedState extends State<SearchMed> {
  final TextEditingController search2Controller = TextEditingController();

  bool isShowUsers = false;
  String name='';

  var pharmacy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.green,
          
          leading: IconButton(
              icon: Icon(Icons.arrow_back,
                color: Colors.black,    ),
               onPressed:(){ }
          ),
          title:  Card(
            child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black,), hintText: 'rechercher un médicament...',

                ),
                onChanged: (val){
                  setState(() {
                    isShowUsers = true;
                    name = val;
                  });
                } ),
          ),
        ),
        body: isShowUsers
            ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(pharmacy.id)
                .collection('listmed')
                .where('nom', isEqualTo:name )
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else {
                var data=(snapshot.data! as dynamic);
                return data.docs.length !=0?ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    Medicament medicament=Medicament.fromJson(data.docs[index].data());
                    return  ListTile(

                      title:
                      Text(medicament.nom
                        ,
                      ),
                      subtitle: Text(medicament.quantite),
                    );
                  },
                ): Center(child: CircularProgressIndicator(),);
              }
            }
        )

            :Text(
            "       trouvez votre medicament ")
    );
  }}
