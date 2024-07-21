import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final Widget Function()? onPressedAction;

  const CustomAppBar({
    required this.title,
    this.icon,
    this.onPressedAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      flexibleSpace: const SizedBox(height: 50),
      actions: icon != null
          ? [
              IconButton(
                icon: icon!,
                onPressed: () {
                  if (onPressedAction != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onPressedAction!(),
                      ),
                    );
                  }
                },
              ),
            ]
          : [], // No actions if icon is null
      backgroundColor: const Color.fromARGB(255, 254, 112, 112),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
