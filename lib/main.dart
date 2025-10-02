import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:gemini_app/config/theme/app_theme.dart';
import 'package:gemini_app/presentation/providers/chat_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemini_app/presentation/screen/chat/chat_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  // Manejo global de errores
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter error: ${details.exception}');
  };

  runApp(const MyApp());
}

Future<void> _initApp() async {
  try {
    final envString = await rootBundle.loadString('assets/.env');
    dotenv.loadFromString(envString: envString);

    late FirebaseOptions firebaseOptions;
    if (kIsWeb) {
      throw UnsupportedError('Web no soportada en esta configuración');
    } else if (Platform.isAndroid) {
      firebaseOptions = FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID']!,
        appId: dotenv.env['FIREBASE_APP_ID_ANDROID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_ANDROID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_ANDROID']!,
      );
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
    await Firebase.initializeApp(options: firebaseOptions);
    debugPrint('Firebase inicializado correctamente');
  } catch (e, st) {
    debugPrint('Error al inicializar Firebase: $e');
    debugPrintStack(stackTrace: st);
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Gemini app',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(
          colorSelect: ColorType.custom,
          modo: ModoType.light,
        ).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
