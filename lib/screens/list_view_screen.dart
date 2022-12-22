import 'package:flutter/material.dart';

import '/model/post.dart';
import '/network/network_request.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Post> postData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromSever) {
      setState(() {
        postData = dataFromSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Request')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: postData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${postData[index].id}. ${postData[index].title}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${postData[index].body}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
