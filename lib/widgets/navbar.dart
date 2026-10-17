import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_provider.dart';

class Navbar extends StatefulWidget {
  final ThemeProvider themeProvider;
  final Function(String sectionId) onNavigate;
  final Animation<double>? animation;

  const Navbar({
    super.key,
    required this.themeProvider,
    required this.onNavigate,
    this.animation,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _mobileMenuOpen = false;

  final List<Map<String, String>> navItems = const [
    {"label": "About me", "id": "about"},
    {"label": "Skills", "id": "skills"},
    {"label": "Education", "id": "education"},
    {"label": "Portfolio", "id": "portfolio"},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeProvider.isDark(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 960;

    Widget navContent = Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // On desktop, the left is transparent/empty because the left panel has the logo
          // On mobile, show logo or brand title
          if (!isDesktop)
            GestureDetector(
              onTap: () => widget.onNavigate('hero'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      'RK',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            const SizedBox.shrink(),

          // Desktop right-aligned navigation items in a floating Glass Theme Flexbox
          if (isDesktop)
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.22),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...navItems.map((item) => _NavTextLink(
                            label: item['label']!,
                            onTap: () => widget.onNavigate(item['id']!),
                          )),
                      const SizedBox(width: 8),
                      _ThemeSelector(
                        themeProvider: widget.themeProvider,
                      ),
                      const SizedBox(width: 14),
                      _ContactPillButton(
                        onTap: () => widget.onNavigate('contact'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ThemeSelector(
                  themeProvider: widget.themeProvider,
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 1.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          _mobileMenuOpen ? Icons.close_rounded : Icons.menu_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() => _mobileMenuOpen = !_mobileMenuOpen);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );

    if (widget.animation != null) {
      navContent = FadeTransition(
        opacity: widget.animation!,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.4),
            end: Offset.zero,
          ).animate(widget.animation!),
          child: navContent,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        navContent,
        if (_mobileMenuOpen && !isDesktop)
          _buildMobileMenu(context, isDark),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context, bool isDark) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          color: Colors.black.withValues(alpha: 0.88),
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...navItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() => _mobileMenuOpen = false);
                      widget.onNavigate(item['id']!);
                    },
                    child: Text(
                      item['label']!,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.95),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ContactPillButton(
                onTap: () {
                  setState(() => _mobileMenuOpen = false);
                  widget.onNavigate('contact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTextLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavTextLink({
    required this.label,
    required this.onTap,
  });

  @override
  State<_NavTextLink> createState() => _NavTextLinkState();
}

class _NavTextLinkState extends State<_NavTextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.5,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  // Always crisp high-contrast white with subtle glow, visible in ALL themes!
                  color: _isHovered
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.92),
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 1.5,
                width: _isHovered ? 24 : 0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactPillButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ContactPillButton({
    required this.onTap,
  });

  @override
  State<_ContactPillButton> createState() => _ContactPillButtonState();
}

class _ContactPillButtonState extends State<_ContactPillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..scale(_isHovered ? 1.05 : 1.0)
                ..translate(0.0, _isHovered ? -1.0 : 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _isHovered
                      ? [
                          Colors.white.withValues(alpha: 0.32),
                          Colors.white.withValues(alpha: 0.18),
                        ]
                      : [
                          Colors.white.withValues(alpha: 0.20),
                          Colors.white.withValues(alpha: 0.10),
                        ],
                ),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: _isHovered
                      ? Colors.white.withValues(alpha: 0.85)
                      : Colors.white.withValues(alpha: 0.40),
                  width: 1.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? Colors.white.withValues(alpha: 0.30)
                        : Colors.black.withValues(alpha: 0.25),
                    blurRadius: _isHovered ? 20 : 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'CONTACT ME',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.9,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  final ThemeProvider themeProvider;

  const _ThemeSelector({
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final mode = themeProvider.themeMode;

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.20),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _themeOption(
                icon: Icons.light_mode_rounded,
                tooltip: 'Light Theme',
                isSelected: mode == ThemeMode.light,
                onTap: () => themeProvider.setThemeMode(ThemeMode.light),
              ),
              const SizedBox(width: 2),
              _themeOption(
                icon: Icons.dark_mode_rounded,
                tooltip: 'Dark Theme',
                isSelected: mode == ThemeMode.dark,
                onTap: () => themeProvider.setThemeMode(ThemeMode.dark),
              ),
              const SizedBox(width: 2),
              _themeOption(
                icon: Icons.brightness_auto_rounded,
                tooltip: 'System Default',
                isSelected: mode == ThemeMode.system,
                onTap: () => themeProvider.setThemeMode(ThemeMode.system),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeOption({
    required IconData icon,
    required String tooltip,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? Colors.white.withValues(alpha: 0.28)
                : Colors.transparent,
            border: isSelected
                ? Border.all(
                    color: Colors.white.withValues(alpha: 0.45),
                    width: 1.0,
                  )
                : null,
          ),
          child: Icon(
            icon,
            size: 15,
            color: isSelected
                ? Colors.white
                : Colors.white.withValues(alpha: 0.65),
          ),
        ),
      ),
    );
  }
}
