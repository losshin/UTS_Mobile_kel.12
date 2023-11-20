import 'package:flutix_kel_12/ui/pages/user_profile.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(98, 53, 184, 1), Colors.black],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur rata kiri secara global
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Welcome back, explorer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              _buildInputField("Email Address"),
              _buildInputField("Password"),
              _buildSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Mengatur rata kiri hanya untuk elemen ini
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: const Color.fromARGB(255, 5, 5, 5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Color.fromRGBO(255, 255, 255, 1),
              contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            ),
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        UserProfilePage();
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(75, 0, 130, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1),
        minimumSize: Size(150, 40),
      ),
      child: Text("Sign In"),
    );
  }
}
