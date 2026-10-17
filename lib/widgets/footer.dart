import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_provider.dart';

class Footer extends StatelessWidget {
  final ThemeProvider themeProvider;
  final Function(String sectionId) onNavigate;

  const Footer({
    super.key,
    required this.themeProvider,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDark(context);
    final bgColor = isDark ? const Color(0xFF000000) : const Color(0xFFF1F3F5);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);
    final mutedColor = isDark ? Colors.white38 : const Color(0xFF94A3B8);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              Text(
                '© ${DateTime.now().year} Raniya Kazi. Engineered with Flutter Web & Dart.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.5,
                  color: mutedColor,
                ),
              ),
              _GlassBackToTopButton(
                isDark: isDark,
                onTap: () => onNavigate('hero'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassBackToTopButton extends StatefulWidget {
  final bool isDark;
  final VoidCallback onTap;

  const _GlassBackToTopButton({
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_GlassBackToTopButton> createState() => _GlassBackToTopButtonState();
}

class _GlassBackToTopButtonState extends State<_GlassBackToTopButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isDark
        ? (_isHovered ? Colors.white : Colors.white70)
        : (_isHovered ? Colors.black : const Color(0xFF334155));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.isDark
                      ? Colors.white.withValues(alpha: 0.16)
                      : Colors.black.withValues(alpha: 0.10),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.isDark
                      ? (_isHovered ? Colors.white.withValues(alpha: 0.16) : Colors.white.withValues(alpha: 0.08))
                      : (_isHovered ? Colors.black.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.04)),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.isDark
                        ? Colors.white.withValues(alpha: _isHovered ? 0.35 : 0.15)
                        : Colors.black.withValues(alpha: _isHovered ? 0.20 : 0.08),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BACK TO TOP',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.arrow_upward_rounded,
                      size: 14,
                      color: textColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
