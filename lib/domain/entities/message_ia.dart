enum Sender { user, gemini }

class MessageIA {
  final Sender sender;
  final String text;

  MessageIA({required this.sender, required this.text});
}
