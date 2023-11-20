import 'package:flutter/material.dart';
import 'EditProfil.dart';
import 'DetailTicket.dart';
import 'MyWallet.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _Homestate();
}

class _Homestate extends State<Home> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        children: [
          MyMoviePage(), // Halaman pertama
          MyTicketPage(), // Halaman kedua
          ProfilPage(), // Halaman ketiga
        ],
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color.fromARGB(255, 47, 46, 46),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: "Movie",
            backgroundColor: Color.fromRGBO(98, 53, 184, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: "My Ticket",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profile",
            backgroundColor: Colors.transparent,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}


//HALAMAN MOVIE
class MyMoviePage extends StatelessWidget {
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
            Positioned(
              top: 50.0,
              left: 16.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://blog-static.mamikos.com/wp-content/uploads/2023/02/10-PP-Sad-Girl-Aesthetic-untuk-Photo-Profil-WA-yang-Menarik-2023_10.jpg"),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Pengguna",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implementasi navigasi ke halaman MyWallet
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyWallet()),
                            );
                          },
                          child: Text(
                            "Nominal E-Wallet",
                            style: TextStyle(
                              color: Colors.white, // Warna teks yang dapat ditekan
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 200,
              child: Center(
                child: Text(
                  "HALAMAN MOVIE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//HALAMAN MYTICKET
class MyTicketPage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Ticket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(context, "New", buttonWidth: 150.0),
                _buildButton(context, "Used", buttonWidth: 150.0),
              ],
            ),
            SizedBox(height: 20),
            _buildMovieInfo(
              context,
              "Doctor Strange",
              "2:00 PM - Today",
              "Theater A",
              "https://upload.wikimedia.org/wikipedia/id/0/08/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpeg", // URL gambar poster
            ),
            SizedBox(height: 20),
            _buildMovieInfo(
              context,
              "Movie Title 2",
              "4:30 PM - Tomorrow",
              "Theater B",
              "https://upload.wikimedia.org/wikipedia/id/0/08/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpeg", // URL gambar poster
            ),
            // Tambahkan info film lainnya di sini sesuai kebutuhan
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, {double buttonWidth = 120.0}) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika sesuai kebutuhan
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(75, 0, 130, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: Size(buttonWidth, 40),
      ),
      child: Text(label),
    );
  }

  Widget _buildMovieInfo(BuildContext context, String title, String time, String location, String posterUrl) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailTicket(posterUrl: posterUrl),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Warna latar belakang kontainer
          borderRadius: BorderRadius.circular(8), // Atur sudut kontainer sesuai kebutuhan
        ),
        child: Row(
          children: [
            Image.network(
              posterUrl,
              width: 165,
              height: 150,
            ),
            SizedBox(width: 10), // Jarak antara poster dan deskripsi
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 249, 249, 249), // Warna teks deskripsi
                    fontSize: 21,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







//HALAMAN PROFIL

class ProfilPage extends StatelessWidget {
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
              backgroundImage: NetworkImage("https://blog-static.mamikos.com/wp-content/uploads/2023/02/10-PP-Sad-Girl-Aesthetic-untuk-Photo-Profil-WA-yang-Menarik-2023_10.jpg"),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 15),
            Text(
              "Nama Pengguna",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Nama Akun",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            _buildProfileButton(context, "Edit Profil", Icons.edit),
            _buildProfileButton(context, "Setting", Icons.settings),
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
          builder: (context) => EditProfil(), // Ganti EditProfil() dengan nama halaman yang sesuai
        ));
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 50), // Mengatur jarak dari tepi kiri
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


