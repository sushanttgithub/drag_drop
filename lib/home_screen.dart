import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  IconData getItemIcon(String item) {
    switch (item) {
      case '1':
        return Icons.person;
      case '2':
        return Icons.chat;
      case '3':
        return Icons.phone;
      case '4':
        return Icons.camera;
      case '5':
        return Icons.photo;
      default:
        return Icons.help; // Default icon if no match
    }
  }

  Color getItemColor(String item) {
    switch (item) {
      case '1':
        return Colors.orange;
      case '2':
        return Colors.blue;
      case '3':
        return Colors.purple;
      case '4':
        return Colors.yellowAccent;
      case '5':
        return Colors.green;
      default:
        return Colors.grey; // Default color if no match
    }
  }
  final items=['1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
                ),
                 child: ReorderableListView(
                   scrollDirection: Axis.horizontal, // Make the list horizontal
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      final item = items.removeAt(oldIndex);
                      items.insert(newIndex, item);
                    });
                  },
                  children: [
                    for (final item in items)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        key: ValueKey(item),
                        child: Container(
                           decoration: BoxDecoration(
                            color: getItemColor(item), // Set background color for each item
                            borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
                          ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Icon(
                              getItemIcon(item),
                              color: Colors.white,
                              size: 30.0, // Adjust the size as needed
                                                     ),
                           ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
