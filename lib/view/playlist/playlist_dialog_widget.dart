import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaylistDialogWidget extends ConsumerStatefulWidget {
  const PlaylistDialogWidget({super.key});

  @override
  PlaylistDialogWidgetState createState() => PlaylistDialogWidgetState();
}

class PlaylistDialogWidgetState extends ConsumerState<PlaylistDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Basic dialog title'),
      content: const Text(
        'A dialog is a type of modal window that appears in front of app content to\n'
        'provide critical information, or prompt\n'
        'for a decision to be made.',
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Disable'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Enable'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
