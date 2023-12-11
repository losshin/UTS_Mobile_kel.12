import 'package:utsmobile/models/movie.dart';
import 'package:utsmobile/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utsmobile/models/movie.dart';

class DetailFilmPage extends StatelessWidget {
  const DetailFilmPage({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movie.overview,
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            Text(
                              'Release date : ',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movie.releaseDate,
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            Text('Rating: ',
                            style: GoogleFonts.roboto(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '${movie.voteAverage.toStringAsFixed(1)}/10',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )
                              ),
                          ]),
                        ),
                      ]),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
