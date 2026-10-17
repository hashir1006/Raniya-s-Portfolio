import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';

class SkillsSection extends StatelessWidget {
  final ThemeProvider themeProvider;

  const SkillsSection({
    super.key,
    required this.themeProvider,
  });

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
                'CORE COMPETENCIES',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.5,
                  color: mutedColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Technical Skills & Design Toolkit',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isDesktop ? 40 : 28,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'A balanced synthesis of design thinking and robust frontend software engineering.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  color: subtextColor,
                ),
              ),
              const SizedBox(height: 48),

              // Cards Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: portfolioData.skills.map((category) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildSkillCard(
                              category: category,
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
                      children: portfolioData.skills.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _buildSkillCard(
                            category: category,
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

  Widget _buildSkillCard({
    required SkillCategory category,
    required Color cardBgColor,
    required Color borderColor,
    required Color textColor,
    required Color subtextColor,
    required Color mutedColor,
    required bool isDark,
  }) {
    IconData getCategoryIcon(String name) {
      if (name.contains('Frontend')) return Icons.layers_outlined;
      if (name.contains('Design')) return Icons.brush_outlined;
      return Icons.handyman_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Icon(
                  getCategoryIcon(category.category),
                  size: 20,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.category,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: borderColor, height: 1),
          const SizedBox(height: 20),

          // Skill Items
          ...category.skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 16,
                    color: isDark ? Colors.white60 : Colors.black45,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      skill.name,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: subtextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: borderColor)),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  '${category.skills.length} Capabilities',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    color: mutedColor,
                  ),
                ),
                Text(
                  'VERIFIED STACK',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
