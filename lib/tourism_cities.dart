import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TourismCitiesPage extends StatelessWidget{
  const TourismCitiesPage({Key? key, required this.city}) : super(key: key);
  final String city;

  static const _imageURLTesting = 'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg';

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
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.all(20.0),
            children: List<Widget>.generate(20, (index){
              return GridTile(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                          placeholder:(context, url) => const CircularProgressIndicator(),
                          imageUrl: _imageURLTesting
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
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
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ),
    );
  }
}