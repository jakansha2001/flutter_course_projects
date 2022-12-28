import 'package:flutter/material.dart';
import 'package:whatsapp_ui/calls/views/call_view.dart';
import 'package:whatsapp_ui/chat/views/chat_view.dart';
import 'package:whatsapp_ui/status/views/status_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.more_vert),
            SizedBox(
              width: 10.0,
            )
          ],
          backgroundColor: const Color.fromRGBO(39, 94, 86, 1.0),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('CHATS'),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Color.fromRGBO(
                                39,
                                94,
                                86,
                                1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text('STATUS'),
              const Text('CALLS'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(91, 198, 91, 1.0),
          onPressed: () {},
          child: const Icon(
            Icons.message,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: [
              ChatView(),
              StatusView(),
              CallsView(),
            ],
          ),
        ),
      ),
    );
  }
}
