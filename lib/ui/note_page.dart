import 'package:belajardasarflutter/bloc/logout_bloc.dart';
import 'package:belajardasarflutter/bloc/note_bloc.dart';
import 'package:belajardasarflutter/model/note.dart';
import 'package:belajardasarflutter/ui/note_form_page.dart';
import 'package:belajardasarflutter/ui/note_detail_page.dart';
import 'package:belajardasarflutter/widget/note_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late List<Note> notes;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();

    refreshNotes();
  }


  Future refreshNotes() async {
    setState(() => isLoading = true);
    this.notes = await NoteBloc.getNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Notes',
        style: TextStyle(fontSize: 24),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () async {
            await LogoutBloc.logout().then((value) {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder:
                  (context) => LoginPage()));
            });
          },
        ),
      ],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildNotes(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NoteFormPage()),
        );
        refreshNotes();
      },
    ),
  );

  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: notes.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final note = notes[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteDetailPage(note: note,),
          ));

          refreshNotes();
        },
        child: NoteCardWidget(note: note, index: index),
      );
    },
  );
}