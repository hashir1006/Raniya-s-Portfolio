import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';

class PortfolioSection extends StatelessWidget {
  final ThemeProvider themeProvider;

  const PortfolioSection({
    super.key,
    required this.themeProvider,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDark(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    final bgColor = isDark ? const Color(0xFF0E0E0E) : const Color(0xFFF1F3F5);
    final cardBgColor = isDark ? const Color(0xFF141416) : const Color(0xFFFFFFFF);
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
              // Header
              Text(
                'SELECTED WORKS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.5,
                  color: mutedColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Featured Portfolio & Projects',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isDesktop ? 40 : 28,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Explorations in design systems, motion choreography, and frontend software engineering.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  color: subtextColor,
                ),
              ),
              const SizedBox(height: 48),

              // Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: portfolioData.projects.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final project = entry.value;
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildProjectCard(
                              index: idx + 1,
                              project: project,
                              cardBgColor: cardBgColor,
                              borderColor: borderColor,
                              textColor: textColor,
                              subtextColor: subtextColor,
                              mutedColor: mutedColor,
                              isDark: isDark,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Column(
                      children: portfolioData.projects.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final project = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _buildProjectCard(
                            index: idx + 1,
                            project: project,
                            cardBgColor: cardBgColor,
                            borderColor: borderColor,
                            textColor: textColor,
                            subtextColor: subtextColor,
                            mutedColor: mutedColor,
                            isDark: isDark,
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required int index,
    required ProjectItem project,
    required Color cardBgColor,
    required Color borderColor,
    required Color textColor,
    required Color subtextColor,
    required Color mutedColor,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Text(
                '0$index // CASE STUDY',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: mutedColor,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (project.githubUrl != null)
                    _GlassProjectActionButton(
                      icon: Icons.code_rounded,
                      label: 'CODE',
                      tooltip: 'View GitHub Code',
                      isDark: isDark,
                      onTap: () => _launchUrl(project.githubUrl!),
                    ),
                  if (project.liveUrl != null)
                    _GlassProjectActionButton(
                      icon: Icons.arrow_outward_rounded,
                      label: 'LIVE DEMO',
                      tooltip: 'Open Live Demo',
                      isDark: isDark,
                      onTap: () => _launchUrl(project.liveUrl!),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project.title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: textColor,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            project.subtitle,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: mutedColor,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.description,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13.5,
              color: subtextColor,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Divider(color: borderColor, height: 1),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: subtextColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _GlassProjectActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String tooltip;
  final VoidCallback onTap;
  final bool isDark;

  const _GlassProjectActionButton({
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.onTap,
    required this.isDark,
  });

  @override
  State<_GlassProjectActionButton> createState() => _GlassProjectActionButtonState();
}

class _GlassProjectActionButtonState extends State<_GlassProjectActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final fgColor = widget.isDark
        ? (_isHovered ? Colors.white : Colors.white70)
        : (_isHovered ? Colors.black : const Color(0xFF334155));

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
            margin: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: widget.isDark
                        ? Colors.white.withValues(alpha: 0.16)
                        : Colors.black.withValues(alpha: 0.10),
                    blurRadius: 10,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: widget.isDark
                        ? (_isHovered ? Colors.white.withValues(alpha: 0.16) : Colors.white.withValues(alpha: 0.08))
                        : (_isHovered ? Colors.black.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.04)),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: widget.isDark
                          ? Colors.white.withValues(alpha: _isHovered ? 0.35 : 0.15)
                          : Colors.black.withValues(alpha: _isHovered ? 0.20 : 0.08),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, size: 13, color: fgColor),
                      const SizedBox(width: 4),
                      Text(
                        widget.label,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: fgColor,
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
    );
  }
}

