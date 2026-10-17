import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';
import 'logo_widget.dart';
import 'navbar.dart';
import 'social_button.dart';

class SplitScreenHero extends StatefulWidget {
  final ThemeProvider themeProvider;
  final Function(String sectionId) onNavigate;

  const SplitScreenHero({
    super.key,
    required this.themeProvider,
    required this.onNavigate,
  });

  @override
  State<SplitScreenHero> createState() => _SplitScreenHeroState();
}

class _SplitScreenHeroState extends State<SplitScreenHero>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Staged entrance animations
  late Animation<Offset> _leftPanelSlide;
  late Animation<Offset> _rightPanelSlide;
  late Animation<double> _portraitOpacity;
  late Animation<Offset> _portraitSlide;
  late Animation<double> _greetingOpacity;
  late Animation<Offset> _greetingSlide;
  late Animation<double> _nameOpacity;
  late Animation<Offset> _nameSlide;
  late Animation<double> _roleOpacity;
  late Animation<Offset> _roleSlide;
  late Animation<double> _socialOpacity;
  late Animation<Offset> _socialSlide;
  late Animation<double> _navOpacity;

  bool _showReplayButton = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) setState(() => _showReplayButton = true);
      }
    });
  }

  void _setupAnimations() {
    // 2.2 second luxury entrance timeline
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    const luxuryCurve = Cubic(0.16, 1.0, 0.3, 1.0);

    // Stage 2: Dual panels slide inward from opposite sides [0.0 - 0.65] (approx 1.4s)
    _leftPanelSlide = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.65, curve: luxuryCurve),
      ),
    );

    _rightPanelSlide = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.65, curve: luxuryCurve),
      ),
    );

    // Stage 3: Portrait reveal [0.42 - 0.82]
    _portraitOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.42, 0.82, curve: Curves.easeOut),
      ),
    );
    _portraitSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.42, 0.82, curve: luxuryCurve),
      ),
    );

    // Stage 4: Typography sequential reveal
    // "Hi, I am" [0.52 - 0.78]
    _greetingOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.52, 0.78, curve: Curves.easeOut),
      ),
    );
    _greetingSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.52, 0.78, curve: luxuryCurve),
      ),
    );

    // "Raniya Kazi" [0.60 - 0.88]
    _nameOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.60, 0.88, curve: Curves.easeOut),
      ),
    );
    _nameSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.30),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.60, 0.88, curve: luxuryCurve),
      ),
    );

    // Subtitle [0.70 - 0.94]
    _roleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.70, 0.94, curve: Curves.easeOut),
      ),
    );
    _roleSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.70, 0.94, curve: luxuryCurve),
      ),
    );

    // Stage 5: Navigation & Social Links [0.75 - 1.0]
    _socialOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );
    _socialSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: luxuryCurve),
      ),
    );

    _navOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.68, 0.95, curve: Curves.easeOut),
      ),
    );
  }

  void _replayAnimation() {
    setState(() => _showReplayButton = false);
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height.clamp(680.0, 1100.0);
    final isDesktop = width >= 1024;
    final isTablet = width >= 768 && width < 1024;
    final isMobile = width < 768;
    final isDark = widget.themeProvider.isDark(context);

    // In dark theme: Left concrete gray (#D7D8D6), Right pure black (#000000).
    // In light theme: Left soft neutral gray (#E4E5E3), Right deep charcoal (#18181B)
    // preserving the reference's iconic split-screen contrast in all themes.
    final leftBgColor = isDark ? const Color(0xFFD7D8D6) : const Color(0xFFE2E4E1);
    final rightBgColor = isDark ? const Color(0xFF000000) : const Color(0xFF141517);

    return Container(
      width: width,
      height: height,
      color: Colors.black,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // ==========================================================
          // 1. RIGHT / BOTTOM BLACK PANEL (Slides inward from right)
          // ==========================================================
          Positioned.fill(
            child: SlideTransition(
              position: isMobile
                  ? Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.0, 0.65, curve: Cubic(0.16, 1.0, 0.3, 1.0)),
                      ),
                    )
                  : _rightPanelSlide,
              child: Container(
                color: rightBgColor,
                child: Stack(
                  children: [
                    // Subtle atmospheric ambient glow in upper right
                    Positioned(
                      top: 0,
                      right: 0,
                      width: width * 0.45,
                      height: height * 0.45,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.topRight,
                            radius: 1.2,
                            colors: [
                              Colors.white.withOpacity(0.04),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Stage 3: Portrait Cutout Reveal (Anchored to bottom edge)
                    Positioned(
                      right: isDesktop
                          ? width * 0.05
                          : (isTablet ? width * 0.03 : 0),
                      bottom: 0,
                      width: isDesktop
                          ? width * 0.44
                          : (isTablet ? width * 0.50 : width * 0.85),
                      height: isMobile ? height * 0.52 : height * 0.84,
                      child: SlideTransition(
                        position: _portraitSlide,
                        child: FadeTransition(
                          opacity: _portraitOpacity,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              portfolioData.portraitAsset,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomCenter,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildPortraitFallback(isDesktop);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ==========================================================
          // 2. LEFT / TOP LIGHT-GRAY PANEL (Slides inward from left)
          // Clipped along the reference diagonal
          // ==========================================================
          Positioned.fill(
            child: SlideTransition(
              position: isMobile
                  ? Tween<Offset>(
                      begin: const Offset(0.0, -1.0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.0, 0.65, curve: Cubic(0.16, 1.0, 0.3, 1.0)),
                      ),
                    )
                  : _leftPanelSlide,
              child: ClipPath(
                clipper: _DiagonalSplitClipper(
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
                child: Container(
                  color: leftBgColor,
                  child: Stack(
                    children: [
                      // Inner padding container for Left Panel Content
                      Padding(
                        padding: EdgeInsets.only(
                          left: isDesktop ? 64 : (isTablet ? 40 : 24),
                          top: isDesktop ? 36 : (isTablet ? 28 : 20),
                          bottom: isDesktop ? 48 : (isTablet ? 36 : 24),
                          right: isDesktop ? 40 : 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Top: Monogram Logo
                            LogoWidget(
                              size: isDesktop ? 48 : 40,
                              color: Colors.black,
                            ),

                            // Middle: Typography
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isDesktop ? 540 : (isTablet ? 420 : 320),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Greeting: "Hi, I am"
                                  SlideTransition(
                                    position: _greetingSlide,
                                    child: FadeTransition(
                                      opacity: _greetingOpacity,
                                      child: Text(
                                        portfolioData.greeting,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: isDesktop ? 22 : 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),

                                  // Name: "Raniya Kazi"
                                  SlideTransition(
                                    position: _nameSlide,
                                    child: FadeTransition(
                                      opacity: _nameOpacity,
                                      child: Text(
                                        portfolioData.name,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: isDesktop
                                              ? 66
                                              : (isTablet ? 50 : 36),
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                          letterSpacing: -2.2,
                                          height: 1.04,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  // Subtitle / Role
                                  SlideTransition(
                                    position: _roleSlide,
                                    child: FadeTransition(
                                      opacity: _roleOpacity,
                                      child: Text(
                                        portfolioData.role,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: isDesktop ? 18 : 14.5,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF636563),
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Bottom-Left: 3 Tactile Social Buttons
                            SlideTransition(
                              position: _socialSlide,
                              child: FadeTransition(
                                opacity: _socialOpacity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SocialButton(
                                      url: portfolioData.socialLinks.email,
                                      type: SocialType.email,
                                      tooltip: 'Email Raniya',
                                      size: isDesktop ? 48 : 42,
                                    ),
                                    const SizedBox(width: 14),
                                    SocialButton(
                                      url: portfolioData.socialLinks.github,
                                      type: SocialType.github,
                                      tooltip: 'GitHub Profile',
                                      size: isDesktop ? 48 : 42,
                                    ),
                                    const SizedBox(width: 14),
                                    SocialButton(
                                      url: portfolioData.socialLinks.linkedin,
                                      type: SocialType.linkedin,
                                      tooltip: 'LinkedIn Profile',
                                      size: isDesktop ? 48 : 42,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ==========================================================
          // 3. TOP NAVIGATION (Layered cleanly across the hero)
          // ==========================================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              themeProvider: widget.themeProvider,
              onNavigate: widget.onNavigate,
              animation: _navOpacity,
            ),
          ),

          // ==========================================================
          // 4. FLOATING REPLAY BUTTON (Discreet bottom-right control)
          // ==========================================================
          if (_showReplayButton)
            Positioned(
              bottom: 24,
              right: 24,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showReplayButton ? 1.0 : 0.0,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _replayAnimation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withValues(alpha: 0.18),
                                Colors.white.withValues(alpha: 0.06),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.35),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.replay_rounded, size: 15, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Replay Entrance',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPortraitFallback(bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.12),
            Colors.white.withOpacity(0.02),
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(200)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_rounded,
              size: isDesktop ? 120 : 80,
              color: Colors.white30,
            ),
            const SizedBox(height: 8),
            Text(
              'Raniya Kazi',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white54,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom Clipper for the Diagonal Split:
/// Desktop: 50.5% top width -> 41.5% bottom width
/// Tablet:  58% top width   -> 48% bottom width
/// Mobile:  Angled top half
class _DiagonalSplitClipper extends CustomClipper<Path> {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  _DiagonalSplitClipper({
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    if (isMobile) {
      // Top angled panel for mobile
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.48);
      path.lineTo(0, size.height * 0.55);
      path.close();
    } else {
      // Desktop / Tablet vertical diagonal split
      final topSplit = isDesktop ? size.width * 0.505 : size.width * 0.58;
      final bottomSplit = isDesktop ? size.width * 0.415 : size.width * 0.48;

      path.moveTo(0, 0);
      path.lineTo(topSplit, 0);
      path.lineTo(bottomSplit, size.height);
      path.lineTo(0, size.height);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(covariant _DiagonalSplitClipper oldClipper) =>
      oldClipper.isDesktop != isDesktop ||
      oldClipper.isTablet != isTablet ||
      oldClipper.isMobile != isMobile;
}
