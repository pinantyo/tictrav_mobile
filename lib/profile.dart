import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){return;},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
            ),

          ],
        ),
      ),
    );
  }
}