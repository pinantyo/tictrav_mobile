import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class TourismSite extends StatefulWidget{
  const TourismSite({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  State<TourismSite> createState() => _TourismSiteState();
}

class _TourismSiteState extends State<TourismSite>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
        ),
        title: const Text('Pantai Kuta, Bali',style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl: 'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top:Radius.circular(50))
              ),
              margin: const EdgeInsets.all(0),
              child: Column(
                children: const [
                  Text("Lorem ipsum"),
                  Text("Lorem ipsum"),
                  Text("Lorem ipsum"),
                  Text("Lorem ipsum"),
                  Text("Lorem ipsum"),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  
}