import 'package:flutter/material.dart';
import 'package:utsmobile/DetailTicket.dart';

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

