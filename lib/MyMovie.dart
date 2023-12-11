import 'package:utsmobile/Profil.dart';
import 'package:utsmobile/api/api.dart';
import 'package:utsmobile/models/movie.dart';
import 'package:utsmobile/widgets/movie_slider.dart';
import 'package:utsmobile/widgets/trending_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MyWallet.dart';
import 'Auth.dart';

class MyMoviePage extends StatefulWidget {
  final String? fullname;

  MyMoviePage({Key? key, this.fullname}) : super(key: key);

  @override
  _MyMoviePageState createState() => _MyMoviePageState();
}

class _MyMoviePageState extends State<MyMoviePage> {
  String? fullname;

  Future<void> _getAndSetFullname(String? userId) async {
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
        print('Error saat mengambil nama: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Get the current user ID
    String? userId = Auth().getCurrentUser()?.uid;

    // Initialize fullname using the user ID
    _getAndSetFullname(userId);
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
                        backgroundImage: AssetImage('assets/potoprofildefaut.jpg'),
                      ),
                    
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullname ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implementasi navigasi ke halaman MyWallet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWallet()),
                            );
                          },
                          child: Text(
                            "Nominal E-Wallet",
                            style: TextStyle(
                              color:
                                  Colors.white, // Warna teks yang dapat ditekan
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
              top: 150,
              child: HomePage(), // Menampilkan konten dari API
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Movies',
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TrendingSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Top Rated Movies',
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Upcoming Movies',
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: upComingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
