import 'package:dooit/themes/style_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button {
  String text;
  bool isActive;
  Button(this.text, this.isActive);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Button> listButton = [Button("Pinned", false), Button("All List", true)];

class _HomeScreenState extends State<HomeScreen> {
  Button selectedButton = listButton[0];
  void changeSelectedButton() {
    setState(() {
      for (Button bt in listButton) {
        bt.isActive=!bt.isActive;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset("assets/img/dooit_icon.png", width: 50),
                Text(
                  "Dooit",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 40),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...listButton.map(
                  (bt) => StyleButton(
                    text: bt.text,
                    onTap: changeSelectedButton,
                    isSelected: bt.isActive,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
