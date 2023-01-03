import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_ui/tab_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    // Icon(
                    //   Icons.ondemand_video_rounded,
                    //   color: Colors.red,
                    // ),
                    Image.network(
                      'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                      height: 30,
                      //width: 10,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'YouTube',
                      style: GoogleFonts.anton(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: drawerData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(),
                        leading: Icon(
                          icons[index],
                          size: 25,
                        ),
                        horizontalTitleGap: 0,
                        title: Text(
                          drawerData[index],
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              // Icon(
              //   Icons.ondemand_video_rounded,
              //   color: Colors.red,
              // ),
              Image.network(
                'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                height: 30,
                //width: 10,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                'YouTube',
                style: GoogleFonts.anton(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.cast,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.notifications_none,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/events/flutter%20festival%20faci_FDFYs2P.jpeg',
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 47,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(39, 39, 39, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Icon(
                          Icons.explore_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: const Color.fromRGBO(39, 39, 39, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade600,
                                width: 0.3,
                              ),
                              color: const Color.fromRGBO(39, 39, 39, 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Text(
                                tabs[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
