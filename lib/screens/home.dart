import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix/screens/info_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      Image.network('https://firebasestorage.googleapis.com/v0/b/netflixclone-75e96.appspot.com/o/logo.png?alt=media&token=9c7c8265-ef96-4a22-87e3-ee64b5cfa5cb',
                      height: 50,
                      ),
                      CircleAvatar(
                        backgroundColor: HexColor('#343434'),
                        child: Icon(Icons.search,color: Colors.white,),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Originals',
                        style: TextStyle(
                          color: Colors.white

                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down,color: Colors.red,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/netflixclone-75e96.appspot.com/o/malang.jpg?alt=media&token=286e1c78-0d99-49a3-b78c-cc78d1f07599',
                              ),
                            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                            fit: BoxFit.fill
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Continue Watching',
                            style: TextStyle(
                              fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                text: '\nMALANG',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ]
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Shows',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'netflix',
                          fontWeight: FontWeight.bold
                        ),

                      ),
                      Text("See All ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,

                        ),
                      ),
                    ],
                  ),
                  // Fire Store
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance.
                      collection('shows').orderBy('subtext').
                      get(),
                      builder:(context,AsyncSnapshot snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(
                              color: HexColor('#DB202C'),
                            ),
                          );
                        }
                        return Container(
                          height: 200,
                          child: ListView.builder(
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index){
                                return GestureDetector(
                                  onTap:(){
                                    Navigator.push((context), MaterialPageRoute(builder: (context)=>InformationPage(docID: snapshot.data.docs[index].reference.id,))
                                    );

                                  },
                                  child: Card(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Container(
                                            height:120,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(snapshot.data.docs[index]['image']),
                                                fit: BoxFit.fitWidth
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(snapshot.data.docs[index]['text'],
                                          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                        Text(snapshot.data.docs[index]['subtext'],
                                          style: TextStyle(color: Colors.white,fontSize:14 ),),

                                      ],
                                    ),
                                  ),
                                );

                              }
                          ),
                        );
                      }
                  ),






                ],
              ),
            ),
          ),
        ),
    );
  }
}
