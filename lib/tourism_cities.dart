import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tictrav_mobile/tourism_site.dart';

class TourismCitiesPage extends StatelessWidget{
  const TourismCitiesPage({Key? key, required this.city, required this.testImage}) : super(key: key);
  final String city;
  final String testImage;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
            color: Colors.black,
          )
        ),
        title: const Text('Bali',style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/theme.jpg'),fit: BoxFit.cover)
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: List<Widget>.generate(20, (index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => TourismSite(title:'Pantai Kuta, Bali',testImage: testImage,))),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                            placeholder:(context, url) => const CircularProgressIndicator(),
                            imageUrl: testImage
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Pantai Kuta, Bali', style: TextStyle(color: Colors.black,fontSize: 25),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Ratings'),
                                  Text('Harga')
                                ].map((e) => Padding(padding: const EdgeInsets.all(20.0), child: e,)).toList(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
          ),
        )
      ),
    );
  }
}