import 'package:flutter/material.dart';

class FacebookApp extends StatelessWidget {
  const FacebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Facebook',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          actions: [
            Icon(Icons.add_circle_rounded, color: Colors.black),
            SizedBox(width: 20),
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 20),
            Icon(Icons.message, color: Colors.black),
            SizedBox(width: 20),
          ],
        ),
        body: ListView(
          children: [
            // Post Input Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home_filled, color: Colors.blueAccent),
                      SizedBox(width: 20),
                      Icon(Icons.ondemand_video_sharp, color: Colors.black),
                      SizedBox(width: 20),
                      Icon(Icons.group, color: Colors.black),
                      SizedBox(width: 20),
                      Icon(Icons.card_giftcard_outlined, color: Colors.black),
                      SizedBox(width: 20),
                      Icon(Icons.notifications_none, color: Colors.black),
                      SizedBox(width: 20),
                      Icon(Icons.menu, color: Colors.black),

                    ],
                  ),
                  Divider(thickness: 3),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('f1.JPG'),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: Text(
                              "What's on your mind?",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.photo_album_outlined, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 3),

            // Horizontal Stories Section
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  StoryCard(
                    containerImage: 'f2.JPG',
                    avatarImage: 'f6.JPG',
                    name: 'Rehan',
                  ),
                  StoryCard(
                    containerImage: 'f4.JPG',
                    avatarImage: 'f5.JPG',
                    name: 'Khan',
                  ),
                  StoryCard(
                    containerImage: 'f6.JPG',
                    avatarImage: 'f7.JPG',
                    name: 'Marwat',
                  ),
                  StoryCard(
                    containerImage: 'f8.JPG',
                    avatarImage: 'f2.JPG',
                    name: 'Pakistani',
                  ),
                ],
              ),
            ),
            Divider(thickness: 3),

            // Post Section
            PostCard(
              userName: 'Rehan Khan',
              userImage: '1.JPG',
              postText: 'Summer vibes!',
              postImage: 'handbag.JPG',
              likes: '210',
              comments: '45',
            ),
            PostCard(
              userName: 'Arsalan Khan',
              userImage: '2.JPG',
              postText: 'Amazing Fashion Dress!',
              postImage: '5.JPG',
              likes: '2k',
              comments: '899',
            ),
          ],
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String containerImage;
  final String avatarImage;
  final String name;

  const StoryCard({
    Key? key,
    required this.containerImage,
    required this.avatarImage,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 130,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(containerImage), // Background image for the container
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Dark overlay for text readability
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CircleAvatar with a separate image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatarImage), // Avatar image
                  ),
                ),
                // Display name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String postText;
  final String postImage;
  final String likes;
  final String comments;

  const PostCard({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.postText,
    required this.postImage,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userImage),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('8m ago'),
                      SizedBox(width: 5),
                      Icon(Icons.public, size: 16),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(postText),
          SizedBox(height: 10),
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(postImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.favorite_outline),
              SizedBox(width: 5),
              Text(likes),
              SizedBox(width: 20),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 5),
              Text(comments),
            ],
          ),
        ],
      ),
    );
  }
}
