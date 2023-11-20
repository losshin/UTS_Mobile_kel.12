import 'package:flutter/material.dart';

class EditProfil extends StatelessWidget {
  const EditProfil({super.key});

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
        child: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Navigasi ke halaman sebelumnya ketika tombol kembali ditekan
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    "Edit Profil",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage("https://blog-static.mamikos.com/wp-content/uploads/2023/02/10-PP-Sad-Girl-Aesthetic-untuk-Photo-Profil-WA-yang-Menarik-2023_10.jpg"),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    _buildInputField("Full Name", "Your Full Name"),
                    _buildInputField("Email Address", "Your Email Address"),
                    _buildInputField("Password", "Your Password", isPassword: true),
                    _buildInputField("Confirm Password", "Confirm Your Password", isPassword: true),
                    SizedBox(height: 20), // Tambahkan jarak antara input dan tombol
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk menangani penekanan tombol "Update Now" di sini
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(98, 53, 184, 1), // Atur warna latar belakang tombol
                        onPrimary: Colors.white, // Atur warna teks tombol
                      ),
                      child: Text("Update Now"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildInputField(String label, String hint, {bool isPassword = false}) {
  return Padding(
 padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
              fontSize: 15, // Atur ukuran font teks dalam kotak input
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10),
            ),

            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10), // Atur panjang dan lebar kotak input
          ),
        ),
      ],
    ),
  );
}
}