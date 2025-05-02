import 'package:flutter/material.dart';

class StatusTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<int> counts;

  const StatusTabs(
      {super.key,
      required this.selectedIndex,
      required this.onTap,
      required this.counts});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Nouvelles", "En cours", "Terminées"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;
        return InkWell(
          onTap: () => onTap(index),
          child: Column(
            children: [
              Row(
                children: [
                  Text(tabs[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected ? const Color(0xFF3056D3) : Colors.grey,
                      )),
                  const SizedBox(width: 6),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey.shade200,
                    child: Text(
                      "${counts[index]}",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  )
                ],
              ),
              if (isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  height: 2,
                  width: 50,
                  color: const Color(0xFF3056D3),
                )
            ],
          ),
        );
      }),
    );
  }
}
