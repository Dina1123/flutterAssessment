import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:task2/home.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loading.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController =
      new TextEditingController(); // EMAIL
  final TextEditingController passwordController = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  String errorMessage = '';
  bool loading = false;

  // String email = '';
  // String pass = '';
  // String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('Let\'s Fight against COVID-19'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Image(
                        image: NetworkImage(
                          'https://i.pinimg.com/736x/64/f6/00/64f6003ae06222cbc922dc46d461226b.jpg',
                        ),
                        width: 300,
                        height: 250,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Enter Your E-mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }

                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                          },
                          onSaved: (value) {
                            emailController.text =
                                value!; // GETTING the value of edit text
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Color.fromARGB(255, 24, 235, 5),
                                Color.fromARGB(255, 182, 245, 12)
                              ])),
                          child: FlatButton(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              signIn(emailController.text,
                                  passwordController.text);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Dont have an account?!',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 15, 138, 9),
                                        fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignUp(),
                                            ));
                                      })
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });

        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  // Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context)
                      .pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()))
                      .catchError((e) {
                    // Fluttertoast.showToast(msg: e!.message);
                  }),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = ("Your email address appears to be malformed.");

            break;
          case "wrong-password":
            errorMessage = ("Your password is wrong.");

            break;
          case "user-not-found":
            errorMessage = ("User with this email doesn't exist.");

            break;
          case "user-disabled":
            errorMessage = ("User with this email has been disabled.");

            break;
          case "too-many-requests":
            errorMessage = ("Too many requests");

            break;
          case "operation-not-allowed":
            errorMessage =
                ("Signing in with Email and Password is not enabled.");

            break;

          default:
            errorMessage = ("An undefined Error happened.");
        }
        // Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
        setState(() {
          loading = false;
          errorMessage;
        });
      }
    }
  }
}
