import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Laptop.dart';

class DatabaseHelper {
  final _firbase = FirebaseFirestore.instance;

  //Authentication with email and password

  Future<bool> authenticateWithEmailAndPassword(email, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }

//Add Data to the firestor firebase
  Future<void> addInventory(Laptop laptop) async {
    DocumentReference<Map<String, dynamic>> idRef = _firbase
        .collection('Inventory')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('inventorylist')
        .doc();

    await idRef.set({
      'imgurl': laptop.imgurl,
      'ID': idRef.id,
      'Company': laptop.company,
      'Condition': laptop.condition,
      'HDD': laptop.hDD,
      'Model': laptop.model,
      'Price': laptop.price,
      'RAM': laptop.rAM,
      'SSD': laptop.ssd,
    });
  }

  //Fetch Data From firestore Firebase and save in the list and return it.
  List<Laptop> getData(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    List<Laptop> laptopdata = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>> inventoryfield =
        snapshot.data!.docs;
    for (QueryDocumentSnapshot<Map<String, dynamic>> snap in inventoryfield) {
      Map<String, dynamic> mydatasnap = snap.data();

      laptopdata.add(Laptop.fromSnapshot(mydatasnap));
    }
    return laptopdata;
  }

//Update Data to the firestor firebase
  Future<void> updateInventory(Laptop laptop, var id) async {
    await _firbase
        .collection('Inventory')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('inventorylist')
        .doc(id)
        .update({
      'Company': laptop.company,
      'Condition': laptop.condition,
      'HDD': laptop.hDD,
      'Model': laptop.model,
      'Price': laptop.price,
      'RAM': laptop.rAM,
      'SSD': laptop.ssd,
    });
  }

  //Delete data from firstore firebase

   DeleteRecord(var id, var uid) async {
    //var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Inventory')
        .doc(uid)
        .collection('inventorylist')
        .doc(id)
        .delete();
    
  }
}
