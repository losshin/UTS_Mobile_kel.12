import 'package:flutter/material.dart';
import 'SuccesTopUp.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  String selectedAmount =
      ""; // Variable untuk menyimpan nilai tombol yang dipilih
  TextEditingController _amountController = TextEditingController();

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
                        "Top Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Kotak input
                  _buildInputBox(),
                  SizedBox(height: 16),
                  // Enam tombol di bawah
                  _buildSixButtons(),
                ],
              ),
              // Tombol "Top Up Now"
              _buildTopUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Amount",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          width: 317, // Ganti sesuai kebutuhan lebar kotak input
          height: 45, // Ganti sesuai kebutuhan tinggi kotak input
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                // Konfigurasi input field
                controller: _amountController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    selectedAmount = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSixButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, bottom: 50.0),
          child: Text(
            "Choose by template",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAmountButton("50.000"),
            _buildAmountButton("100.000"),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAmountButton("150.000"),
            _buildAmountButton("200.000"),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAmountButton("500.000"),
            _buildAmountButton("1.000.000"),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountButton(String amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedAmount = amount; // Set nilai yang dipilih ke dalam state
          _amountController.text = amount;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(217, 217, 217, 0.3),
        onPrimary: Colors.white,
        minimumSize: Size(130, 90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "IDR\n$amount",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTopUpButton() {
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: ElevatedButton(
        onPressed: () {
          // Implementasi logika ketika tombol "Top Up Now" ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuccesTopUp()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(98, 53, 184, 1),
          onPrimary: Colors.white,
          minimumSize: Size(200, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Top Up Now"),
      ),
    );
  }
}
