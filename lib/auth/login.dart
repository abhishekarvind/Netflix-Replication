import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix/auth/SignUp.dart';
import 'package:netflix/screens/home.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 100,),
              Center(child: Image.asset('assets/logo.png',width:250,)),
              SizedBox(height: 60,),
              Column(
                children: [
                  Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              fillColor: HexColor('#3F3F3F'),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              hintText: 'Email or Contact number',
                              hintStyle: TextStyle(
                                color: HexColor('#C0C0C0'),
                                fontFamily: 'netflix'
                              ),

                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              fillColor: HexColor('#3F3F3F'),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: HexColor('#C0C0C0'),
                                  fontFamily: 'netflix'
                              ),
                              hintText: 'Password'
                            ),
                          )
                        ],
                      )

                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                    style: TextStyle(
                      color: HexColor('#C0C0C0'),
                      fontFamily: 'netflix'
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  width: 140,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push((context), MaterialPageRoute(builder: (context)=>Home())
                        );
                      },
                      child: Text('Login',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#DB202C'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),


                    ),

                  ),
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push((context), MaterialPageRoute(builder: (context)=>SignUp())
                      );
                    },
                    child: Text('Sign-up',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#DB202C'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),


                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text('Help?',
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor('##C0C0C0'),
                  ),
                ),
              ),
              




            ],
          ),
        ),
      ),
    );
  }
}
