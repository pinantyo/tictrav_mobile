import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tictrav_mobile/dashboard.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tictrav App',
      home: SplashScreen(title: 'Tictrav'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: widget.title,)),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(vertical:60.0, horizontal: 20.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/theme.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                          'Tictrav',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 70.0
                          )
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Tictrav',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 30.0
                          ),
                          children: <TextSpan>[
                            TextSpan(text: ' travel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            TextSpan(text: ' the world!'),
                          ],
                        ),
                      )
                    ],
                  )
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                bottom: 0,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white38,
                      color: Colors.white
                    ),
                  ),
                )
              )
            ],
          ),
        ),
    );
  }
}
