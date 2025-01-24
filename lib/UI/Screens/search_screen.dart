import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// String key = dotenv.env['geminiApiKey'] ?? '';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  String? prompte;

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  Future<void> generateContent() async {
    final model = await GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: 'apikey');

    final response = model.generateContent([
      Content.text(prompte ?? 'kdjfjdf')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 40,
              ),
              child: TextFormField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    suffixIcon: const Icon(
                      Icons.close,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
