import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'Registrasi.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 134,
              height: 75,
              margin: const EdgeInsets.only(top: 140),
              // decoration: const BoxDecoration(
              // image: DecorationImage(image: AssetImage("assets/logo.png"))),
              child: Stack(
                alignment:Alignment.center,
                children: [
                  Container(
                    width: 134,
                    height: 75,
                    decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.3),
                    child: Container(
                      width: 79.63,
                      height: 56.88,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFFEFDFF),
                        shape: StarBorder.polygon(sides: 3, pointRounding: 0.10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 127, bottom: 20),
              child: const Text(
                "New Experience",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const Text(
              "Watch a new movie much\neasier than any before",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Container(
              width: 135,
              height: 40,
              margin: const EdgeInsets.only(top: 94, bottom: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB95BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registrasi(),                      
                      )
                    );
                  }
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const SignInPage()
                      )
                    );
                  },
                  child: const Text(
                    'Sign In To My Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
