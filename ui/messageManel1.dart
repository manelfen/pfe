import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:welcome_login/ui/custRecherche.dart';

import '../constants.dart';
// import 'package:';     for firestore

class Recherche extends StatefulWidget {
  const Recherche({Key? key}) : super(key: key);

  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 10,
              flexibleSpace: Container(
                decoration: basicBackground,
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CustRecherche();
                      },
                    ),
                  );
                },
              ),
              title: Card(
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: 'rechercher un médicament...',
                  ),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Card(
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
                                leading: Icon(Icons.medical_services),
                                title: Text('BETEXIN'),
                                subtitle: Text('400mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('AFINITOR'),
                                subtitle: Text('10mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('ELISOR'),
                                subtitle: Text('20mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('CIAFAL'),
                                subtitle: Text('200mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('HELMINTOX'),
                                subtitle: Text('250mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('CARDITEL'),
                                subtitle: Text('20mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('PARALGAN'),
                                subtitle: Text('100mg/120mg/1000mg'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.medical_services),
                                title: Text('BETADINE'),
                                subtitle: Text('125ml'),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // body: StreamBuilder<QuerySnapshot>(
            //   stream: (name != "" && name != null)
            //       ? FirebaseFirestore.instance
            //           .collection('users')
            //           .where("med", arrayContains: name)
            //           .snapshots()
            //       : FirebaseFirestore.instance.collection("users").snapshots(),
            //   builder: (context, snapshots) {
            //     return (snapshots.connectionState == ConnectionState.waiting)
            //         ? const Center(
            //             child: CircularProgressIndicator(),
            //           )
            //         : ListView.builder(
            //             itemCount: snapshots.data!.docs.length,
            //             itemBuilder: (context, index) {
            //               DocumentSnapshot data = snapshots.data!.docs[index];
            //               return Container(
            //                 padding: const EdgeInsets.only(top: 16),
            //                 child: Column(
            //                   children: [
            //                     ListTile(
            //                       title: Text(
            //                         data['name'],
            //                         style: const TextStyle(
            //                             fontSize: 20,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                       leading: CircleAvatar(
            //                         child: Image.network(
            //                           data['imageUrl'],
            //                           width: 100,
            //                           height: 60,
            //                           fit: BoxFit.contain,
            //                         ),
            //                         radius: 10,
            //                         backgroundColor: Colors.teal[50],
            //                       ),
            //                     ),
            //                     const Divider(
            //                       thickness: 2,
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             },
            //           );
            //   },
            // )
      ),
    );
  }
}
