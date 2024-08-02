import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/dataretrieve.dart';


class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}


class _ListPageState extends State<ListPage> {

  List<String> docIds = [] ;

  Future<void> getDocId() async {
    final snapshot = await FirebaseFirestore.instance.collection('notes').get();
    
      // setState(() {
        docIds = snapshot.docs.map((doc) => doc.id).toList();
      // });
  }

  Future<void> delete(String docId) async {
    final del = FirebaseFirestore.instance.collection('notes').doc(docId) ;
    setState(() {
      del.delete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      height: MediaQuery.of(context).size.height , 
      child: FutureBuilder(
        future: getDocId(),
        builder: ((context, snapshot){
          return ListView.builder(
          itemBuilder: (context , index) {
            return Container(
              height: 95,
              child: Card(
                elevation: 2,
                child: ListTile(
                  // leading : Text('Title') ,
                  title : GetData(documentId: docIds[index], val: 'title') ,
                  subtitle: GetData(documentId: docIds[index], val: 'body'),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => delete(docIds[index]) , ),
                ),
              ),
            ); 
          },
          itemCount: docIds.length,
          scrollDirection: Axis.vertical,
        );
        }),
      ),
    );
  }
}