import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final textController = TextEditingController();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15),
    );
    final inputDecoration = InputDecoration(
      hintText: 'Chatea con Gemini',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isNotEmpty) {
            onValue(textValue);
            textController.clear();
          }
          focusNode.requestFocus();
        },
        icon: Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      textAlignVertical: TextAlignVertical.center,
      decoration: inputDecoration,
      onFieldSubmitted: (textValueSubmitted) {
        if (textValueSubmitted.isNotEmpty) {
          textController.clear();
          onValue(textValueSubmitted);
        }
        focusNode.requestFocus();
      },
    );
  }
}
