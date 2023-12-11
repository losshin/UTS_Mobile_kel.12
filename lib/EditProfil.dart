import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'Auth.dart'; // Import file Auth.dart yang berisi kelas Auth
import 'dart:io';

//import 'package:firebase_app_check/firebase_app_check.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final Auth _auth = Auth(); // Buat instance dari kelas Auth
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _profileImageUrl; // URL gambar profil

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Panggil fungsi untuk memuat data pengguna
  }

  // Fungsi untuk memuat data pengguna ke dalam controller
Future<void> _loadUserData() async {
  try {
    String? fullname = await _auth.getFullnameAfterLogin();
    String? email = _auth.getCurrentUser()?.email;

    if (fullname != null && email != null) {
      setState(() {
        _fullnameController.text = fullname;
        _emailController.text = email;
      });

      // Dapatkan dokumen user dari Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.getCurrentUser()?.uid)
          .get();

      // Periksa apakah dokumen userDoc ada dan field 'profileImageUrl' ada di dalamnya
      if (userDoc.exists && userDoc.data() != null) {
        Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

        if (userData != null && userData.containsKey('profileImageUrl')) {
          String? profileImageUrl = userData['profileImageUrl'];
          setState(() {
            _profileImageUrl = profileImageUrl;
          });
        }
      }
    }
  } catch (e) {
    print('Error during loading user data: $e');
  }
}

  // Fungsi untuk mengambil foto dari galeri
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Proses gambar di sini
      print('Foto dari galeri: ${pickedFile.path}');

      // Upload gambar ke Firebase Storage dan dapatkan URL
      String imageUrl = await _uploadImage(pickedFile.path);
      setState(() {
        _profileImageUrl = imageUrl;
      });
    }
  }

  // Fungsi untuk mengambil foto dari kamera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Proses gambar di sini
      print('Foto dari kamera: ${pickedFile.path}');

      // Upload gambar ke Firebase Storage dan dapatkan URL
      String imageUrl = await _uploadImage(pickedFile.path);
      setState(() {
        _profileImageUrl = imageUrl;
      });
    }
  }

  // Fungsi untuk menghapus foto
  Future<void> _deleteImage() async {
    // Tambahkan logika penghapusan gambar di sini
    print('Foto dihapus');

    // Set URL gambar profil kembali ke null atau URL default jika ada
    setState(() {
      _profileImageUrl = null; // Atau ganti dengan URL default
    });
  }

  // Fungsi untuk menampilkan dialog pilihan
  Future<void> _showOptionsDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Aksi"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _pickImageFromGallery();
              },
              child: Text("Ambil Foto dari Galeri"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _pickImageFromCamera();
              },
              child: Text("Ambil Foto dari Kamera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteImage();
              },
              child: Text("Hapus Foto"),
            ),
          ],
        );
      },
    );
  }

 // Fungsi untuk upload gambar ke Firebase Storage dan mendapatkan URL
Future<String> _uploadImage(String filePath) async {
  try {
    final firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('${_auth.getCurrentUser()?.uid}_${DateTime.now().millisecondsSinceEpoch}.png');

    final firebase_storage.UploadTask uploadTask = storageRef.putFile(
      // Tambahkan file path gambar yang diambil dari galeri atau kamera
      File(filePath),
    );

    await uploadTask.whenComplete(() => print('Upload selesai'));

    final String imageUrl = await storageRef.getDownloadURL();

    // Perbarui state untuk memicu pembangunan ulang widget
    setState(() {
      _profileImageUrl = imageUrl;
    });

    return imageUrl;
  } catch (e) {
    print('Error during image upload: $e');
    return ''; // Atau berikan nilai default jika terjadi kesalahan
  }
}

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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          // Gunakan URL gambar profil jika ada, atau gunakan gambar default jika null
                          backgroundImage: _profileImageUrl != null
                              ? NetworkImage(_profileImageUrl!)
                              : AssetImage('assets/potoprofildefaut.jpg') as ImageProvider,
                          backgroundColor: Colors.white,
                        ),
                        Positioned(
                          //bottom: 35,
                          top: 77,
                          left: 32,
                          child: IconButton(
                            onPressed: _showOptionsDialog,
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: Color.fromARGB(255, 0, 164, 8),
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildInputField("Full Name", _fullnameController),
                  _buildInputField("Email Address", _emailController),
                  _buildInputField("Password", _passwordController, isPassword: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateProfile,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(98, 53, 184, 1),
                      onPrimary: Colors.white,
                    ),
                    child: Text("Update Now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun field input
  Widget _buildInputField(String label, TextEditingController controller, {bool isPassword = false}) {
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
            controller: controller,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                fontSize: 15,
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
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menangani penekanan tombol "Update Now"
  Future<void> _updateProfile() async {
    try {
      String fullname = _fullnameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Tambahkan logika untuk update profil ke dalam Auth.dart
      // Gunakan fungsi updateProfile atau fungsi serupa yang telah Anda definisikan di Auth.dart
      await _auth.updateProfile(fullname, email, password, profileImageUrl: _profileImageUrl);

      // Tampilkan pesan sukses atau pindah ke halaman lain setelah update
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Profile updated successfully"),
      ));

      // Pindah ke halaman lain jika diperlukan
      // Contoh: Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Error during profile update: $e');
      // Tampilkan pesan error jika diperlukan
    }
  }
}
