import 'package:flutter/material.dart';

class ContactListView extends StatefulWidget {
   ContactListView({super.key});

  @override
  State<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
TextEditingController nameController = TextEditingController();

TextEditingController numberController = TextEditingController();

List contacts =[
{

  'name':'ali',
  'number': '03113'
}
];

addContact(name,number){
  contacts.add({
    'name': name,
    'number': number,
  });
   setState(() {});
}

editContact(index,name,mumber){
  contacts [index]={
  'name':'ali',
  'number': '03113',
  };
   setState(() {});
}
deleteContact(index,name,mumber){
  contacts.removeAt(index);
   setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
          body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index]
              ['name']),
              subtitle: Text(contacts
              [index]['number']),
              tileColor: Colors.white,
              trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed:(){
showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Enter Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'name',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10),
          TextField(
            controller: numberController,
            decoration: InputDecoration(
              labelText: 'number',
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
            addContact(index, nameController.text,numberController.text);
          },
          child: Text("Submit"),
        ),
      ],
    ),
  );
                }, icon:Icon(Icons.add))
              ],
              ),
            );
          }),
    );
  }
}