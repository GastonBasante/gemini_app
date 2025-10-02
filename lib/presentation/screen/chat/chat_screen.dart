import 'package:flutter/material.dart';
import 'package:gemini_app/presentation/widgets/shared/typing_indicator.dart';
import 'package:provider/provider.dart';

import 'package:gemini_app/presentation/providers/chat_provider.dart';
import 'package:gemini_app/presentation/widgets/chat/message_bubble.dart';
import 'package:gemini_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://wpforms.com/wp-content/uploads/cache/integrations/d67e60f7e97defa9220c65c68eb36eb2.png',
            ),
          ),
        ),
        title: const Text('Gemini'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return MessageBubble(
                    textMessage: message.text,
                    fromWho: message.sender,
                  );
                },
              ),
            ),
          ),
          if (chatProvider.isTyping)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TypingIndicator(),
            ),
          //caja de texto
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: MessageFieldBox(onValue: chatProvider.sendMessage),
          ),
        ],
      ),
    );
  }
}
