import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          enableFeedback: false,
          splashRadius: 0.1,
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(homeNotesViewRoute, (route) => false),
          icon: const Icon(Icons.arrow_back_ios),
        ),

        //
        title: const Text('Title'),

        actions: [
          //
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.import_contacts,
              size: 25,
            ),
          ),

          //
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'lib/assets/icons/attach_file.png',
              width: 25,
              height: 25,
            ),
          ),

          //
          PopupMenuButton(
            itemBuilder: (context) {
              return [];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.5, vertical: 5.0),
        child: TextField(
          controller: _noteController,
          autofocus: true,
          cursorColor: Colors.red.shade300,
          decoration: const InputDecoration(border: InputBorder.none),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}
