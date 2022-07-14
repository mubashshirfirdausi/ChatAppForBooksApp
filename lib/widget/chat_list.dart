import 'package:books_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key? key,
    required this.chatData,
  }) : super(key: key);

  final List chatData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatData.length,
      itemBuilder: (context, index) {
        String title = chatData[index]['name'];
        String company = chatData[index]['company'];
        String imageUrl = chatData[index]['companyImageURL'];
        String role = chatData[index]['role'];
        bool verified = chatData[index]['verified'];
        String status = chatData[index]['status'];

        return Column(
          children: [
            ListTile(
              leading: Image.network(imageUrl),
              title: Row(children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(' | '),
                Text(company)
              ]),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: status == 'banned' ? Colors.red : Colors.green,
                    ),
                  ),
                  Text(role),
                  const Text(' | '),
                  Text(verified ? 'Verified' : 'Not Verified'),
                ],
              ),
              trailing: Column(
                children: [
                  Text(index % 2 == 0 ? '1:20' : '12:30'),
                  const SizedBox(height: 8),
                  if (index == 0 || index == 1 || index == 4 || index == 7)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        index % 2 == 0 ? '2' : '3',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 13),
                      ),
                    )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(chatData[index]),
                  ),
                );
              },
            ),
            const Divider(
              thickness: 2,
              indent: 16,
              endIndent: 16,
            )
          ],
        );
      },
    );
  }
}
