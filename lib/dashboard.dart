import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:tictrav_mobile/tourism_site.dart';
import 'package:tictrav_mobile/tourism_cities.dart';
import 'package:tictrav_mobile/profile.dart';


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
  static const _imageURLTesting = 'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg';
  // bool _visitedAny = false;
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
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: (){
              return;
              // showSearch(
              //     context: context,
              //     delegate: delegate
              // );
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
            iconSize: 30.0,
          ),
          IconButton(
              onPressed:(){
                return;
              },
              tooltip: 'Order List',
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size:30.0,
              )
          ),
          IconButton(
              onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));},
              tooltip: 'Account Settings',
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size:30.0,
              )
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                  children:[

                    // if(_visitedAny)...[
                    //   const Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    //         child: Text(
                    //             'Tourism Sites For You',
                    //             style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                    //         ),
                    //       )
                    //   ),
                    //
                    //   SizedBox(
                    //     height: 250.0,
                    //     child: ListView(
                    //         physics: const BouncingScrollPhysics(),
                    //         scrollDirection: Axis.horizontal,
                    //         children: List<Widget>.generate(10, (index){
                    //           return Container(
                    //               padding: const EdgeInsets.all(10),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(12),
                    //                   boxShadow: const [
                    //                     BoxShadow(
                    //                       color: Colors.black26,
                    //                       offset: Offset(10.0, 10.0,),
                    //                       blurRadius: 15.0,
                    //                     ), //BoxShadow
                    //                   ]
                    //               ),
                    //               child: InkWell(
                    //                 onTap: () => Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(builder: (context) => TourismSite(title: widget.title,))
                    //                 ),
                    //                 child: Stack(
                    //                   children: [
                    //                     ClipRRect(
                    //                       borderRadius: BorderRadius.circular(12),
                    //                       child: CachedNetworkImage(
                    //                         placeholder: (context, url) => SizedBox(
                    //                           width: MediaQuery.of(context).size.width,
                    //                         ),
                    //                         imageUrl: _imageURLTesting,
                    //                       ),
                    //                     ),
                    //                     Positioned(
                    //                         bottom:0,
                    //                         left: 0,
                    //                         right: 0,
                    //                         child: Card(
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.circular(12.0)
                    //                           ),
                    //                           margin: const EdgeInsets.all(0),
                    //                           child: Column(
                    //                             children: [
                    //                               const Padding(
                    //                                 padding: EdgeInsets.all(10),
                    //                                 child: Text(
                    //                                   'Pantai Kuta, Bali',
                    //                                   style: TextStyle(
                    //                                       fontWeight: FontWeight.normal,
                    //                                       fontSize: 24
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Padding(
                    //                                 padding: const EdgeInsets.all(10),
                    //                                 child: Row(
                    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                   children: const [
                    //                                     Text(
                    //                                       'Category',
                    //                                       style: TextStyle(
                    //                                           fontWeight: FontWeight.normal,
                    //                                           fontSize: 20
                    //                                       ),
                    //                                     ),
                    //                                     Text(
                    //                                       'Harga',
                    //                                       style: TextStyle(
                    //                                           fontWeight: FontWeight.normal,
                    //                                           fontSize: 20
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               )
                    //                             ],
                    //                           ),
                    //                         )
                    //                     )
                    //                   ],
                    //                 ),
                    //               )
                    //           );
                    //         })
                    //     ),
                    //   ),
                    // ] else... [
                    //   const Text('You have not visited any place yet')
                    // ],

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                          child: Text(
                              'Popular Tourism Sites',
                              style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                          ),
                        )
                    ),

                    SizedBox(
                      height: 250.0,
                      child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: List<Widget>.generate(10, (index){
                            return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(10.0, 10.0,),
                                        blurRadius: 15.0,
                                      ), //BoxShadow
                                    ]
                                ),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TourismSite(title: widget.title,testImage:_imageURLTesting))
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                          ),
                                          imageUrl: _imageURLTesting,
                                        ),
                                      ),
                                      Positioned(
                                          bottom:0,
                                          left: 0,
                                          right: 0,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.0)
                                            ),
                                            margin: const EdgeInsets.all(0),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(
                                                    'Pantai Kuta, Bali',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 24
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10),
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
                                  ),
                                )
                            );
                          })
                      ),
                    ),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                          child: Text(
                              'Cities',
                              style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                          ),
                        )
                    ),

                    SizedBox(
                      height: 250.0,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: List<Widget>.generate(10, (index){
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const TourismCitiesPage(city: 'Bali',testImage:_imageURLTesting))
                                );},
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      imageUrl: _imageURLTesting,
                                    ),
                                  ),
                                  const Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Text(
                                      'Jakarta',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ),
                    )
                  ]
              )
          )
      ),
    );
  }
}
