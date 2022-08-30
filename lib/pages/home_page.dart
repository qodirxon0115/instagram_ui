import 'package:flutter/material.dart';

import 'feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;

  final _pages = [
     const FeedPage(),
     const FeedPage(),
     const FeedPage(),
     const FeedPage(),
     const FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Instagram", style: TextStyle(color: Colors.white,),),
        leading: IconButton(
          color: Colors.white,
          onPressed: (){},
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.live_tv_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.send_outlined),
            color: Colors.white,
          ),
        ],
        //systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.grey,),
            label: ("Feed"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, color: Colors.grey,),
              label: ("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, color: Colors.grey,),
              label: ("Upload"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.grey,),
              label: ("Like"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined, color: Colors.grey,),
            label: ("Settings"),
          ),
        ],
      ),
    );
  }
}
