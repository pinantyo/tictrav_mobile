import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{
  const SearchPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(),
          ListView(
            children: [
              Row(
                children: const [
                  Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  Text('Tempat wisata, Kota')
                ],
              ),
              Row(
                children: const [
                  Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  Text('Tempat wisata, Kota')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}