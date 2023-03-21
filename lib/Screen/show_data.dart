import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laptop_commerce/Database/database_service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';

import '../AdminPanel/input_data.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProductForm()),
          );
        },
        child: const Icon(Icons.add),
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
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Inventory')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('inventorylist')
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  listdata = DatabaseHelper().getData(snapshot);

                  return ListView.builder(
                      itemCount: listdata.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blueGrey),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.green,
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: Image.network(
                                          '${listdata[index].imgurl}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Company: ${listdata[index].company}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              'Model: ${listdata[index].model}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              'HDD: ${listdata[index].hDD}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              'SSD: ${listdata[index].ssd}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              'Company: ${listdata[index].company}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: ${listdata[index].price}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              laptopobj = listdata[index];
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Update(
                                                          laptopobj:
                                                              laptopobj,
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              child: Center(
                                                  child: Text('Update')),
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 80,
                                            child:
                                                Center(child: Text('Delete')),
                                            color: Colors.red,
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            ],
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
