import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Notification',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListTile(
                      leading: Image.asset('assets/images/propic.png'),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hey, it’s time to take suppliment ',
                            style: TextStyle(
                              color: Color(0xFF1D1617),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'About 10 hours agoNov',
                            style: TextStyle(
                              color: Color(0xFF7B6F72),
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: const [
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Divider(
                      height: 2,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
