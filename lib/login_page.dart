import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskone/register_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;

  bool _obsecure = true;
  bool get obsecure => _obsecure;
  set obsecure(bool obsecure) {
    _obsecure = obsecure;
    setState(() {});
  }

  void login(String email, String password) async {
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(
    //         email: emailController.text, password: passController.text)
    //     .then((value) => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => const HomePage()),
    //         (route) => false));

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: "Enter Your Email",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue))),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) =>
                              v!.isEmpty ? "Email is required" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passController,
                          obscureText: obsecure,
                          decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              suffixIcon: Icon(obsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue))),
                          validator: (v) => v!.isEmpty
                              ? "Password is required"
                              : v.length < 8
                                  ? "Password should be atleast 8 character"
                                  : null,
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () {
                            login(emailController.text, passController.text);
                          },
                          minWidth: 80,
                          color: Colors.blue,
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RegisterPage())));
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
