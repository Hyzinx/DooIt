import 'package:dooit/models/task.dart';
import 'package:dooit/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllList extends StatefulWidget {
  const AllList({super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  late List<Task> tasks;
  final Task task = Task.instance;
  Future<void> _loadDate() async {
    setState(() async {
      tasks = await task.getListTask();
    });
    print(tasks);
  }

  @override
  void initState() {
    _loadDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (tasks.isEmpty)
        ? Column(
            children: [
              Image.asset("assets/img/listTodo.png"),
              SizedBox(height: 89),
              Text(
                "Create your first to-do list...",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                  foregroundColor: AppColor.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 26),
                    SizedBox(width: 8),
                    Text(
                      "New List",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Text("welcom");
  }
}
