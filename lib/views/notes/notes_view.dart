import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samsung_note/utilities/dialogs/logout_dialog.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';
import 'package:samsung_note/view_controller/auth_bloc.dart';
import 'package:samsung_note/view_controller/auth_event.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //
      floatingActionButton: Material(
        elevation: 1.5,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            enableFeedback: false,
            onPressed: () => Navigator.of(context).pushNamed(newNoteRoute),
            icon: const Icon(
              Icons.note_alt_outlined,
              color: Colors.red,
            ),
          ),
        ),
      ),

      //
      body: CustomScrollView(
        slivers: [
          //
          SliverAppBar(
            backgroundColor: Colors.grey.shade300,
            expandedHeight: 250,

            // floating: true,
            pinned: true,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    //
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),

                    const Spacer(),
                    //
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.picture_as_pdf),
                    ),
                    //
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_rounded),
                    ),

                    //
                    IconButton(
                      onPressed: () async {
                        final ans = await logoutDialog(context: context,title: "Logout Dialog",content: "Are you sure you want to logout");
                        if (ans ?? false) {
                          context.read<AuthBloc>().add(AuthEventLogOut());
                        }
                      },
                      icon: const Icon(Icons.logout),
                    )
                  ],
                ),
              ],
            ),
          ),

          //all notes section
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 40.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.5, horizontal: 5.5),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      'Note  $index',
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
