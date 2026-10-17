"use client";

import React from "react";
import { motion } from "motion/react";
import { portfolioData } from "@/data/portfolio";
import { Code2, Palette, Sparkles, Terminal } from "lucide-react";

export const AboutSection: React.FC = () => {
  const highlights = [
    {
      icon: <Palette className="w-5 h-5 text-zinc-100" />,
      title: "Design Sensibility",
      desc: "Pixel-level precision, thoughtful hierarchy, and refined editorial typography.",
    },
    {
      icon: <Code2 className="w-5 h-5 text-zinc-100" />,
      title: "Frontend Engineering",
      desc: "Robust React & Next.js architectures with clean TypeScript and modern CSS.",
    },
    {
      icon: <Sparkles className="w-5 h-5 text-zinc-100" />,
      title: "Motion & Interaction",
      desc: "Fluid physics, kinetic choreography, and purposeful micro-interactions.",
    },
    {
      icon: <Terminal className="w-5 h-5 text-zinc-100" />,
      title: "Modern Tooling",
      desc: "Scalable component libraries, design token pipelines, and web performance.",
    },
  ];

  return (
    <section id="about" className="relative w-full py-28 sm:py-36 bg-[#0a0a0a] text-white overflow-hidden border-t border-zinc-900">
      {/* Background Subtle Diagonal Accent */}
      <div className="absolute top-0 right-0 w-96 h-96 bg-zinc-800/10 blur-3xl pointer-events-none" />

      <div className="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-16 pb-6 border-b border-zinc-800/80 gap-6">
          <div>
            <span className="text-xs uppercase tracking-[0.25em] text-zinc-400 font-semibold mb-2 block">
              About Me
            </span>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white">
              Designing with purpose, <br className="hidden sm:inline" />
              <span className="text-zinc-400 font-normal">coding with precision.</span>
            </h2>
          </div>
          <p className="text-sm text-zinc-400 max-w-sm">
            Bridging the gap between conceptual UI/UX design and production-grade frontend development.
          </p>
        </div>

        {/* Content Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16">
          {/* Left Column: Bio */}
          <div className="lg:col-span-7 space-y-6 text-zinc-300 leading-relaxed text-base sm:text-lg font-light">
            {portfolioData.bio.map((paragraph, index) => (
              <p key={index} className="text-zinc-300/90">
                {paragraph}
              </p>
            ))}

            <div className="pt-6 flex flex-wrap gap-4 items-center">
              <a
                href="#contact"
                className="inline-flex items-center justify-center px-6 py-3 rounded-full bg-white text-black text-xs font-bold uppercase tracking-wider hover:bg-zinc-200 transition-colors shadow-md"
              >
                Get in Touch
              </a>
              <a
                href="#education"
                className="inline-flex items-center justify-center px-6 py-3 rounded-full bg-zinc-900 border border-zinc-800 text-zinc-300 text-xs font-semibold uppercase tracking-wider hover:bg-zinc-800 hover:text-white transition-colors"
              >
                View Education & Background
              </a>
            </div>
          </div>

          {/* Right Column: Key Pillars */}
          <div className="lg:col-span-5 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-1 gap-4">
            {highlights.map((item, idx) => (
              <div
                key={idx}
                className="p-6 rounded-2xl bg-zinc-900/40 border border-zinc-800/70 hover:border-zinc-700 hover:bg-zinc-900/70 transition-all duration-300 group"
              >
                <div className="flex items-center gap-3.5 mb-2.5">
                  <div className="p-2 rounded-xl bg-zinc-800/80 border border-zinc-700/50 group-hover:scale-105 transition-transform">
                    {item.icon}
                  </div>
                  <h3 className="text-base font-semibold text-white tracking-tight">
                    {item.title}
                  </h3>
                </div>
                <p className="text-xs sm:text-sm text-zinc-400 leading-relaxed">
                  {item.desc}
                </p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};
