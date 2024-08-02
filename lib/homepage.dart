import 'package:flutter/material.dart';
import 'package:notesapp/list.dart';
import 'package:notesapp/notespage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ), 
        backgroundColor: Colors.purple.shade200,
        title: const Center(child: Text('Notes App' , style: TextStyle(fontSize: 24 , color: Colors.white),),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15,) ,
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      ListPage() ,
                      Positioned(
                        bottom: 70,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes())) ;
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple.shade300, 
                            ),
                            child: const Icon(Icons.add, size: 30, color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
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
