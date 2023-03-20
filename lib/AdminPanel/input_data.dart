// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptop_commerce/Database/database_service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';
import '../Screen/show_data.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late String imgUrl = '';
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _company;
  late TextEditingController _condition;
  late TextEditingController _hdd;
  late TextEditingController _model;
  late TextEditingController _ram;
  late TextEditingController _ssd;
  late TextEditingController _price;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _company = TextEditingController();
    _condition = TextEditingController();
    _hdd = TextEditingController();
    _model = TextEditingController();
    _price = TextEditingController();
    _ram = TextEditingController();
    _ssd = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Entry',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowData()),
                );
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _company,
                  decoration: InputDecoration(
                    labelText: 'Company',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a company';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _condition,
                  decoration: InputDecoration(
                    labelText: 'Condition',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a condition';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _hdd,
                  decoration: InputDecoration(
                    labelText: 'HDD',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a HDD';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _model,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a model';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _ram,
                  decoration: InputDecoration(
                    labelText: 'RAM',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a RAM';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _ssd,
                  decoration: InputDecoration(
                    labelText: 'SSD',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a SSD';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _price,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          
                        });
                        ImagePicker imagePicker = ImagePicker();
                        XFile? filesource = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        String randomNumber =
                            DateTime.now().millisecondsSinceEpoch.toString();

                        Reference ref = FirebaseStorage.instance
                            .ref()
                            .child('images')
                            .child(randomNumber);
                        await ref.putFile(File(filesource!.path));
                        imgUrl = await ref.getDownloadURL();
                      } catch (e) {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: e.toString(),
                        );
                      }
                    },
                    icon: const Icon(Icons.camera_alt)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Laptop laptop = Laptop(
                          imgurl: imgUrl.toString(),
                          company: _company.text.toString(),
                          condition: _condition.text.toString(),
                          hDD: _hdd.text.toString(),
                          model: _model.text.toString(),
                          rAM: _ram.text.toString(),
                          ssd: _ssd.text.toString(),
                          price: _price.text.toString());

                      await DatabaseHelper().addInventory(laptop);

                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        text: "Your Data was save successfully!",
                      );
                      _company.text = '';
                      _condition.text = '';
                      _hdd.text = '';
                      _model.text = '';
                      _price.text = '';
                      _ram.text = '';
                      _model.text = '';
                      _ssd.text = '';
                    } else {}
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
