import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class TourismSite extends StatefulWidget{
  const TourismSite({Key? key, required this.title, required this.testImage}) : super(key: key);
  
  final String title;
  final String testImage;

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
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    imageUrl: widget.testImage
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 450),
              padding: const EdgeInsets.all(0),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top:Radius.circular(50))
                ),
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
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
                        ),
                        Row(
                          children: [
                            Rating(
                              rating: rating,
                              onRatingChanged: (rating) => setState(() => this.rating = rating),
                            ),
                            Text('${rating}',style: const TextStyle(color: Colors.black, fontSize: 20),)
                          ],
                        ),
                        const Text(
                          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                                onPressed: (){return;},
                                child: const Text(
                                  'Order',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Related Tourism Sites',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 250.0,
                          child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: List<Widget>.generate(5, (index){
                                return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        // boxShadow: const [
                                        //   BoxShadow(
                                        //     color: Colors.black26,
                                        //     offset: Offset(10.0, 10.0,),
                                        //     blurRadius: 15.0,
                                        //   ),
                                        //   BoxShadow(
                                        //     color: Colors.black26,
                                        //     offset: Offset(0.0, 0.0,),
                                        //     blurRadius: 0.0,
                                        //   ),//BoxShadow
                                        // ]
                                    ),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => TourismSite(title: widget.title,testImage:widget.testImage))
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) => SizedBox(
                                                width: MediaQuery.of(context).size.width,
                                              ),
                                              imageUrl: widget.testImage,
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

                      ].map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: e
                      ),
                      ).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
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