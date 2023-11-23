// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:another_flushbar/flushbar.dart';
import 'package:flutix_kel_12/ui/pages/SignIn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  // final RegistrationData registrationData;
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => __SignUpState();
}

class __SignUpState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   nameController.text = widget.registrationData.name;
  //   emailController.text = widget.registrationData.email;
  // }

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
        padding: EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 22),
                  height: 56,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context, '/signIn'
                            );
                            // context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Create Your\nAccount",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 104,
                  child: Stack(
                    children: <Widget>[
                       Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // image: DecorationImage(
                          //   image: (widget.registrationData.profileImage == null)
                          //       ? AssetImage("assets/user_pic.png")
                          //       : FileImage(widget.registrationData.profileImage),
                          //   fit: BoxFit.cover
                          // )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            // if (widget.registrationData.profileImage == null) {
                            //   widget.registrationData.profileImage =
                            //       await getImage();
                            // } else {
                            //   widget.registrationData.profileImage = null;
                            // }
                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png")),
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //     (widget.registrationData.profileImage ==null)? "assets/btn_add_photo.png" : "assets/btn_del_photo.png"
                              //   )
                              // )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Full Name",
                    hintText: "Full Name"
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Email Addrees",
                    hintText: "Email Address"
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Password",
                    hintText: "Password"
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: retypePasswordController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Confirm Password",
                    hintText: "Confirm Password"
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.lightGreen,
              elevation: 0,
              onPressed: () {
                if (!(nameController.text.trim() != "" &&
                    emailController.text.trim() != "" &&
                    passwordController.text.trim() != "" &&
                    retypePasswordController.text.trim() != "")) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5C83),
                    message: "Please fill all the fields",
                  )..show(context);
                } else if (passwordController.text != retypePasswordController.text) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5C83),
                    message: "Mismatch password and confirmed password",
                  )..show(context);
                } else if (passwordController.text.length < 6) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5C83),
                    message: "Password's length min 6 characters",
                  )..show(context);
                } 
                // else if (!EmailValidator.validate(emailController.text)) {
                //   Flushbar(
                //     duration: Duration(milliseconds: 1500),
                //     flushbarPosition: FlushbarPosition.TOP,
                //     backgroundColor: Color(0xFFFF5C83),
                //     message: "Wrong formatted email address",
                //   )..show(context);
                // } else {
                //   widget.registrationData.name = nameController.text;
                //   widget.registrationData.email = emailController.text;
                //   widget.registrationData.password = passwordController.text;
                //   context
                //     .bloc<PageBloc>()
                //     .add(GoToPreferencePage(widget.registrationData)
                //   );
                // }
              }
            )
          ],
        ),
      ),
    );
  }
}
