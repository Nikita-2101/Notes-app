import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  final String documentId ;
  final String val ;
  GetData({super.key,required this.documentId,required this.val});
  @override
  Widget build(BuildContext context) {
    CollectionReference note = FirebaseFirestore.instance.collection('notes') ;
    return FutureBuilder<DocumentSnapshot>(
      future: note.doc(documentId).get(),
      builder: (context , snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic> ;
          return Text('${data[val]}') ;
        }
        return const Text('loading....') ;
      });
  }
}