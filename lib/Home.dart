import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utsmobile/Auth.dart';
import 'package:utsmobile/MyMovie.dart';
import 'package:utsmobile/MyTicket.dart';
import 'package:utsmobile/Profil.dart';
import 'EditProfil.dart';
import 'DetailTicket.dart';
import 'MyWallet.dart';
import 'SignIn.dart';


class Home extends StatefulWidget {
const Home({Key? key});

  @override
  State<Home> createState() => _Homestate();
  
  
}

class _Homestate extends State<Home> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        children: [
          MyMoviePage(),
          MyTicketPage(),
          ProfilPage(fullname: "Nama Pengguna"),
        ],
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color.fromARGB(255, 47, 46, 46),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: "Movie",
            backgroundColor: Color.fromRGBO(98, 53, 184, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: "My Ticket",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profile",
            backgroundColor: Colors.transparent,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}


