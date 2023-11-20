// ignore_for_file: prefer_const_constructors
import 'package:flutix_kel_12/ui/pages/success_checkout.dart';
import 'package:flutix_kel_12/ui/widgets/orderDetails.dart';
import 'package:flutter/material.dart';

final orderDetails = [
  {'label': 'ID Order', 'value': '2208199612389'},
  {'label': 'Cinema', 'value': 'Paris Van Java Mall'},
  {'label': 'Date & Time', 'value': 'Sat 21, 12:00'},
  {'label': '2 Tickets', 'value': 'C1, C2'},
  {'label': 'Seat', 'value': 'Rp 50,000x2'},
  {'label': 'Fees', 'value': 'Rp 20.000x2'},
  {'label': 'Total', 'value': 'Rp 140.000'},
  {'label': 'Saldo Wallet', 'value': 'Rp 56.500.000'},
];

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

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
          children: <Widget>[
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
                Expanded(child:
                  Text(
                    'Cheks details below\n before checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 92,
                    height: 123,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/a899/60d3/a388a38f2bf41901577b35b4bfb208d0?Expires=1701043200&Signature=Ie81uPnTDPW4BHrxTKhktFhTdlTs0~dty4ZHQmYV5Q8d6Hx7eLQB3zqjRkDjYu170RcxwWH00UzPcoPuWGlWFg8oxXYvw65Jl1IArX13dSpBAR2MzFbZxuy5VaFHGJaLfqyNoYQwn0-DmakHkwhZJi7Kb6pm2QUve8HAFkqcMPvptCO1~CW6Xc7RYUNcQ5YGpIAmTc6vV4JUtWCSuCWXn-jSdGYMFyAwSigjghCy6GQ2bFuOU1r5O5MtArSSKoSWchTjYmVVDw5ATdnmWSVToHi5voIbt5P1K6Rq3sp8HmfEsUWcKkkMBOgxXEeOY45D05a11IEszF97y8JfR5jVuQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 149,
                        height: 23,
                        child: Text(
                          'Doctor Strange',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 149,
                        height: 23,
                        child: Text(
                          'Action - Animation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 17.09,
                            height: 16.28,
                            decoration: ShapeDecoration(
                              color: Color(0xFF565656),
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
                          Container(
                            width: 17.09,
                            height: 16.28,
                            decoration: ShapeDecoration(
                              color: Color(0xFF565656),
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
                          Container(
                            width: 17.09,
                            height: 16.28,
                            decoration: ShapeDecoration(
                              color: Color(0xFF565656),
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
                          Container(
                            width: 17.09,
                            height: 16.28,
                            decoration: ShapeDecoration(
                              color: Color(0xFF565656),
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
                          Container(
                            width: 17.09,
                            height: 16.28,
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
                        ],
                      ),
                      SizedBox(
                        width: 21,
                        height: 13,
                        child: Text(
                          '8/10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      )
                    ]
                  ),
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 260,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFA1A0A0),
                        ),
                      ),
                    ),
                  ),
                  orderDetailRow('ID Order', '2208199612389'),
                  orderDetailRow('Cinema', 'Paris Van Java Mall'),
                  orderDetailRow('Date & Time', 'Sat 21, 12:00'),
                  orderDetailRow('2 Tickets', 'C1, C2'),
                  orderDetailRow('Seat', 'Rp 50,000x2'),
                  orderDetailRow('Fees', 'Rp 20.000x2'),
                  orderDetailRow('Total', 'Rp 140.000'),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 260,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFA1A0A0),
                        ),
                      ),
                    ),
                  ),
                  orderDetailRow('Saldo Wallet', 'Rp 56.500.000'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Row(children: <Widget>[
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
                      margin: EdgeInsets.only(left: 100),
                      child: ElevatedButton(
                        onPressed:() {
                          SuccessCheckout();
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
              ),
            )
          ],
        ),
      ),
      
    );
  }
}