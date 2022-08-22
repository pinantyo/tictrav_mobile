import 'package:flutter/material.dart';


class ReviewDetail extends StatelessWidget{
  const ReviewDetail({Key? key, required this.tourismSite}) : super(key: key);

  final String tourismSite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(tourismSite,style: const TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: List<Widget>.generate(20, (index){
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 20.0,
                          ),
                          Text('User')
                        ],
                      ),
                      const Text('Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum')
                    ],
                  ),
                ),
              );
            }),
          )
        ),
      ),
    );
  }
}