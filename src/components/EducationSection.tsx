"use client";

import React from "react";
import { portfolioData } from "@/data/portfolio";
import { 
  GraduationCap, 
  Award, 
  BookOpen, 
  Calendar, 
  MapPin, 
  Trophy, 
  Sparkles, 
  CheckCircle2, 
  BrainCircuit,
  Binary
} from "lucide-react";

export const EducationSection: React.FC = () => {
  return (
    <section 
      id="education" 
      className="relative w-full py-28 sm:py-36 bg-[#0a0a0a] text-white border-t border-zinc-900 overflow-hidden"
    >
      {/* Soft Ambient Light Glows */}
      <div className="absolute top-1/4 left-10 w-96 h-96 bg-zinc-700/10 rounded-full blur-3xl pointer-events-none" />
      <div className="absolute bottom-10 right-10 w-96 h-96 bg-zinc-600/10 rounded-full blur-3xl pointer-events-none" />

      <div className="relative max-w-7xl mx-auto px-6 sm:px-10 lg:px-16 z-10">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-16 pb-6 border-b border-zinc-800/80 gap-6">
          <div>
            <span className="text-xs uppercase tracking-[0.25em] text-zinc-400 font-semibold mb-2 block flex items-center gap-2">
              <GraduationCap className="w-4 h-4 text-zinc-300" />
              Academic Background
            </span>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white">
              Education & Qualifications
            </h2>
          </div>
          <p className="text-sm text-zinc-400 max-w-sm">
            Formal engineering training in AI & ML, competitive hackathon track record, and strong academic foundations.
          </p>
        </div>

        {/* ======================================================== */}
        {/* 1. FEATURED DEGREE: Bachelor of Engineering (B.E.)       */}
        {/* ======================================================== */}
        {portfolioData.education.length > 0 && (
          <div className="mb-10">
            {(() => {
              const b = portfolioData.education[0];
              return (
                <div className="relative group rounded-3xl p-8 sm:p-10 backdrop-blur-xl bg-white/[0.03] border border-white/[0.08] hover:border-white/[0.18] shadow-[0_8px_32px_rgba(0,0,0,0.37)] hover:shadow-[0_16px_48px_rgba(0,0,0,0.55)] transition-all duration-300">
                  <div className="flex flex-col lg:flex-row lg:items-start justify-between gap-6 mb-6">
                    <div>
                      {/* Status and Period Pill */}
                      <div className="flex flex-wrap items-center gap-3 mb-4">
                        <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-emerald-500/10 border border-emerald-500/25 text-emerald-400">
                          <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
                          {b.statusBadge || "Currently Pursuing"}
                        </span>
                        <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-mono bg-zinc-900/80 border border-zinc-800 text-zinc-300">
                          <Calendar className="w-3.5 h-3.5 text-zinc-400" />
                          {b.period}
                        </span>
                      </div>

                      {/* Degree & Major */}
                      <h3 className="text-2xl sm:text-3xl lg:text-4xl font-extrabold text-white tracking-tight mb-2">
                        {b.degree}
                      </h3>
                      <p className="text-base sm:text-lg font-medium text-zinc-300 mb-2">
                        Computer Science & Engineering — AI & ML
                      </p>

                      {/* College & University */}
                      <div className="flex flex-wrap items-center gap-y-1 gap-x-4 text-xs sm:text-sm text-zinc-400 mb-6">
                        <span className="font-semibold text-zinc-200">{b.institution}</span>
                        <span className="hidden sm:inline text-zinc-600">•</span>
                        <span className="flex items-center gap-1">
                          <MapPin className="w-3.5 h-3.5 text-zinc-400" />
                          {b.boardOrUniversity}
                        </span>
                      </div>
                    </div>

                    {/* Prominent Visual Icon */}
                    <div className="hidden lg:flex p-4 rounded-2xl bg-white/[0.04] border border-white/10 text-white shadow-inner">
                      <BrainCircuit className="w-10 h-10 text-zinc-300" />
                    </div>
                  </div>

                  <p className="text-sm sm:text-base text-zinc-300/90 leading-relaxed max-w-4xl mb-8 font-light">
                    {b.description}
                  </p>

                  {/* Key Subjects */}
                  {b.keySubjects && (
                    <div className="pt-6 border-t border-white/[0.06]">
                      <span className="text-xs uppercase tracking-wider text-zinc-400 font-semibold mb-3 block">
                        Core Subjects & Technical Focus:
                      </span>
                      <div className="flex flex-wrap gap-2">
                        {b.keySubjects.map((sub, sIdx) => (
                          <span
                            key={sIdx}
                            className="px-3 py-1.5 rounded-lg text-xs font-medium bg-zinc-900/90 text-zinc-300 border border-zinc-800 hover:border-zinc-700 transition-colors"
                          >
                            {sub}
                          </span>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            })()}
          </div>
        )}

        {/* ======================================================== */}
        {/* 2. HSC, SSC, and MHT-CET SOFT GLASS CARDS GRID           */}
        {/* ======================================================== */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 lg:gap-8 mb-12">
          {portfolioData.education.slice(1).map((item) => (
            <div
              key={item.id}
              className="group relative flex flex-col justify-between p-7 rounded-3xl backdrop-blur-xl bg-white/[0.03] border border-white/[0.08] hover:border-white/[0.18] shadow-[0_8px_32px_rgba(0,0,0,0.37)] hover:shadow-[0_16px_40px_rgba(0,0,0,0.5)] transition-all duration-300 hover:-translate-y-1"
            >
              <div>
                {/* Year & Badge */}
                <div className="flex items-center justify-between mb-4">
                  <span className="text-xs font-mono text-zinc-400 uppercase tracking-wider bg-zinc-900/80 px-2.5 py-1 rounded-full border border-zinc-800">
                    {item.period}
                  </span>
                  {item.score && (
                    <span className="text-xs font-bold font-mono text-white bg-white/[0.08] px-2.5 py-1 rounded-full border border-white/10">
                      {item.score} {item.scoreLabel ? `(${item.scoreLabel})` : ""}
                    </span>
                  )}
                </div>

                {/* Qualification & Degree */}
                <h4 className="text-xl font-bold text-white tracking-tight mb-1 group-hover:text-zinc-200 transition-colors">
                  {item.degree}
                </h4>
                <p className="text-xs uppercase tracking-wider font-semibold text-zinc-400 mb-3">
                  {item.qualification}
                </p>

                {/* School / College */}
                <p className="text-xs font-medium text-zinc-300 mb-1">
                  {item.institution}
                </p>
                <p className="text-[11px] text-zinc-500 mb-4">
                  {item.boardOrUniversity}
                </p>

                {/* Description */}
                <p className="text-xs text-zinc-400 leading-relaxed font-light mb-6">
                  {item.description}
                </p>
              </div>

              {/* Subject Badges */}
              {item.keySubjects && (
                <div className="flex flex-wrap gap-1.5 pt-4 border-t border-white/[0.06]">
                  {item.keySubjects.map((subject, idx) => (
                    <span
                      key={idx}
                      className="px-2 py-0.5 rounded text-[10px] font-medium bg-zinc-900/60 text-zinc-400 border border-zinc-800"
                    >
                      {subject}
                    </span>
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>

        {/* ======================================================== */}
        {/* 3. ACHIEVEMENTS & ACADEMIC INTERESTS BENTO ROW           */}
        {/* ======================================================== */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 lg:gap-8">
          {/* Hackathon Achievements Card */}
          <div className="lg:col-span-7 p-8 rounded-3xl backdrop-blur-xl bg-white/[0.03] border border-white/[0.08] hover:border-white/[0.18] shadow-[0_8px_32px_rgba(0,0,0,0.37)] transition-all duration-300">
            <div className="flex items-center gap-3 mb-6 pb-4 border-b border-white/[0.06]">
              <div className="p-2.5 rounded-xl bg-amber-500/10 border border-amber-500/20 text-amber-400">
                <Trophy className="w-5 h-5" />
              </div>
              <div>
                <h4 className="text-lg font-bold text-white tracking-tight">
                  Hackathon Achievements
                </h4>
                <p className="text-xs text-zinc-400">Competitive engineering & collaborative problem solving</p>
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-6">
              <div className="p-4 rounded-2xl bg-zinc-950/60 border border-zinc-850">
                <span className="text-2xl font-black text-white tracking-tight block mb-1">
                  18+
                </span>
                <p className="text-xs text-zinc-400 leading-snug">
                  Final-round participations in national-level hackathons
                </p>
              </div>

              <div className="p-4 rounded-2xl bg-zinc-950/60 border border-zinc-850">
                <span className="text-2xl font-black text-emerald-400 tracking-tight block mb-1">
                  2 Wins
                </span>
                <p className="text-xs text-zinc-400 leading-snug">
                  Podium finishes for practical technology solutions
                </p>
              </div>

              <div className="p-4 rounded-2xl bg-zinc-950/60 border border-zinc-850">
                <span className="text-2xl font-black text-zinc-200 tracking-tight block mb-1">
                  Leader
                </span>
                <p className="text-xs text-zinc-400 leading-snug">
                  Team lead across multiple engineering sprints
                </p>
              </div>
            </div>

            <p className="text-xs sm:text-sm text-zinc-300/80 leading-relaxed font-light">
              Demonstrated leadership and rapid prototyping skills in high-stakes environments, translating complex problem statements into functional, deployable products within 24–48 hour sprints.
            </p>
          </div>

          {/* Academic Interests Card */}
          <div className="lg:col-span-5 p-8 rounded-3xl backdrop-blur-xl bg-white/[0.03] border border-white/[0.08] hover:border-white/[0.18] shadow-[0_8px_32px_rgba(0,0,0,0.37)] transition-all duration-300 flex flex-col justify-between">
            <div>
              <div className="flex items-center gap-3 mb-6 pb-4 border-b border-white/[0.06]">
                <div className="p-2.5 rounded-xl bg-blue-500/10 border border-blue-500/20 text-blue-400">
                  <Sparkles className="w-5 h-5" />
                </div>
                <div>
                  <h4 className="text-lg font-bold text-white tracking-tight">
                    Academic Interests
                  </h4>
                  <p className="text-xs text-zinc-400">Specializations and curiosity areas</p>
                </div>
              </div>

              <div className="flex flex-wrap gap-2 mb-6">
                {portfolioData.academicInterests.map((interest, idx) => (
                  <span
                    key={idx}
                    className="px-3 py-1.5 rounded-xl text-xs font-medium bg-zinc-900/90 text-zinc-200 border border-zinc-800 hover:border-zinc-600 transition-colors"
                  >
                    {interest}
                  </span>
                ))}
              </div>
            </div>

            <div className="p-4 rounded-2xl bg-zinc-950/40 border border-zinc-850 flex items-center gap-3 text-xs text-zinc-400">
              <Binary className="w-4 h-4 text-zinc-400 shrink-0" />
              <span>Actively exploring applied AI systems and modern full-stack architectures.</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
