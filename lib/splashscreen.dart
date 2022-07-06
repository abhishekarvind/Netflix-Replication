import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;


  @override
  void initState(){
    super.initState();

    _controller=VideoPlayerController.asset('assets/Intro.mp4')
    ..initialize().then((_){
      setState(() {});
    })
    ..setVolume(10);

    _playVideo();
  }

  void _playVideo() async{
    _controller.play();

    await Future.delayed(Duration(seconds: 6));



  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        child: _controller.value.isInitialized
            ?AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child:VideoPlayer(_controller) ,
        )
            :Container(),
      ),
    );
  }
}
