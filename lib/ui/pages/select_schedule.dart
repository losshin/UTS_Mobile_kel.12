// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutix_kel_12/ui/pages/signUp_page.dart';
import 'package:flutter/material.dart';

class SelectSchedulePage extends StatelessWidget {
  SelectSchedulePage({super.key});
  
  final List<String> dates = ['13.00', '19.00', '20.00'];
  final List<String> genres = ['Horror', 'Music', 'Action', 'Drama', 'War', 'Crime'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment(-0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color(0xFF6234B7),
            Color(0xC01E1A20),
            Color(0x84150812),
            Color(0x6813000C)
          ],
          )
        ),
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 56,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Choose Date",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  childAspectRatio: (50 / 50),
                ),
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika yang sesuai ketika tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize:Size.fromHeight(40),
                      backgroundColor: Color(0x4CD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Container(
                      width: 264,
                      height: 115,
                      child: Center(
                        child: Text(
                          dates[index],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: 264,
              height: 60,
              child: Text(
                'Where to Watch?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  childAspectRatio: (115 / 44),
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika yang sesuai ketika tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x4CD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Container(
                      width: 115,
                      height: 44,
                      child: Center(
                        child: Text(
                          genres[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.32,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: <Widget>[
                  Text(
                    'Continue To Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed:() {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => SignUpPage()
                            )
                          );
                        },
                        style:ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )
                          )
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenreItem extends StatelessWidget {
  final String genre;

  GenreItem({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 44,
      decoration: ShapeDecoration(
        color: Color(0x4CD9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Center(
        child: Text(
          genre,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.09,
            letterSpacing: -0.32,
          ),
        ),
      ),
    );
  }
}