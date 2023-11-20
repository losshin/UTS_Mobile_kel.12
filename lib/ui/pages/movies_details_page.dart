// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 49, left: 39, right: 39),
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
        )),
        child: Center(
          child: Column(children: [
            Container(
              width: 282,
              height: 152,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://s3-alpha-sig.figma.com/img/a899/60d3/a388a38f2bf41901577b35b4bfb208d0?Expires=1701043200&Signature=Ie81uPnTDPW4BHrxTKhktFhTdlTs0~dty4ZHQmYV5Q8d6Hx7eLQB3zqjRkDjYu170RcxwWH00UzPcoPuWGlWFg8oxXYvw65Jl1IArX13dSpBAR2MzFbZxuy5VaFHGJaLfqyNoYQwn0-DmakHkwhZJi7Kb6pm2QUve8HAFkqcMPvptCO1~CW6Xc7RYUNcQ5YGpIAmTc6vV4JUtWCSuCWXn-jSdGYMFyAwSigjghCy6GQ2bFuOU1r5O5MtArSSKoSWchTjYmVVDw5ATdnmWSVToHi5voIbt5P1K6Rq3sp8HmfEsUWcKkkMBOgxXEeOY45D05a11IEszF97y8JfR5jVuQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              child: Column(children: <Widget>[
                Text(
                  'Doctor Strange\nMultiverse of Madness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 15,
                  child: Text(
                    'Animation - Adventure - Action',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFDADADA),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 19.05,
                  decoration: ShapeDecoration(
                    color: Color(0xFF989898),
                    shape: StarBorder(
                      points: 5,
                      innerRadiusRatio: 0.50,
                      pointRounding: 0,
                      valleyRounding: 0,
                      rotation: 0,
                      squash: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 15,
                  child: Text(
                    '8/10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFDADADA),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Storyline',
                    style: TextStyle(
                      color: Color(0xFFDADADA),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Text(
                    'Mengisahkan Stephen Strange yang kedatangan tamu dari semesta lain, yaitu America Charez. Kehadiran Charez ke semesta Strange yang berada di universe utama MCU adalah untuk meminta bantuan sang superhero',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Cast',
                    style: TextStyle(
                      color: Color(0xFFDADADA),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 112, // Set tinggi container agar sesuai dengan tinggi gambar
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        width: 73,
                        margin: EdgeInsets.only(right: 8), // Jarak antar gambar
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              _castImages[index],
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

List<String> _castImages = [
  "https://s3-alpha-sig.figma.com/img/8010/ffba/5542168df00f1767d34acfdaa1f7c53f?Expires=1701043200&Signature=VXGiB9Fu1tvg4Q0WPKgs5ULFDvxd-R06iAwB1uHejXBCj1gWLCg7XiVexPwpRP9pzVTbpVNCg3rARtLTqeMCYkVJu-dyeOF-WhYqktsuHNdFRHyD8P9913YkP0bdkmlfk~6k~i~hd20nQ3UoHoZzwp1b4t2dzBZslqIDKPgkk~fYkSfrclehFIq2YKnAg4VluDnoDSPP8xCwXxuaNGHbvfW9Lkdv969nM8LC0lkHvcUXIxLvjG6-Jp-UoANlEMqQv~VgEokCjXDZdEaoP-QZVwfiZ0K148eoSnGaXGWzZcswnJ~qFTwz2Kc20vV04mhqy5Hk0r5tOUEbbF4blHt~JA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
  "https://s3-alpha-sig.figma.com/img/37c4/2fe2/53598f82c0ee44e5f5c4acf9515fc736?Expires=1701043200&Signature=WdS08gdmUS-Hp5KUKNi6WkAFR3yRJ9f-IK9J~n6PNmXPy8EApCimoWAQFBDfDtlAqmwnqSHVuCrNC-ch8TANgoQRO4js5BmrV~h-MGrRmq9n2HxeWLNOmBziqHbaDVz9O7RrBuuA8xUhTwJn-yNwDZYCvHF8xNjWMfd6GP6p94pLylWmlqd38u~hMP~AcUFMo9eCwrcXEhXfTTnwquWENycFtohyXgBAehS1FgbHQt6xpwt9eHNlN~uZap9a6LFL-XmhXHJIkCEmmi6ceJW4EziaWUYUMzFXR3zoiwze0JmCwZWqOSTyhsvRVqnv3-zqm5kaxFG6V9Bmp18qT7M55g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
  "https://s3-alpha-sig.figma.com/img/d862/8a45/183285c903e1257221096dd4cb03c707?Expires=1701043200&Signature=S2ixrhYJqJ3uHpv5KaQt44Q4NnHkpOSL6DZFF~SBdGR8EwKcCvGLwBSSuH3vR0J6vvaiGl1AqlPR~bBDG3xSVJt6ABUQCTVQZaRc72dO56CZOjzCvicYW8ILacvUg4JLXGWpGTcuJ2H-v5AqRdBijrPw36VJ6AnQ8hmKSyKGcf5OyBhqU73sSuURGkyBLB78JVKbTARqJ4MoJMruKRkmhO79UZFFS8YtqIi2tAW4mpi19rJNKeK~nQdmJlgCYoJqh~~gkD5ECQ~3DRADmyBiX8mWrgfYu3FnIfSXUXcFLC3TdIr6CD6WNtfDwdU42R7Tboo-kxCkTzfRYk9Y2pkbeg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
  "https://s3-alpha-sig.figma.com/img/d833/aa4a/38480df98d439ea6524f736efb3f847d?Expires=1701043200&Signature=BAWXYisjEWRC~X6f8glMIYK~NYS-4VzXN3pWSP0DqeF-hMm6V4Wss0OBZr9m1cbtibKcsgfVqCB7jTpTdONLCzUDcihFtXvVXiiY8TRdzEE0ib~fXhrWSOjZRlRYDV7DaWIKSFgVU1xpe1-7OO86ETOtV08S-iZHfRGAF3n8HZ7YbFRdYN8lHZCtIBwTPGSVFoaM5kBGzzHm3-3XRp~YO6wUlViu0VKZZtyV8W42WLkL6I1Uv539sm7q5H-MQRs7x-boyc5fWJvfkNDxWwiVbBcfB8w~HvKwF6zEzasjO6FkWJvukmepnJtkvL2n0tXXDMwyDaDZWfuoerAIPRmrqw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
];