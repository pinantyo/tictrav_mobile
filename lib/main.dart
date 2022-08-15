import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
      home: MyHomePage(title: 'Tictrav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(widget.title),
        // ),
        body: SafeArea(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.symmetric(vertical:60.0, horizontal: 20.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg'),
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
                    bottom: 10,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Image(
                                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                              ),
                              Text('Tempat wisata, Kota')
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Image(
                                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                              ),
                              Text('Tempat wisata, Kota')
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                  children:[
                    RichText(
                      text: const TextSpan(
                        text: 'Popular Tourism Sites',
                        style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      ),
                    ),
                    SizedBox(
                        height: 400.0,
                        child: PageView(
                          // padding: EdgeInsets.all(20.0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 4,
                                              offset: Offset(4, 8), // Shadow position
                                            ),
                                          ]
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) => const Center(
                                                child: SizedBox(
                                                  height: 100.0,
                                                  width: 100.0,
                                                  child: CircularProgressIndicator(strokeWidth: 3.0,),
                                                ),
                                              ),
                                              imageUrl: 'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg',
                                            ),
                                          ),
                                          Positioned(
                                              bottom:0,
                                              left: 0,
                                              right: 0,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0)
                                                ),
                                                margin: EdgeInsets.all(0),
                                                child: Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Text(
                                                        'Pantai Kuta, Bali',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: 25
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            'Category',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                          Text(
                                                            'Harga',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 4,
                                              offset: Offset(4, 8), // Shadow position
                                            ),
                                          ]
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) => const Center(
                                                child: SizedBox(
                                                  height: 100.0,
                                                  width: 100.0,
                                                  child: CircularProgressIndicator(strokeWidth: 3.0,),
                                                ),
                                              ),
                                              imageUrl: 'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg',
                                            ),
                                          ),
                                          Positioned(
                                              bottom:0,
                                              left: 0,
                                              right: 0,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                ),
                                                margin: EdgeInsets.all(0),
                                                child: Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Text(
                                                        'Pantai Kuta, Bali',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: 25
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            'Category',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                          Text(
                                                            'Harga',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                  ]
              )
            ],
          )
        ),
    );
  }
}
