import 'package:flutter/material.dart';

/**
 * AppBar personnalisable et réutilisable.
 * - `title` : texte du titre.
 * - `subtitle` : texte optionnel en dessous du titre.
 * - `centerTitle` : centre le titre si true.
 * - `leadingIcon` : icône à gauche.
 * - `onLeadingPressed` : action du bouton gauche.
 * - `actionIcon` : icône à droite.
 * - `onActionPressed` : action du bouton droit.
 * - `actionIconSize` : taille personnalisée de l'icône d'action.
 * - `backgroundColor` : couleur de fond.
 * - `textColor` : couleur du texte et des icônes.
 */

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool centerTitle;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final IconData? actionIcon;
  final double actionIconSize;
  final VoidCallback? onActionPressed;
  final Color backgroundColor;
  final Color textColor;

  const MyAppBar({
    super.key,
    this.title = '',
    this.subtitle,
    this.centerTitle = true,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actionIcon,
    this.actionIconSize = 24.0,
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
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon, color: textColor),
              onPressed: onLeadingPressed,
            )
          : null,
      title: Column(
        crossAxisAlignment:
            centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
        ],
      ),
      centerTitle: centerTitle,
      actions: actionIcon != null
          ? [
              IconButton(
                icon: Icon(actionIcon, size: actionIconSize, color: textColor),
                onPressed: onActionPressed,
              )
            ]
          : [],
    );
  }
}
