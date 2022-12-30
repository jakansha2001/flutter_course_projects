import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_ui/api_service.dart';
import 'package:instagram_ui/photos_model.dart';
import 'package:instagram_ui/posts_model.dart';
import 'package:instagram_ui/story_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];
  List<PhotosModel> _photos = [];

  final ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }

  void getData() async {
    _photos = await ApiService().getPhotos();
    _posts = (await ApiService().getPosts()).posts;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (_listController.hasClients) {
              _listController.animateTo(
                _listController.position.minScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            }
          },
          child: Text(
            'Instagram',
            style: GoogleFonts.lobsterTwo(fontSize: 27),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.maps_ugc,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              icon: const Icon(
                Icons.home_filled,
              ),
              onPressed: () {
                if (_listController.hasClients) {
                  _listController.animateTo(
                    _listController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                }
              },
            ),
            const Icon(
              Icons.search,
            ),
            const Icon(
              Icons.slow_motion_video,
            ),
            const Icon(
              Icons.favorite_border,
            ),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(stories[0].imgUrl),
            ),
          ],
        ),
      ),
      body: ListView(
        controller: _listController,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          stories[index].imgUrl,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(stories[index].username + index.toString()),
                    ],
                  ),
                );
              },
            ),
          ),
          for (int i = 0; i < _posts.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          _photos[i].thumbnailUrl,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        generateRandomString(5) + _posts[i].userId.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(_photos[i].url),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${_posts[i].reactions}00',
                      ),
                    ],
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
