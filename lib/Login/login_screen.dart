
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:srijan_sustam_design/home_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);



  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: KeyboardDismisser(
          child: Container(
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset('assets/images/sustham_admin_logo.svg'),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero)),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            label: Text("Email ID"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 48,
                          child: ElevatedButton(

                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                  Colors.cyan,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12.0)))),
                            onPressed: (
                                ) {
                              Navigator.push(context , MaterialPageRoute(builder: (context) =>const HomeScreen()));
                            },
                            child: const Text(
                              "CONTINUE  →",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
