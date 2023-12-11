import 'package:flutter/material.dart';
import 'package:utsmobile/MyWallet.dart';

class SuccesTopUp extends StatelessWidget {
  const SuccesTopUp({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 20),
              // Foto profil di tengah
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'https://img2.pngdownload.id/20171202/b4a/success-png-image-5a229eaff3dc00.4133076515122182879989.jpg'),
              ),
              SizedBox(height: 20),
              // Tulisan dan tombol
              Column(
                children: [
                  Text(
                    "Wallet is Ready!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You have successfully fed your wallet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyWallet()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(98, 53, 184, 1),
                      onPrimary: Colors.white,
                    ),
                    child: Text("My Wallet"),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/Home');
                    },
                    child: Text(
                      "Back to Home",
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
