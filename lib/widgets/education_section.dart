import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';

class EducationSection extends StatelessWidget {
  final ThemeProvider themeProvider;

  const EducationSection({
    super.key,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDark(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    final bgColor = isDark ? const Color(0xFF0A0A0A) : const Color(0xFFFFFFFF);
    final cardBgColor = isDark ? const Color(0xFF141416) : const Color(0xFFF8F9FA);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subtextColor = isDark ? Colors.white70 : const Color(0xFF475569);
    final mutedColor = isDark ? Colors.white38 : const Color(0xFF94A3B8);

    final featured = portfolioData.education.first;
    final otherEducation = portfolioData.education.skip(1).toList();

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
                'ACADEMIC BACKGROUND',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.5,
                  color: mutedColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Education & Qualifications',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isDesktop ? 40 : 28,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Formal engineering training in AI & ML, competitive hackathon track record, and strong academic foundations.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  color: subtextColor,
                ),
              ),
              const SizedBox(height: 48),

              // 1. Featured Degree Card (B.E. AI & ML)
              Container(
                padding: EdgeInsets.all(isDesktop ? 36 : 24),
                decoration: BoxDecoration(
                  color: cardBgColor,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: isDark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 8,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981).withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: const Color(0xFF10B981).withOpacity(0.35),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF10B981),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          featured.statusBadge ?? 'Currently Pursuing',
                                          style: GoogleFonts.plusJakartaSans(
                                            color: const Color(0xFF10B981),
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: textColor.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(color: borderColor),
                                    ),
                                    child: Text(
                                      featured.period,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w600,
                                        color: subtextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                featured.degree,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: isDesktop ? 30 : 22,
                                  fontWeight: FontWeight.w900,
                                  color: textColor,
                                  letterSpacing: -0.8,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Computer Science & Engineering — Artificial Intelligence & Machine Learning',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: subtextColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 15, color: mutedColor),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      '${featured.institution} · ${featured.boardOrUniversity}',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 13,
                                        color: mutedColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (isDesktop)
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: textColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: borderColor),
                            ),
                            child: Icon(
                              Icons.psychology_outlined,
                              size: 40,
                              color: textColor,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      featured.description,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.5,
                        color: subtextColor,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (featured.keySubjects != null) ...[
                      Divider(color: borderColor, height: 1),
                      const SizedBox(height: 16),
                      Text(
                        'CORE SUBJECTS & TECHNICAL FOCUS:',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: mutedColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: featured.keySubjects!.map((sub) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: textColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              sub,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 2. Secondary Qualifications (HSC, SSC, MHT-CET)
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: otherEducation.map((item) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _buildSecondaryCard(
                              item: item,
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
                      children: otherEducation.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _buildSecondaryCard(
                            item: item,
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

              const SizedBox(height: 48),

              // 3. Hackathon Achievements & Interests Bento Box
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: _buildHackathonCard(cardBgColor, borderColor, textColor, subtextColor, isDark),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 5,
                      child: _buildInterestsCard(cardBgColor, borderColor, textColor, subtextColor, mutedColor),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildHackathonCard(cardBgColor, borderColor, textColor, subtextColor, isDark),
                    const SizedBox(height: 24),
                    _buildInterestsCard(cardBgColor, borderColor, textColor, subtextColor, mutedColor),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryCard({
    required EducationItem item,
    required Color cardBgColor,
    required Color borderColor,
    required Color textColor,
    required Color subtextColor,
    required Color mutedColor,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
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
                item.period,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: mutedColor,
                ),
              ),
              if (item.score != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: textColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    item.score!,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.degree,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16.5,
              fontWeight: FontWeight.w800,
              color: textColor,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            item.institution,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.5,
              color: subtextColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.5,
              color: subtextColor,
              height: 1.5,
            ),
          ),
          if (item.keySubjects != null) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: item.keySubjects!.map((s) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: textColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    s,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10.5,
                      color: mutedColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHackathonCard(
    Color cardBgColor,
    Color borderColor,
    Color textColor,
    Color subtextColor,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.emoji_events_outlined,
                  size: 20,
                  color: Color(0xFFF59E0B),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hackathon Achievements',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'Competitive engineering sprints & leadership',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: subtextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _metricBox('18+', 'Final-round hackathons competed', textColor, borderColor),
              const SizedBox(width: 12),
              _metricBox('2 Wins', 'Top podium finishes secured', const Color(0xFF10B981), borderColor),
              const SizedBox(width: 12),
              _metricBox('Lead', 'Team leadership in sprints', textColor, borderColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricBox(String metric, String label, Color metricColor, Color borderColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: metricColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metric,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: metricColor,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: metricColor.withOpacity(0.8),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestsCard(
    Color cardBgColor,
    Color borderColor,
    Color textColor,
    Color subtextColor,
    Color mutedColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.auto_awesome_outlined,
                  size: 20,
                  color: Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Academic Interests',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'Curiosity areas & specializations',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: subtextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: portfolioData.academicInterests.map((interest) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  interest,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: textColor,
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
