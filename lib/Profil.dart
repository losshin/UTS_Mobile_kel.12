import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'EditProfil.dart';

class ProfilPage extends StatefulWidget {
  final String? fullname;

  ProfilPage({Key? key, this.fullname}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final Auth _auth = Auth();
  String? fullname;
  String? email;

  Future<void> _getAndSetUserData(String? userId) async {
    if (userId != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userDoc.exists) {
          setState(() {
            fullname = userDoc.get('fullname');
          });
        }
      } catch (e) {
        print('Error saat mengambil data user: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Get the current user ID
    String? userId = Auth().getCurrentUser()?.uid;

    // Initialize fullname using the user ID
    _getAndSetUserData(userId);

    // Get and set email from FirebaseAuth
    User? currentUser = _auth.getCurrentUser();
    if (currentUser != null) {
      setState(() {
        email = currentUser.email;
      });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/potoprofildefaut.jpg'),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 15),
            Text(
              fullname ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            _buildProfileButton(context, "Edit Profil", Icons.edit),
            _buildProfileButton(context, "Logout", Icons.logout_outlined),
            _buildProfileButton(context, "Help Center", Icons.help),
            _buildProfileButton(context, "Rate Klutik App", Icons.star),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context, String label, IconData icon) {
    return InkWell(
      onTap: () {
        // Tambahkan logika ketika tombol ditekan
        if (label == "Edit Profil") {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditProfil(),
          ));
        } else if (label == "Logout") {
          // Panggil fungsi logout dari Auth
          _auth.signOut();
          // Pindah ke halaman login setelah logout
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
