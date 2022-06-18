import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:welcome_login/model/medicament.dart';
import 'package:welcome_login/model/pharmacy.dart';
import 'package:welcome_login/ui/profilePharm.dart';
import 'package:welcome_login/ui/profilePharmacienp.dart';
import 'package:welcome_login/ui/proforcust.dart';
import 'package:url_launcher/url_launcher.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;
  String dropdownValue = 'BAB EZZOUAR';
  List<String> items=['BAB EZZOUAR', 'BORDJ EL BAHRI', 'AIN TAYA', 'ALGER CENTRE'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back,
                color: Colors.black,    ),
              onPressed:(){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfOrCust();},
                ),
              );
              }
          ),
          title: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                isShowUsers = true;
              });
            },
            items: items
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        body: isShowUsers
            ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('ville',isEqualTo: dropdownValue)
                .where('ouvert',isEqualTo: true)
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
                    Pharmacy pharmacy=Pharmacy.fromJson(data.docs[index].data());
                    return  ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePharmcus(pharmacy:pharmacy)));

                      },
                      title: Text(
                        pharmacy.pharmName,
                      ),
                      subtitle: Text(pharmacy.ville),
                    );
                  },
                ): Center(child: CircularProgressIndicator(),);
              }
            }
        )

            :Text(
            "       trouvez votre pharmacie ")
    );
  }}
