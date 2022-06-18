
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:welcome_login/ui/messageManel1.dart';
import 'package:welcome_login/ui/proforcust.dart';

import '../constants.dart';
import '../model/pharmacy.dart';

class ViewListPharmacy extends StatefulWidget {
  const ViewListPharmacy({Key? key}) : super(key: key);

  @override
  State<ViewListPharmacy> createState() => _ViewListPharmacyState();
}

class _ViewListPharmacyState extends State<ViewListPharmacy> {
  final items = ['BARAKI', 'BIRTOUTA', 'BAB EZZOUAR', 'OULED CHEBEL', 'HYDRA', 'TASSALA EL MERDJA', 'HEURAOUA', 'BABA ALI', 'BORJ EL BAHRI', ];
  String? value = 'BAB EZZOUAR';

  List<Pharmacy> listpharmacy = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: 300,
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color(0xFF00695C), width: 4, ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  iconSize: 30,
                  icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.teal[800]),
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() => this.value = value);
                  },
                ),
              )
          ),
          // StreamBuilder<QuerySnapshot>(
          //   stream: FirebaseFirestore.instance.collection('users').orderBy('nom').snapshots(),
          //   builder: (context, snp){
          //     if(snp.hasError){
          //       return const Center(child: Text('Error'),);
          //     }
          //     if(snp.hasData){
          //       listpharmacy = snp.data!.docs
          //           .map((doc) => Pharmacy.fromJson(doc.data() as Map<String, dynamic>)).toList();
          //       return ListView.builder(
          //           itemCount: listpharmacy.length,
          //           itemBuilder: (context, index){
          //             return Text(listpharmacy[index].pharmName);
          //           }
          //       );
          //     }else{
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
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
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie Hamdi-Pacha'),
                            subtitle: Text("0762642368"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie TEMIZA'),
                            subtitle: Text("0543365479"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie TRABELSI'),
                            subtitle: Text("023658947"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie REMIDI'),
                            subtitle: Text("0505469835"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie Cité CNEP'),
                            subtitle: Text("0736254947"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Pharmacie Centrale Des Hopitaux'),
                            subtitle: Text('023903018'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

}



class CustRecherche extends StatefulWidget {
  const CustRecherche({Key? key}) : super(key: key);

  @override
  State<CustRecherche> createState() => _CustRechercheState();
}

class _CustRechercheState extends State<CustRecherche> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.teal[700],
                ),
                onPressed: (){

                },
                /*=> FirebaseAuth.instance.signOut(),*/
              ),
                actions: [
                      IconButton(
                        icon: const Icon(Icons.search,
                          color: Colors.white,
                        ),
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Recherche();
                              },
                            ),
                          );
                        },
                      ),
                    ],
              title: const Text('Pages Des Recherches'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.local_pharmacy_sharp, size: 25,),
                    text: 'Parmacies',
                  ),
                  // Tab(
                  //   icon: Icon(Icons.medical_services, size: 25,),
                  //   text: 'Medicaments',
                  // ),s
                ],
              ),
              elevation: 20,
              flexibleSpace: Container(
                decoration: basicBackground,
              ),
            ),
            backgroundColor: Colors.teal[50],
            body: const TabBarView(
              children: [
                ViewListPharmacy(),
                // Center(child: Text('PAGE 2'),),
              ],
            ),
          )
      );
      // child: Scaffold(
      //   backgroundColor: Colors.white,
      //   appBar: AppBar(
      //     elevation: 20,
      //     backgroundColor: Colors.teal[400],
      //     // leading: IconButton(
      //     //   icon: Icon(Icons.arrow_back,
      //     //     color: Colors.teal[900],
      //     //   ),
      //     //   onPressed:() {
      //     //     Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) {
      //     //       return const ProfOrCust();
      //     //       },
      //     //     ),
      //     //     );
      //     //   },
      //     // ),
      //     actions: [
      //       IconButton(
      //         icon: const Icon(Icons.search,
      //           color: Colors.black,
      //         ),
      //         onPressed:(){
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return const Recherche();
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      //   body: Container(
      //     height: 20,
      //
      //   ),
      // ),
  }


}




