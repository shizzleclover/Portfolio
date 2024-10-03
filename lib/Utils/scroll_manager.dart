import 'package:flutter/material.dart';

class ScrollManager {
  static final ScrollController scrollController = ScrollController();

  static void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if(context != null) {
      Scrollable.ensureVisible(context,
      duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }
}