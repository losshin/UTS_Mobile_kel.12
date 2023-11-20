// ignore_for_file: prefer_const_constructors

import 'package:flutix_kel_12/ui/pages/Home.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

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
              margin: EdgeInsets.only(top: 20, bottom: 22),
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
                      "Confirm\nNew Account",
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
            Container(
              margin: EdgeInsets.only(top: 101),
              width: 109,
              height: 110,
              decoration: ShapeDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(""),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(54.50),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Welcome,\nRookie",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 141),
              child: Row(
                children: <Widget>[
                  Text(
                    'Yes, I am in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: ElevatedButton(
                      onPressed:() {
                        Home();
                      },
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )
                        )
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
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