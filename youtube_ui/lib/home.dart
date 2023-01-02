import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
                width: 7,
              ),
              Text(
                'YouTube',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
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
          bottom: TabBar(
            tabs: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.grey,
                    child: const Icon(
                      Icons.explore,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 4,
                    height: 22,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                width: 20,
                height: 22,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
