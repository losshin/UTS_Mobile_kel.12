// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields

import 'package:utsmobile/Auth.dart';
import 'Registrasi.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _LoginState();
}

class _LoginState extends State<SignInPage> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    setState(() => _loading = true);
    await Auth().login(email, password);
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(98, 53, 184, 1), Colors.black],
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _ctrlEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silakan Masukkan Email Anda';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black), // Ubah warna teks input
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black), // Ubah warna hint text
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _ctrlPassword,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silakan Masukkan Password Anda';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black), // Ubah warna teks input
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black), // Ubah warna hint text
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => handleSubmit(),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(98, 53, 184, 1),
                    ),
                    child: _loading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Registrasi()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text("Belum Punya Akun? Klik Disini Untuk Register"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
