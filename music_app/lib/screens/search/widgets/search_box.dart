import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SearchBox extends StatelessWidget {
//   const SearchBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'heheeh',
//             icon: Icon(Icons.search)
//           ),
//         ),
//         Text('123'),
//       ],
//     );
//   }
// }

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final myController = TextEditingController();
  
  String? searchText;

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      print('new text: ${myController.text}');
    });  
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            searchText = text;
          },
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.search)
          ),
        ),
        Text(">>> $searchText <<<")
      ],
    );
  }
}