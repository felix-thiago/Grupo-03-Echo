import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final index = items.indexOf(item);
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.iconData,
                    color: isSelected
                        ? Colors.blue
                        : Color.fromARGB(255, 44, 44, 44),
                  ),
                  SizedBox(
                      height:
                          4.0), // Ajuste o espaçamento vertical entre o ícone e o rótulo
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: isSelected
                          ? Colors.blue
                          : Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData iconData;
  final String label;

  CustomBottomNavigationBarItem({required this.iconData, required this.label});
}
