import 'package:flutter/material.dart';
import 'package:gemini_app/config/service/gemini_service.dart';
import 'package:gemini_app/domain/entities/message_ia.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final gemini = GeminiService();
  final List<MessageIA> _messageList = [];
  List<MessageIA> get messageList => _messageList;
  bool isTyping = false;
  void _updateUI() {
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String prompt) async {
    isTyping = true;
    _updateUI();

    try {
      final geminiMessage = await gemini.sendMessage(prompt);
      messageList.add(MessageIA(sender: Sender.gemini, text: geminiMessage));
    } finally {
      isTyping = false;
      _updateUI();
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty) {
      messageList.add(MessageIA(sender: Sender.user, text: text));
      herReply(text);
    }
    _updateUI();
  }

  void moveScrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }
}
