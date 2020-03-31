import 'package:flutter/material.dart';
import 'package:hangman/services/auth.dart';
import 'package:hangman/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   centerTitle: true,
            //   backgroundColor: Colors.transparent,
            //   title: Text(
            //     'Log in',
            //     style: TextStyle(
            //       fontFamily: 'Satisfy',
            //       color: Colors.white,
            //       fontSize: 32,
            //     ),
            //   ),
            //   actions: <Widget>[
            //     FlatButton.icon(
            //       icon: Icon(
            //         Icons.person,
            //         color: Colors.amber,
            //       ),
            //       label: Text(
            //         'Register',
            //         style: TextStyle(color: Colors.amber),
            //       ),
            //       onPressed: () {
            //         widget.toggleView();
            //       },
            //     )
            //   ],
            // ),
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/drawable-xxhdpi/backgroundimg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100.0,
                        ),
                        Text('READY TO DIE?',
                            style: TextStyle(
                              fontFamily: 'Old English Text MT',
                              fontSize: 30,
                              color: Color(0xffff0000),
                            )),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          decoration: InputDecoration(
                            hintText: 'deadman@gmail.com',
                            filled: true,
                            fillColor: Color(0xff243a4b).withOpacity(0.48),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: BorderSide()),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: InputDecoration(
                            hintText: 'password',
                            filled: true,
                            fillColor: Color(0xff243a4b).withOpacity(0.48),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: BorderSide()),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RaisedButton(
                          color: Color(0xff303c5f),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Old English Text MT'),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'COULD NOT SIGN IN WITH GIVEN CREDENTIALS';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 165.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'not on the death row yet?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Old English Text MT',
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {widget.toggleView();} ,
                              child: Text('register',
                                  style: TextStyle(
                                    fontFamily: "Old English Text MT",
                                    fontSize: 20,
                                    color: Color(0xfffc0000),
                                    decoration: TextDecoration.underline,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
