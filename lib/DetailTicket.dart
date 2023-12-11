import 'package:flutter/material.dart';

class DetailTicket extends StatelessWidget {
  final String posterUrl; // Tambahkan variabel posterUrl

  DetailTicket({required this.posterUrl, Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
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
                    "Detail Ticket",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Menambahkan Hero widget
              Hero(
                tag: 'moviePoster', // Sama dengan tag yang digunakan di MyTicketPage
                child: Image.network(
                  posterUrl,
                  width: 300, // Lebar gambar poster yang lebih besar
                  height: 300, // Tinggi gambar poster yang lebih besar
                ),
              ),
              // Tambahkan detail tiket lainnya di sini
            ],
          ),
        ),
      ),
    );
  }
}
