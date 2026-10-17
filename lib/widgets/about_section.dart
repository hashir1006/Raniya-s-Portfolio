import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';

class AboutSection extends StatelessWidget {
  final ThemeProvider themeProvider;
  final Function(String sectionId) onNavigate;

  const AboutSection({
    super.key,
    required this.themeProvider,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDark(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    final highlights = [
      {
        'icon': Icons.palette_outlined,
        'title': 'Design Sensibility',
        'desc': 'Pixel-level precision, thoughtful visual hierarchy, and refined editorial typography.',
      },
      {
        'icon': Icons.code_rounded,
        'title': 'Frontend Engineering',
        'desc': 'Robust Flutter Web & React architectures with clean Dart, TypeScript, and modern CSS.',
      },
      {
        'icon': Icons.auto_awesome_outlined,
        'title': 'Motion & Interaction',
        'desc': 'Fluid physics, kinetic choreography, and purposeful micro-interactions.',
      },
      {
        'icon': Icons.terminal_rounded,
        'title': 'Modern Tooling',
        'desc': 'Scalable component libraries, design tokens, CI/CD, and web performance optimization.',
      },
    ];

    final bgColor = isDark ? const Color(0xFF0A0A0A) : const Color(0xFFFFFFFF);
    final cardBgColor = isDark ? const Color(0xFF141416) : const Color(0xFFF8F9FA);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subtextColor = isDark ? Colors.white70 : const Color(0xFF475569);
    final mutedColor = isDark ? Colors.white38 : const Color(0xFF94A3B8);

    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 120 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT ME',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: mutedColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Designing with purpose,\ncoding with precision.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: isDesktop ? 44 : 30,
                          fontWeight: FontWeight.w900,
                          color: textColor,
                          height: 1.15,
                          letterSpacing: -1.2,
                        ),
                      ),
                    ],
                  ),
                  if (isDesktop)
                    SizedBox(
                      width: 320,
                      child: Text(
                        'Bridging the gap between conceptual UI/UX design and production-grade frontend engineering.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          color: subtextColor,
                          height: 1.6,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: borderColor, height: 1),
              const SizedBox(height: 48),

              // Content Layout (Bio + Highlights)
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bio column (7/12)
                    Expanded(
                      flex: 7,
                      child: _buildBioColumn(context, textColor, subtextColor, isDark),
                    ),
                    const SizedBox(width: 48),
                    // Highlights grid (5/12)
                    Expanded(
                      flex: 5,
                      child: _buildHighlights(highlights, cardBgColor, borderColor, textColor, subtextColor),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBioColumn(context, textColor, subtextColor, isDark),
                    const SizedBox(height: 48),
                    _buildHighlights(highlights, cardBgColor, borderColor, textColor, subtextColor),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBioColumn(
    BuildContext context,
    Color textColor,
    Color subtextColor,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...portfolioData.bio.map(
          (para) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              para,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: subtextColor,
                height: 1.75,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            _GlassThemeButton(
              label: 'GET IN TOUCH',
              icon: Icons.arrow_outward_rounded,
              isPrimary: true,
              isDark: isDark,
              onTap: () => onNavigate('contact'),
            ),
            _GlassThemeButton(
              label: 'VIEW EDUCATION & BACKGROUND',
              icon: Icons.school_outlined,
              isPrimary: false,
              isDark: isDark,
              onTap: () => onNavigate('education'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlights(
    List<Map<String, dynamic>> highlights,
    Color cardBgColor,
    Color borderColor,
    Color textColor,
    Color subtextColor,
  ) {
    return Column(
      children: highlights.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  size: 20,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] as String,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['desc'] as String,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: subtextColor,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _GlassThemeButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool isDark;
  final VoidCallback onTap;

  const _GlassThemeButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_GlassThemeButton> createState() => _GlassThemeButtonState();
}

class _GlassThemeButtonState extends State<_GlassThemeButton> {
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
                ..scale(_isHovered ? 1.04 : 1.0)
                ..translate(0.0, _isHovered ? -2.0 : 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.isPrimary
                      ? (widget.isDark
                          ? [
                              Colors.white.withValues(alpha: _isHovered ? 0.28 : 0.18),
                              Colors.white.withValues(alpha: _isHovered ? 0.15 : 0.08),
                            ]
                          : [
                              Colors.black.withValues(alpha: _isHovered ? 0.90 : 0.80),
                              Colors.black.withValues(alpha: _isHovered ? 0.75 : 0.65),
                            ])
                      : (widget.isDark
                          ? [
                              Colors.white.withValues(alpha: _isHovered ? 0.14 : 0.06),
                              Colors.white.withValues(alpha: _isHovered ? 0.06 : 0.02),
                            ]
                          : [
                              Colors.black.withValues(alpha: _isHovered ? 0.10 : 0.04),
                              Colors.black.withValues(alpha: _isHovered ? 0.05 : 0.01),
                            ]),
                ),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: widget.isPrimary
                      ? (widget.isDark
                          ? Colors.white.withValues(alpha: _isHovered ? 0.65 : 0.35)
                          : Colors.black.withValues(alpha: _isHovered ? 0.40 : 0.20))
                      : (widget.isDark
                          ? Colors.white.withValues(alpha: _isHovered ? 0.45 : 0.20)
                          : Colors.black.withValues(alpha: _isHovered ? 0.30 : 0.15)),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.isPrimary
                        ? (widget.isDark
                            ? Colors.white.withValues(alpha: _isHovered ? 0.25 : 0.10)
                            : Colors.black.withValues(alpha: _isHovered ? 0.20 : 0.10))
                        : Colors.black.withValues(alpha: _isHovered ? 0.15 : 0.04),
                    blurRadius: _isHovered ? 18 : 8,
                    offset: Offset(0, _isHovered ? 6 : 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 1.0,
                      color: widget.isPrimary
                          ? Colors.white
                          : (widget.isDark ? Colors.white : Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    widget.icon,
                    size: 15,
                    color: widget.isPrimary
                        ? Colors.white
                        : (widget.isDark ? Colors.white70 : Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

