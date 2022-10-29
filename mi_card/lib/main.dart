import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Card Application',
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/64529996?v=4'),
            ),
            const Text(
              'Akansha Jain',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade100,
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+91 7678******',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ),

            // Container(
            //   padding: const EdgeInsets.all(10),
            //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            //   color: Colors.white,
            //   child: Row(
            //     children: const [
            //       Icon(
            //         Icons.phone,
            //         color: Colors.teal,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         '+91 8543920013',
            //         style: TextStyle(
            //           fontSize: 20,
            //           color: Colors.teal,
            //           fontFamily: 'Source Sans Pro',
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'jakansha2001@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
