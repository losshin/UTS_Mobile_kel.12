import 'package:flutter/material.dart';

Widget buildSeatSelection() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 30.0,
      ),
      itemCount: 36,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('Seat $index selected');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x4CD9D9D9)
            ),
            child: Center(
              child: Text(
                'Seat\n$index',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }