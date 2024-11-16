import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:portfolio/Utils/scroll_manager.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/Providers/theme_provider.dart';
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
  String currentSection = 'Home';

  @override
  void initState() {
    super.initState();
    ScrollManager.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    ScrollManager.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

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
    final bool isDarkMode = themeProvider.isDarkMode;

    final Color backgroundColor = isDarkMode ? Colors.black : Theme.of(context).appBarTheme.backgroundColor ?? AppColors.lightmode;
    final Color textColor = isDarkMode ? AppColors.lightmode : AppColors.darkmode;

    return SafeArea(
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 60.h,
          width: double.infinity,
          color: backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    children: [
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
                      Row(
                        children: [
                          _buildNavItem('Home', () => ScrollManager.scrollToSection(widget.homeKey), isDarkMode),
                          _buildNavItem('About', () => ScrollManager.scrollToSection(widget.aboutKey), isDarkMode),
                          _buildNavItem('Projects', () => ScrollManager.scrollToSection(widget.projectsKey), isDarkMode),
                          _buildNavItem('Services', () => ScrollManager.scrollToSection(widget.servicesKey), isDarkMode),
                          _buildNavItem('Resume', () => ScrollManager.scrollToSection(widget.resumeKey), isDarkMode),
                          SizedBox(width: 20.w),
                          ElevatedButton(
                            onPressed: () async {
                              const url = 'https://linktr.ee/shizzle_';
                              if (await canLaunchUrlString(url)) {
                                await launchUrlString(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: textColor,
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(color: AppColors.containerBord),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          themeProvider.toggleTheme(!isDarkMode);
                        },
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Murewa',
                            style: GoogleFonts.rubik(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const  Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _showDropdownMenu(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          themeProvider.toggleTheme(!isDarkMode);
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(200, 50, 0, 0),
      items: [
        PopupMenuItem(
          child: _buildNavItem('Home', () => ScrollManager.scrollToSection(widget.homeKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
        PopupMenuItem(
          child: _buildNavItem('About', () => ScrollManager.scrollToSection(widget.aboutKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
        PopupMenuItem(
          child: _buildNavItem('Projects', () => ScrollManager.scrollToSection(widget.projectsKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
        PopupMenuItem(
          child: _buildNavItem('Services', () => ScrollManager.scrollToSection(widget.servicesKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
        PopupMenuItem(
          child: _buildNavItem('Resume', () => ScrollManager.scrollToSection(widget.resumeKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
        PopupMenuItem(
          child: _buildNavItem('Contact', () => ScrollManager.scrollToSection(widget.contactKey), Provider.of<ThemeProvider>(context).isDarkMode),
        ),
      ],
      elevation: 8.0,
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap, bool isDarkMode) {
    Color tileColor = currentSection == title
        ? (isDarkMode ? AppColors.lightmode : AppColors.darkmode)
        : (isDarkMode ? AppColors.lightmode : AppColors.darkmode);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
