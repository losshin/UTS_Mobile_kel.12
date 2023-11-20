// ignore_for_file: prefer_const_constructors

import 'package:flutix_kel_12/ui/pages/checkout_page.dart';
import 'package:flutter/material.dart';

import '../widgets/selection.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,      
      body: Container(
        padding: EdgeInsets.all(50),
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
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      // context.bloc<PageBloc>().add(GoToSplashPage());
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Select Seat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 270,
              height: 10,
              decoration: BoxDecoration(color: Color(0x4CD9D9D9)),
            ),
            Text(
              'Layar Bioskop',
              style: TextStyle(
                color: Color(0xFFDADADA),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 20),
            buildSeatSelection(),
            SizedBox(height: 20),
            Row(children: <Widget>[
                Text(
                  'Confirm Your Page',
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
                  margin: EdgeInsets.only(left: 100, top: 0),
                  child: ElevatedButton(
                    onPressed:() {
                      CheckoutPage;
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
          ],
        ),
      ),
    );
  }
}