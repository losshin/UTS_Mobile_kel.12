// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:utsmobile/Auth.dart';
import 'SignIn.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key});

  @override
  State<Registrasi> createState() => _RegisState();
}

class _RegisState extends State<Registrasi> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlFullName = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  Auth auth = Auth(); // Buat instance dari kelas Auth

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _ctrlFullName.text;
    final email = _ctrlEmail.text;
    final password = _ctrlPassword.text;

    setState(() => _loading = true);

    try {
      await auth.regis(fullName, email, password); // Panggil fungsi registrasi di Auth

      // Setelah pendaftaran berhasil, lanjutkan dengan halaman berikutnya
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
    } catch (e) {
      print('Error during registration: $e');
      // Handle error jika diperlukan
    }

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
                    "Register",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _ctrlFullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silakan Masukkan Nama Lengkap Anda';
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
                      hintText: 'Nama Lengkap',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
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
                      hintStyle: TextStyle(color: Colors.black),
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
                      hintStyle: TextStyle(color: Colors.black),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text("Sudah Punya Akun? Klik Disini Untuk Login"),
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
