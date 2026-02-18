import 'package:dooit/screens/home/all_screen/all_list.dart';
import 'package:dooit/screens/home/pinned/pinned.dart';
import 'package:dooit/themes/style_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button {
  String text;
  Widget screen;
  Button(this.text, this.screen);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Button> listButton = [
  Button("All List", AllList()),
  Button("Pinned", Pinned()),
];

class _HomeScreenState extends State<HomeScreen> {
  Button selectedButton = listButton[0];
  late Widget selectedScreen;

  @override
  void initState() {
    selectedScreen = selectedButton.screen;
    super.initState();
  }

  void changeSelectedButton(Button btn) {
    setState(() {
      selectedButton = btn;
      selectedScreen = selectedButton.screen;
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
            padding: EdgeInsets.only(top: 20,bottom: 113),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...listButton.map(
                  (bt) => StyleButton(
                    onTap: changeSelectedButton,
                    button: bt,
                    isSelected: bt == selectedButton,
                  ),
                ),
              ],
            ),
          ),
          selectedScreen
        ],
      ),
    );
  }
}
