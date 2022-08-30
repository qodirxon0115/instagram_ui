import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/user_1 (1).jpeg", "Jazmin"),
    Story("assets/images/user_2 (1).jpeg", "Sylvester"),
    Story("assets/images/user_3 (1).jpeg", "Lavina"),
    Story("assets/images/user_1 (1).jpeg", "Jazmin"),
    Story("assets/images/user_2 (1).jpeg", "Sylvester"),
    Story("assets/images/user_3 (1).jpeg", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
        userName: "Brianne",
        userImage: "assets/images/user_1 (1).jpeg",
        postImage: "assets/images/feed_1 (1).jpeg",
        caption: "Consequent nil liquid omnibus consequent."),
    Post(
        userName: "Henri",
        userImage: "assets/images/user_2 (1).jpeg",
        postImage: "assets/images/feed_2 (1).jpeg",
        caption: "Consequent nil liquid omnibus consequent."),
    Post(
        userName: "Mariano",
        userImage: "assets/images/user_3 (1).jpeg",
        postImage: "assets/images/feed_3 (1).jpeg",
        caption: "Consequent nil liquid omnibus consequent."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              // #stories watch all
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Stories", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text("Watch All", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ],
                ),
              ),

              // #storylist
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),

              // #postlist
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                    return _itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [

          // #header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10,),

                    Text(
                      post.userName,
                      style: const TextStyle(color: Colors.white60),),
                  ],
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.keyboard_control_outlined),
                  color: Colors.white70,
                ),
              ],
            ),
          ),

          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: const AssetImage("assets/images/placeholder.png"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite_outline, color: Colors.white70,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.comment_bank_outlined, color: Colors.white70,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.send, color: Colors.white70,),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.bookmark_border_outlined,
                   color: Colors.white70,),
              ),
            ],
          ),

          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Like By ",
                    style: TextStyle(color: Colors.white54),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " Yesenia,",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ]
              ),
            ),
          ),

          //caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: post.caption,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //postdate
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: const Text(
              "September 2022",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white54
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          story.name,
          style: const TextStyle(color: Colors.white60),
        ),
      ],
    );
  }

}
