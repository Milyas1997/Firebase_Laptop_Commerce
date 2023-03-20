import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom_Widget/Custom_Button.dart';
import 'login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController email;
  late TextEditingController password;
  // getList() async {
  //   // await DatabaseHelper().getData();
  // }

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
          'Sign Up',
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
                // validator: (val) {
                //   if (val == null || val.isEmpty) {
                //     return 'email must be filled';
                //   }
                // },
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'passoword must be filled';
                //   }
                // },
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

                  //sign up Here..
                  onTap: () async {
                    var emaill = email.text.trim();
                    var pass = password.text.trim();
                    if (emaill.isEmpty || pass.isEmpty) {
                    
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'Please fill your filled',
                      );
                    }

                    try {
                       await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emaill,
                        password: pass,
                      );
                     
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: e.code.toUpperCase(),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: e.code.toUpperCase(),
                        );
                      } else if (e.code == 'invalid-email') {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: e.code.toUpperCase(),
                        );
                      }
                    } catch (e) {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: e.toString(),
                      );
                    }
                  },
                  child: const CustomButton(buttonText: 'Sign up')),
             const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child:const Text(
                  'Log in',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
