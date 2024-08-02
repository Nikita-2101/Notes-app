import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  var _titleController = TextEditingController() ;
  var _bodyController = TextEditingController() ;
  late FocusNode _bodyFocusNode;
  @override
  void initState() {
    super.initState();
    _bodyFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _bodyFocusNode.dispose();
    super.dispose();
  }

  void reset() {
    setState(() {
      _titleController.clear();
      _bodyController.clear();
    });
  }

  Future save() async{
    await FirebaseFirestore.instance.collection('notes').add({
      'title' : _titleController.text.trim() ,
      'body' : _bodyController.text.trim() 
    });
    Navigator.pop(context) ;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _bodyFocusNode.requestFocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ), 
          backgroundColor: Colors.purple.shade200,
          title: const Center(child: Text('Notes App' , style: TextStyle(fontSize: 24 , color: Colors.white),),),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15,) ,
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                        label: const Text('Title' , style: TextStyle(fontWeight: FontWeight.w600),),
                        hintText: 'Enter Title',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.purple ,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      ),
                      const SizedBox(height: 20,) ,
                      TextField(
                        controller: _bodyController,
                        focusNode: _bodyFocusNode ,
                        maxLines: null, 
                        decoration: const InputDecoration(
                          label: Center(child: Text('NOTES', style: TextStyle(color: Colors.purple),)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {
                        save() ;
                      },
                      backgroundColor: Colors.purple.shade300,
                      child: const Icon(Icons.save , color: Colors.white,),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {
                        reset() ;
                      },
                      backgroundColor: Colors.purple.shade300,
                      child: const Icon(Icons.restore_sharp , color: Colors.white,),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      );
    }
  }