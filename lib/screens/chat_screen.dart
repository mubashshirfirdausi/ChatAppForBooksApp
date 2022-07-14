import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Map userData;
  const ChatScreen(this.userData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = userData['name'];
    // String company = userData['company'];
    String imageUrl = userData['companyImageURL'];
    String role = userData['role'];
    bool verified = userData['verified'];
    String status = userData['status'];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(' | ', style: Theme.of(context).textTheme.caption),
                Text(role, style: Theme.of(context).textTheme.caption),
              ],
            ),
            Row(
              children: [
                Text(verified ? 'Verified' : 'Not Verified', style: Theme.of(context).textTheme.subtitle2),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: status == 'banned' ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(8), reverse: true, children: [
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SizedBox(
              width: 100,
              child: Card(
                color: Colors.cyan,
                child: ListTile(
                  title: Text(
                    'Hi',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: const [
          SizedBox(
            width: 100,
            child: Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text('Hello'),
              ),
            ),
          ),
        ])
      ]),
    );
  }
}
