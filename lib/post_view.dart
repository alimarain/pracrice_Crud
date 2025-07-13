import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final TextEditingController postController = TextEditingController();
    // TextEditingController contentController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  final List posts = [];

  final List<String> images = [
    'https://images.pexels.com/photos/5054354/pexels-photo-5054354.jpeg?_gl=1*r3h9a5*_ga*NDA5MDc1MTMxLjE3NTIzMTg3NzQ.*_ga_8JE65Q40S6*czE3NTIzMTg3NzMkbzEkZzEkdDE3NTIzMTg4MTMkajIwJGwwJGgw',
    'https://images.unsplash.com/photo-1553374402-559e8b431161?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://cdn.pixabay.com/photo/2017/05/11/11/15/workplace-2303851_1280.jpg',
    'hhttps://images.unsplash.com/photo-1548438294-1ad5d5f4f063?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  int imgIndex = 0;

  void addNewPost() {
    if (postController.text.trim().isEmpty) return;

    posts.add({
      'text': postController.text,
      'img': [urlController.text],
    });

    print(urlController.text);
        deletePost(index){
          posts.removeAt(index);
           setState(() {});
    };
    //         editPost(index){
    //       posts[index];
    //         // 'content': data['content'], 
    //         // 'url':data['url'],
    //        setState(() {});
    // };

    imgIndex = (imgIndex + 1) % images.length;
    postController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Social App", style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.person_add_alt),
          SizedBox(width: 8),
          Icon(Icons.search),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Share something...",
                prefixIcon: const Icon(Icons.account_circle),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {


  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Enter Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: postController,
            decoration: InputDecoration(
              labelText: 'Content',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10),
          TextField(
            controller: urlController,
            decoration: InputDecoration(
              labelText: 'URL',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            addNewPost();
          },
          child: Text("Submit"),
        ),
      ],
    ),
  );
},
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/847/847969.png'),
                      ),
                      title: const Text("Ali User"),
                      subtitle: const Text("Just now"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        posts[index]['text'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.network(
                      posts[index]['img'],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.thumb_up_off_alt, color: Colors.grey),
                        Icon(Icons.chat_bubble_outline, color: Colors.grey),
                        Icon(Icons.send_outlined, color: Colors.grey),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "Live"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}