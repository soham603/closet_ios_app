import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_asgn_persist/helpers/database_auth.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const RegisterScreen({super.key, required this.onClickedSignUp});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passconfirmcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LinearGradient myGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF6A1B9A),
        Color(0xFF7B1FA2),
        Color(0xFF8E24AA),
        Color(0xFF9C27B0),
        Color(0xFFAB47BC),
        Color(0xFFBA68C8),
      ],
    );
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 164, 165, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 150, width: 200, child: Image.asset('assets/logo.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Closet App",
                    style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Container(
              width: 350,
              height: 570,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //       color: Colors.deepPurple,
              //       width: 3
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      focusNode: _focusNode4,
                      controller: namecontroller,
                      decoration: InputDecoration(
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.green,
                        //       width: 3,
                        //     )
                        // ),
                        hintText: "Name",
                        label: const Text("Enter Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      focusNode: _focusNode1,
                      controller: mailcontroller,
                      decoration: InputDecoration(
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.green,
                        //       width: 3,
                        //     )
                        // ),
                        hintText: "abc@gmail.com",
                        label: const Text("Enter Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                      ),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      focusNode: _focusNode2,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.green,
                        //       width: 3,
                        //     )
                        // ),
                        hintText: "Password",
                        label: const Text("Enter Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.key),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      focusNode: _focusNode3,
                      controller: passconfirmcontroller,
                      decoration: InputDecoration(
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.green,
                        //       width: 3,
                        //     )
                        // ),
                        hintText: "Password",
                        label: const Text("Enter Password Again"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.key),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: myGradient,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        //color: Colors.redAccent,
                        color: Colors.transparent,
                        child: MaterialButton(
                          minWidth: 375,
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onPressed: () {
                            AuthenticationRemote().register(namecontroller.text, mailcontroller.text, passwordcontroller.text, passconfirmcontroller.text);
                          },
                          child: const Text(
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            "Register",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(text: "Already have an Account? ", style: const TextStyle(fontSize: 16), children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                        text: 'Log In',
                        style: TextStyle(color: Colors.deepPurple[300], fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ])),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
