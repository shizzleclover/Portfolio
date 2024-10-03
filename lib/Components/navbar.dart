import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:portfolio/Utils/scroll_manager.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Navbar extends StatefulWidget {
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;
  final GlobalKey servicesKey;
  final GlobalKey contactKey;
  final GlobalKey resumeKey;

  const Navbar({
    required this.homeKey,
    required this.aboutKey,
    required this.projectsKey,
    required this.servicesKey,
    required this.contactKey,
    required this.resumeKey,
  });

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // Track the current active section
  String currentSection = 'Home';

  @override
  void initState() {
    super.initState();

    // Scroll listener to detect section changes
    ScrollManager.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    ScrollManager.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  // Update current section based on scroll position
  void _scrollListener() {
    final double offset = ScrollManager.scrollController.offset;
    if (offset < widget.aboutKey.currentContext!.size!.height) {
      _updateCurrentSection('Home');
    } else if (offset < widget.projectsKey.currentContext!.size!.height) {
      _updateCurrentSection('About');
    } else if (offset < widget.servicesKey.currentContext!.size!.height) {
      _updateCurrentSection('Projects');
    } else if (offset < widget.contactKey.currentContext!.size!.height) {
      _updateCurrentSection('Services');
    } else if (offset < widget.resumeKey.currentContext!.size!.height) {
      _updateCurrentSection('Resume');
    } else {
      _updateCurrentSection('Contact');
    }
  }

  void _updateCurrentSection(String section) {
    if (currentSection != section) {
      setState(() {
        currentSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final Color backgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? AppColors.darkmode;
    final Color textColor = themeProvider.isDarkMode
        ? AppColors.lightmode
        : AppColors.darkmode;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      color: backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Desktop view: Show full navbar
            return Row(
              children: [
                // Left side: Name
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Murewa',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
                // Right side: Page links
                Row(
                  children: [
                    _buildNavItem('Home', () => ScrollManager.scrollToSection(widget.homeKey)),
                    _buildNavItem('About', () => ScrollManager.scrollToSection(widget.aboutKey)),
                    _buildNavItem('Projects', () => ScrollManager.scrollToSection(widget.projectsKey)),
                    _buildNavItem('Services', () => ScrollManager.scrollToSection(widget.servicesKey)),
                    _buildNavItem('Resume', () => ScrollManager.scrollToSection(widget.resumeKey)),
                    SizedBox(width: 20.w),
                    GestureDetector(
  onTap: () async {
    const url = 'https://linktr.ee/shizzle_';  // Replace with your actual Linktree URL
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  },
  child: Container(
    height: 30.h,
    width: 50.w,
    decoration: BoxDecoration(
        // You can add a background color if needed
      border: Border.all(color: AppColors.containerBord),
      borderRadius: BorderRadius.circular(12),  // Add border radius here
    ),
    child: Center(
      child: Text(
        "Contact Me",
        style: GoogleFonts.montserrat(
          color: textColor,
        ),
      ),
    ),
  ),
),
                  ],
                ),
                // Theme switch icon
                IconButton(
                  icon: Icon(
                    themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme(!themeProvider.isDarkMode);
                  },
                ),
              ],
            );
          } else {
            // Mobile view: Show name and hamburger icon
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: Name
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Murewa',
                      style: GoogleFonts.rubik(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Right side: Hamburger icon
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _showDropdownMenu(context);
                  },
                ),
                // Theme switch icon
                IconButton(
                  icon: Icon(
                    themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme(!themeProvider.isDarkMode);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Mobile dropdown menu function that shows a dropdown under the hamburger icon
  void _showDropdownMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(200, 50, 0, 0), // Position the menu
      items: [
        PopupMenuItem(
          child: _buildNavItem('Home', () => ScrollManager.scrollToSection(widget.homeKey)),
        ),
        PopupMenuItem(
          child: _buildNavItem('About', () => ScrollManager.scrollToSection(widget.aboutKey)),
        ),
        PopupMenuItem(
          child: _buildNavItem('Projects', () => ScrollManager.scrollToSection(widget.projectsKey)),
        ),
        PopupMenuItem(
          child: _buildNavItem('Services', () => ScrollManager.scrollToSection(widget.servicesKey)),
        ),
        PopupMenuItem(
          child: _buildNavItem('Resume', () => ScrollManager.scrollToSection(widget.resumeKey)),
        ),
        PopupMenuItem(
          child: _buildNavItem('Contact', () => ScrollManager.scrollToSection(widget.contactKey)),
        ),
      ],
      elevation: 8.0,
    );
  }

  // Common method to build navigation items with color change
  Widget _buildNavItem(String title, VoidCallback onTap) {
    Color tileColor = currentSection == title ? AppColors.lightmode : AppColors.darkmode;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            color: tileColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
