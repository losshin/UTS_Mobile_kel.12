import 'package:flutter/material.dart';
import 'TopUp.dart';
import 'SuccesTopUp.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Text(
                      "My Wallet",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 320,
                  height: 180,
                  color: Color.fromRGBO(64, 64, 64, 1),
                  child: Center(
                    child: Text(
                      "Nominal E-Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ), // Spasi antara kotak dan teks "Recent Transaction"
                Padding(
                  padding: const EdgeInsets.only(left: 36.0), // Sesuaikan nilai left sesuai kebutuhan
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recent Transaction",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ), // Spasi antara teks "Recent Transaction" dan kotak transparan
                _buildTransactionHistory(), // Menambahkan kotak transparan untuk riwayat transaksi
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                onPressed: () {
                  // Mengarahkan ke halaman TopUp
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopUp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(98, 53, 184, 1),
                  onPrimary: Colors.white,
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Sesuaikan dengan kebutuhan
                  ),
                ),
                child: Text("Top Up Wallet"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
  return Container(
    width: 320,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.transparent, // Warna transparan
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        // Gambar transaksi (gantilah dengan widget gambar sesuai kebutuhan)
        Icon(Icons.image, color: Colors.white),
        SizedBox(width: 50),
        // Deskripsi transaksi
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Up", // Gantilah dengan deskripsi transaksi sesuai kebutuhan
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Saturday", // Gantilah dengan deskripsi transaksi sesuai kebutuhan
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "IDR 500.000", // Gantilah dengan deskripsi transaksi sesuai kebutuhan
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}
