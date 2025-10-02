import 'package:flutter/material.dart';
import 'package:gemini_app/domain/entities/message_ia.dart';

Map<Sender, AlignmentGeometry> typeMessage = {
  Sender.user: Alignment.centerRight,
  Sender.gemini: Alignment.centerLeft,
};

class MessageBubble extends StatelessWidget {
  final String textMessage;
  final Sender fromWho;
  const MessageBubble({
    super.key,
    required this.textMessage,
    required this.fromWho,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Align(
              alignment: typeMessage[fromWho] ?? Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth * 0.7, // nunca más del 50%
                ),
                child: Container(
                  margin: EdgeInsetsGeometry.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: fromWho == Sender.gemini
                        ? colors.secondary
                        : colors.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    textMessage,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
