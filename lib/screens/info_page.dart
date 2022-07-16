import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  final String docID;
  const InformationPage({Key? key,required this.docID}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,)),
                Center(
                  child:FutureBuilder(
                    future: FirebaseFirestore.instance.
                    collection('shows').
                    doc(widget.docID).
                    get(),
                      builder: (context,AsyncSnapshot snapshot){
                      if(!snapshot.hasData){
                        return CircularProgressIndicator(color: Colors.red,);
                      }
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          child: Column(
                            children: [

                              Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                Image.network(snapshot.data['image'],),
                                  Icon(Icons.play_arrow,color: Colors.white,size: 100,),

                                  ],
                                )
                          ),

                              SizedBox(height: 20,),
                              Text(snapshot.data['duration'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),)



                            ],
                          ),
                        ),
                      );
                      }
                  ) ,
                )



              ],


            ),
          ),
        ),
      ),
    );
  }
}
