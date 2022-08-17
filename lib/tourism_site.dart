import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class TourismSite extends StatefulWidget{
  const TourismSite({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  State<TourismSite> createState() => _TourismSiteState();
}

class _TourismSiteState extends State<TourismSite>{
  double rating = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0,
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
                children: [
                  Padding(
                      padding:const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Pantai Kuta, Bali",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Rp. 20.000,00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Rating(
                          rating: rating,
                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                        ),
                        Text('${rating}',style: const TextStyle(color: Colors.black, fontSize: 20),)
                      ],
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonBar(
                      children: [
                        ElevatedButton(
                            onPressed: (){return;},
                            child: const Text(
                              'Order',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ))

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

typedef RatingHandlerCallback = void Function(double rating);

class Rating extends StatelessWidget {
  final int count;
  final double rating;
  final RatingHandlerCallback onRatingChanged;

  const Rating({Key? key, this.count = 5, this.rating = 0, required this.onRatingChanged});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
          Icons.star_border,
          color: Colors.black
      );
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(
        Icons.star_half,
        color: Colors.yellow,
      );
    } else {
      icon = const Icon(
        Icons.star,
        color: Colors.yellow,
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null ? null : () =>
          onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(count, (index) => buildStar(context, index))
    );
  }
}