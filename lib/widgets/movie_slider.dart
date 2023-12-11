import 'package:utsmobile/detail_film.dart';
import 'package:utsmobile/widgets/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key, required this.snapshot,
  });

final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, Index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => DetailFilmPage(
                          movie: snapshot.data[Index],
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.imagePath}${snapshot.data![Index].posterPath}'),
                    ),
                  ),
                ),
              );
            }
          )
        );
  }
}

