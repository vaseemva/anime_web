import 'package:anime_web/utils/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 600;

    return AppBar(
      backgroundColor: const Color(0xff2b1845),
      toolbarHeight: isWeb ? 80 : null,
      title: const Text(
        'SHOEXPRESS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: <Widget>[
        MediaQuery.of(context).size.width < 600
            ? IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  showPopupMenu(context);
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildNavItem(context, 'Home'),
                  _buildNavItem(context, 'Shop'),
                  _buildNavItem(context, 'Order'),
                  _buildNavItem(context, 'Contact'),
                  _buildNavItem(context, 'Login'),
                  SizedBox(
                    width: 13.w(context),
                  )
                ],
              ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w(context)),
      child: TextButton(
        onPressed: () {
          // Handle navigation here
        },
        child: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16 ),
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context) async {
    await showMenu( 
      context: context,
      position: const RelativeRect.fromLTRB(
          1000, 50, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              // Handle navigation for Home option
            },
            child: const Text('Home'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              // Handle navigation for Shop option
            },
            child: const Text('Shop'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              // Handle navigation for Settings option
            },
            child: const Text('Order'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              // Handle navigation for Settings option
            },
            child: const Text('Contact'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              // Handle navigation for Settings option
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );

    // Handle the result from the menu if needed
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
