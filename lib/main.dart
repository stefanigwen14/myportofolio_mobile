import 'package:flutter/material.dart' hide TextTheme;
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiProvider wraps the app and injects a collection of Provider objects.
    // We usually use Provider object to pass one or more frequently reused objects such as API client or authentication state to the widgets in the tree.
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            primary: const Color(0xFFDDBEBE),
            seedColor: const Color(0xFFFFF5EA),
            secondary: const Color(0xFF574C45),
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
