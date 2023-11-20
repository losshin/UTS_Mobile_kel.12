import 'package:flutix_kel_12/ui/pages/DetailTicket.dart';
import 'package:flutix_kel_12/ui/pages/Home.dart';
import 'package:flutter/material.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({super.key});

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
              width: 282,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://s3-alpha-sig.figma.com/img/a899/60d3/a388a38f2bf41901577b35b4bfb208d0?Expires=1701043200&Signature=Ie81uPnTDPW4BHrxTKhktFhTdlTs0~dty4ZHQmYV5Q8d6Hx7eLQB3zqjRkDjYu170RcxwWH00UzPcoPuWGlWFg8oxXYvw65Jl1IArX13dSpBAR2MzFbZxuy5VaFHGJaLfqyNoYQwn0-DmakHkwhZJi7Kb6pm2QUve8HAFkqcMPvptCO1~CW6Xc7RYUNcQ5YGpIAmTc6vV4JUtWCSuCWXn-jSdGYMFyAwSigjghCy6GQ2bFuOU1r5O5MtArSSKoSWchTjYmVVDw5ATdnmWSVToHi5voIbt5P1K6Rq3sp8HmfEsUWcKkkMBOgxXEeOY45D05a11IEszF97y8JfR5jVuQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: const Text(
                "Happy Watching",
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
              'You have successfully\nbought the ticket',
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
                  "My Ticket",
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
                      builder: (context) => DetailTicket(posterUrl: "https://s3-alpha-sig.figma.com/img/a899/60d3/a388a38f2bf41901577b35b4bfb208d0?Expires=1701043200&Signature=Ie81uPnTDPW4BHrxTKhktFhTdlTs0~dty4ZHQmYV5Q8d6Hx7eLQB3zqjRkDjYu170RcxwWH00UzPcoPuWGlWFg8oxXYvw65Jl1IArX13dSpBAR2MzFbZxuy5VaFHGJaLfqyNoYQwn0-DmakHkwhZJi7Kb6pm2QUve8HAFkqcMPvptCO1~CW6Xc7RYUNcQ5YGpIAmTc6vV4JUtWCSuCWXn-jSdGYMFyAwSigjghCy6GQ2bFuOU1r5O5MtArSSKoSWchTjYmVVDw5ATdnmWSVToHi5voIbt5P1K6Rq3sp8HmfEsUWcKkkMBOgxXEeOY45D05a11IEszF97y8JfR5jVuQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
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
                    Home;
                  },
                  child: const Text(
                    'Back to Home',
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