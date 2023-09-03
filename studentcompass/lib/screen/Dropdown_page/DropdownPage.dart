import 'package:flutter/material.dart';
import '../../schema/universitySchema/University.dart';
import '../../schema/universitySchema/getUniversity.dart';
import 'DropdownMenuWidget.dart';
import '../../schema/userSchema/updateUniversityUser.dart';
import '../../home_page.dart';

/// Flutter code sample for [DropdownButton].

class DropdownPage extends StatefulWidget {
  DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  List<University> universitylist = [];
  Map<String, University> universityMap = {};
  bool isLoading = false;
  void initState() {
    super.initState();
    getAllUniversity();
  }

  void getAllUniversity() async {
    universitylist = await getUniversity();
    setState(() {
      for (var university in universitylist) {
        universityMap[university.name] = university;
      }
    });
  }

  void chooseUniversity(String universityName) async {
    // University university = universityMap[universityName]!;
    // await updateUniversityUser(university.id);

    bool answer = await updateUniversityUser(
        universityid: universityMap[universityName]!.id);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    print(universityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Choose your University"),
          backgroundColor: Theme.of(context).primaryColor),
      body: Center(
        child: universitylist.isNotEmpty
            ? DropdownMenuWidget(
                universitylist: universitylist,
                chooseUniversity: chooseUniversity)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
