import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  String _text = "";
  late final TextEditingController _controller =
      TextEditingController(text: _text);
  late final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SearchBar(
        controller: _controller,
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        hintText: 'هرچیزی را جستجو کنید',
        leading: const Icon(Icons.search),
        focusNode: _focusNode,
        onChanged: (value) {
          _text = value;
        },
      ),
    );
  }
}
