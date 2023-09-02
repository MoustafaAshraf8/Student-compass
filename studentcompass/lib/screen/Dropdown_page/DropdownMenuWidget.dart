import 'package:flutter/material.dart';
import 'package:studentcompass/home_page.dart';
import '../../schema/universitySchema/University.dart';

/// Flutter code sample for [DropdownButton].

// class DropdownPage extends StatefulWidget {
//   DropdownPage({super.key});

//   @override
//   State<DropdownPage> createState() => _DropdownPageState();
// }

// class _DropdownPageState extends State<DropdownPage> {
//   List<University> universitylist = [];
//   late Map<String, University> universityMap;

//   void initState() {
//     super.initState();
//     this.getAllUniversity();
//   }

//   void getAllUniversity() async {
//     universitylist = await getUniversity();
//     setState(() {
//       for (var university in universitylist) {
//         universityMap[university.name] = university;
//       }
//     });
//   }

//   void chooseUniversity(String universityName) async {
//     // University university = universityMap[universityName]!;
//     // await updateUniversityUser(university.id);
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => const MyHomePage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Choose your University"),
//           backgroundColor: Theme.of(context).primaryColor),
//       body: Center(
//         child: universitylist.isNotEmpty
//             ? DropdownMenu(
//                 universitylist: universitylist,
//                 chooseUniversity: chooseUniversity)
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//     );
//   }
// }

class DropdownMenuWidget extends StatefulWidget {
  List<University> universitylist;
  Function chooseUniversity;
  DropdownMenuWidget(
      {super.key,
      required this.universitylist,
      required this.chooseUniversity});

  @override
  State<DropdownMenuWidget> createState() => DropdownMenuWidgetState(
      universitylist: universitylist, chooseUniversity: chooseUniversity);
}

class DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  List<University> universitylist = [];
  Function chooseUniversity;
  DropdownMenuWidgetState(
      {required this.universitylist, required this.chooseUniversity});

  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = universitylist[0].name;
  }

  void updateChoice(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dropdownButton = DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items:
          universitylist.map<DropdownMenuItem<String>>((University university) {
        return DropdownMenuItem<String>(
          value: university.name,
          child: Text(university.name),
        );
      }).toList(),
    );

    //var dropdownButton = dropdownButton2;
    return Center(
        child: Column(
      children: [
        dropdownButton,
        ElevatedButton(
            onPressed: () {
              chooseUniversity(dropdownValue);
              //Navigator.push(context,
              //MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text('select')),
      ],
    ));
  }
}
