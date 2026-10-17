"use client";

import React from "react";
import { portfolioData } from "@/data/portfolio";
import { CheckCircle2, Layers, Cpu, Wrench } from "lucide-react";

export const SkillsSection: React.FC = () => {
  const getCategoryIcon = (category: string) => {
    if (category.includes("Frontend")) return <Layers className="w-5 h-5 text-zinc-300" />;
    if (category.includes("Design")) return <Cpu className="w-5 h-5 text-zinc-300" />;
    return <Wrench className="w-5 h-5 text-zinc-300" />;
  };

  return (
    <section id="skills" className="relative w-full py-28 sm:py-36 bg-[#0e0e0e] text-white border-t border-zinc-900">
      <div className="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16">
        {/* Section Header */}
        <div className="max-w-2xl mb-16">
          <span className="text-xs uppercase tracking-[0.25em] text-zinc-400 font-semibold mb-2 block">
            Core Competencies
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white mb-4">
            Technical Skills & Design Toolkit
          </h2>
          <p className="text-sm sm:text-base text-zinc-400">
            A balanced synthesis of design thinking and robust frontend software engineering.
          </p>
        </div>

        {/* Skills Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {portfolioData.skills.map((cat, idx) => (
            <div
              key={idx}
              className="relative p-8 rounded-2xl bg-zinc-950/70 border border-zinc-800/80 hover:border-zinc-700 hover:shadow-2xl transition-all duration-300 group flex flex-col justify-between"
            >
              <div>
                <div className="flex items-center gap-3 mb-6 pb-4 border-b border-zinc-800/80">
                  <div className="p-2.5 rounded-xl bg-zinc-900 border border-zinc-800 group-hover:scale-105 transition-transform">
                    {getCategoryIcon(cat.category)}
                  </div>
                  <h3 className="text-lg font-bold text-white tracking-tight">
                    {cat.category}
                  </h3>
                </div>

                <ul className="space-y-3.5">
                  {cat.skills.map((skill, sIdx) => (
                    <li
                      key={sIdx}
                      className="flex items-center gap-3 text-sm text-zinc-300 group-hover:text-zinc-200 transition-colors"
                    >
                      <CheckCircle2 className="w-4 h-4 text-zinc-500 group-hover:text-zinc-300 transition-colors shrink-0" />
                      <span className="font-medium">{skill.name}</span>
                    </li>
                  ))}
                </ul>
              </div>

              <div className="mt-8 pt-4 border-t border-zinc-900 flex items-center justify-between text-xs text-zinc-500">
                <span>{cat.skills.length} Capabilities</span>
                <span className="text-zinc-400 font-mono">Verified Stack</span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};
