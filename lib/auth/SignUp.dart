import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,)),
              SizedBox(height: 60,),
              Center(child: Image.asset('assets/logo.png',width: 250,)),
              SizedBox(height: 60,),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email or Contact number',
                        hintStyle: TextStyle(
                          color: HexColor('##C0C0C0'),
                        ),
                        filled: true,
                        fillColor: HexColor('#3F3F3F'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email new Password',
                        hintStyle: TextStyle(
                          color: HexColor('##C0C0C0'),
                        ),
                        filled: true,
                        fillColor: HexColor('#3F3F3F'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email new Password again',
                        hintStyle: TextStyle(
                          color: HexColor('##C0C0C0'),
                        ),
                        filled: true,
                        fillColor: HexColor('#3F3F3F'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Sign-Up',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#DB202C'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Center(
                child:Text(
                    'Help?',
                  style: TextStyle(
                    color: HexColor('#C0C0C0'),
                  ),
                ),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
