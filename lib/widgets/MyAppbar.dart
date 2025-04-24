import 'package:flutter/material.dart';

/** 
 * AppBar personnalisable et réutilisable. 
`title` : texte du titre.
`centerTitle` : centre le titre si true.
`leadingIcon` : icône à gauche (ex: menu).
`onLeadingPressed` : action à gauche.
`actionIcon` : icône à droite (ex: profil).
`onActionPressed` : action à droite.
`backgroundColor` : couleur de fond.
`textColor` : couleur du texte et des icônes.
*/

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final Color backgroundColor;
  final Color textColor;

  const MyAppBar({
    super.key,
    this.title = '',
    this.centerTitle = true,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actionIcon,
    this.onActionPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon, color: textColor),
              onPressed: onLeadingPressed,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: centerTitle,
      actions: actionIcon != null
          ? [
              IconButton(
                icon: Icon(actionIcon, color: textColor),
                onPressed: onActionPressed,
              )
            ]
          : [],
    );
  }
}
