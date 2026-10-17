import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/theme_provider.dart';
import 'widgets/split_screen_hero.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/education_section.dart';
import 'widgets/portfolio_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RaniyaPortfolioApp());
}

class RaniyaPortfolioApp extends StatefulWidget {
  const RaniyaPortfolioApp({super.key});

  @override
  State<RaniyaPortfolioApp> createState() => _RaniyaPortfolioAppState();
}

class _RaniyaPortfolioAppState extends State<RaniyaPortfolioApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, _) {
        return MaterialApp(
          title: 'Raniya Kazi — Frontend Developer & UI Designer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _themeProvider.themeMode,
          home: PortfolioHomePage(themeProvider: _themeProvider),
        );
      },
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  final ThemeProvider themeProvider;

  const PortfolioHomePage({
    super.key,
    required this.themeProvider,
  });

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(String sectionId) {
    GlobalKey? targetKey;
    switch (sectionId) {
      case 'hero':
        targetKey = _heroKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'education':
        targetKey = _educationKey;
        break;
      case 'portfolio':
        targetKey = _portfolioKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    } else if (sectionId == 'hero') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // 1. Hero Section
            KeyedSubtree(
              key: _heroKey,
              child: SplitScreenHero(
                themeProvider: widget.themeProvider,
                onNavigate: _scrollToSection,
              ),
            ),

            // 2. About Me Section
            KeyedSubtree(
              key: _aboutKey,
              child: AboutSection(
                themeProvider: widget.themeProvider,
                onNavigate: _scrollToSection,
              ),
            ),

            // 3. Technical Skills Section
            KeyedSubtree(
              key: _skillsKey,
              child: SkillsSection(
                themeProvider: widget.themeProvider,
              ),
            ),

            // 4. Academic Background & Education Section
            KeyedSubtree(
              key: _educationKey,
              child: EducationSection(
                themeProvider: widget.themeProvider,
              ),
            ),

            // 5. Featured Portfolio & Works
            KeyedSubtree(
              key: _portfolioKey,
              child: PortfolioSection(
                themeProvider: widget.themeProvider,
              ),
            ),

            // 6. Contact Section
            KeyedSubtree(
              key: _contactKey,
              child: ContactSection(
                themeProvider: widget.themeProvider,
              ),
            ),

            // 7. Footer
            Footer(
              themeProvider: widget.themeProvider,
              onNavigate: _scrollToSection,
            ),
          ],
        ),
      ),
    );
  }
}
