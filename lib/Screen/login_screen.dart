import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:laptop_commerce/Database/database_service.dart';
import 'package:laptop_commerce/Screen/show_data.dart';
import 'package:laptop_commerce/Screen/sign_up.dart';
import '../Custom_Widget/Custom_Button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;
  getList() async {
    // await DatabaseHelper().getData();
  }

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'email must be filled';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: password,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'passoword must be filled';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(

                  //Login Here..
                  onTap: () async {
                   await DatabaseHelper()
                        .authenticateWithEmailAndPassword(email, password);
                   // ignore: unrelated_type_equality_checks
                   if(bool==true){
                     // ignore: use_build_context_synchronously
                     Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowData()),
                        );
   
                   }
                   else{
                     // ignore: use_build_context_synchronously
                     CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text:  'Did not Log in',
                        );

                   }
                   
                   
                    // try {
                    //   final credential = await FirebaseAuth.instance
                    //       .signInWithEmailAndPassword(
                    //           email: email.text, password: password.text);

                    //   if (credential != null) {
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const ShowData()),
                    //     );
                    //   }
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'user-not-found') {
                    //     CoolAlert.show(
                    //       context: context,
                    //       type: CoolAlertType.error,
                    //       text: e.code.toUpperCase(),
                    //     );
                    //   } else if (e.code == 'wrong-password') {
                    //     CoolAlert.show(
                    //       context: context,
                    //       type: CoolAlertType.error,
                    //       text: e.code.toUpperCase(),
                    //     );
                    //   }
                   // }
                  },
                  child: const CustomButton(buttonText: 'Log in')),
             const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: const Text(
                  'Register Now',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
