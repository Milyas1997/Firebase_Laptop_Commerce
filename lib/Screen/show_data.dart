import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laptop_commerce/Database/database_service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';

import '../AdminPanel/input_data_copy.dart';
import '../AdminPanel/update_data.dart';
import 'login_screen.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late String company;
  // late String Condition;
  // late String Ram;
  // late String hdd;
  // late String ssd;
  // late String price;
  //late String model;
  // ignore: prefer_typing_uninitialized_variables
  late var studentobj;
  late Laptop laptopobj;
  List<Laptop> listdata = [];

  // Future<void> getData() async {
  //   final _firestorinstance =
  //       await FirebaseFirestore.instance.collection('Inventory').snapshots();
  //   await for (var snapshot in _firestorinstance) {
  //     for (var docss in snapshot.docs) {
  //       laptopobj = Laptop.fromSnapshot(docss);
  //       listdata.add(laptopobj);

  //       //print('Price are:${laptopobj.Price}');
  //       //print(docs.runtimeType);
  //       //print(docss.data());
  //       //final data = await docss.data;
  //     }

  //     // Future<List<Laptop>> listdata = getData();
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProductForm()),
          );
        },
        child: const Icon(  Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text(
          'Inventory Avaliable',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Inventory')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('inventorylist')
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  
                  
                  listdata = DatabaseHelper().getData(snapshot);
                  //print(listdata);
                  // Map<String, dynamic> mydatasnap;
                  // List<QueryDocumentSnapshot<Map<String, dynamic>>> inventoryfield = snapshot.data!.docs;
                  // for (QueryDocumentSnapshot<Map<String, dynamic>> snap in inventoryfield) {
                  //   mydatasnap = snap.data();
                  //  // print('mydatasnap are: $mydatasnap');
                  //   var datafirst = Laptop.fromSnapshot(mydatasnap);

                  //   listdata.add(datafirst);
                  // }
                  return ListView.builder(
                      itemCount: listdata.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueGrey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                        listdata[index].imgurl.toString())),
                                ListTile(
                                  leading: Text(listdata[index].imgurl.toString()),
                                  title: Text(listdata[index].company),
                                  subtitle: Text('SSD:${listdata[index].ssd}'),
                                  trailing:
                                      Text('Price:${listdata[index].price}'),

                                  //leading: Text(ssd),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Laptop laptop = Laptop(
                                        id: listdata[index].id,
                                        company: listdata[index].company,
                                        condition: listdata[index].condition,
                                        hDD: listdata[index].hDD,
                                        model: listdata[index].model,
                                        rAM: listdata[index].rAM,
                                        ssd: listdata[index].rAM,
                                        price: listdata[index].price);

                                    //we have got ID on three different way follow as under

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Update(
                                              objid: listdata[index].id,
                                              laptopobj: laptop,
                                              id: snapshot.data!.docs[index])),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 60,
                                    color: Colors.red,
                                    child: const Center(child: Text('Update')),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                }
                // else if (listdata.isEmpty) {
                //   return const Center(
                //       child: Text(
                //     'No Inventory Yet Added',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold),
                //   ));
                // }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              }))),
    );
  }
}
