import 'package:firebase_ai/firebase_ai.dart';

class GeminiService {
  final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: 'gemini-2.5-flash',
  ); // Ajustá según tu cuenta

  /// Envía un prompt de texto a Gemini y devuelve la respuesta
  Future<String> sendMessage(String prompt) async {
    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ?? 'Sin respuesta';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
