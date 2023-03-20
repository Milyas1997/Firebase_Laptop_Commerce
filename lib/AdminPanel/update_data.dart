// ignore_for_file: use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:laptop_commerce/Database/database_service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';
import '../Screen/show_data.dart';

class Update extends StatefulWidget {
  final Laptop laptopobj;
  // ignore: prefer_typing_uninitialized_variables
  final id;
  // ignore: prefer_typing_uninitialized_variables
  final objid;

  const Update(
      {super.key,
      required this.laptopobj,
      required this.id,
      required this.objid});

  @override
  // ignore: library_private_types_in_public_api
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final GlobalKey<FormState> mykey = GlobalKey<FormState>();
  late TextEditingController _company;
  late TextEditingController _condition;
  late TextEditingController _hdd;
  late TextEditingController _model;
  late TextEditingController _ram;
  late TextEditingController _ssd;
  late TextEditingController _price;
  late String condition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _company = TextEditingController();
    _condition = TextEditingController();
    _hdd = TextEditingController();
    _model = TextEditingController();
    _price = TextEditingController();
    _ram = TextEditingController();
    _ssd = TextEditingController();
    _condition.text = widget.laptopobj.condition;
    _company.text = widget.laptopobj.company;
    _hdd.text = widget.laptopobj.hDD;
    _model.text = widget.laptopobj.model;
    _price.text = widget.laptopobj.price;
    _ram.text = widget.laptopobj.rAM;
    _ssd.text = widget.laptopobj.ssd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Your Inventory',
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
          child: SingleChildScrollView(
            child: Form(
              key: mykey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _company,
                    decoration: InputDecoration(
                      label: const Text('Comapany'),
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
                    //initialValue: widget.laptopobj.condition,
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
                  ElevatedButton(
                    onPressed: () async {
                      if (mykey.currentState!.validate()) {
                        // print('Elevted button pressed..');
                        Laptop laptop = Laptop(
                            company: _company.text,
                            condition: _condition.text,
                            hDD: _hdd.text,
                            model: _model.text,
                            rAM: _ram.text,
                            ssd: _ssd.text,
                            price: _price.text);
                        try {
                          await DatabaseHelper()
                              .updateInventory(laptop, widget.objid);

                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Your Data was Updted!",
                          );
                        } catch (e) {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: e.toString(),
                          );
                        }

                        // print('After updation new value of ssd: $_ssd');

                        // bool updated = await DatabaseHelper()
                        //     .updateInventory(laptop);
                        // if (updated) {
                        //   // ignore: use_build_context_synchronously
                        //   CoolAlert.show(
                        //     context: context,
                        //     type: CoolAlertType.success,
                        //     text: "Your Data was Updated successfully!",
                        //   );
                        // } else {
                        //   CoolAlert.show(
                        //     context: context,
                        //     type: CoolAlertType.error,
                        //     text: "Your Data was not Updated!",
                        //   );
                        // }
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
