"use client";

import React from "react";
import { Logo } from "./Logo";
import { ArrowUp } from "lucide-react";
import { portfolioData } from "@/data/portfolio";

export const Footer: React.FC = () => {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  return (
    <footer className="w-full py-12 bg-black text-zinc-500 border-t border-zinc-900 select-none">
      <div className="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16 flex flex-col sm:flex-row items-center justify-between gap-6">
        <div className="flex items-center gap-3">
          <div className="p-1 rounded-md bg-[#D7D8D6] text-black">
            <Logo size={24} />
          </div>
          <span className="text-sm font-semibold text-zinc-300 tracking-tight">
            {portfolioData.name}
          </span>
          <span className="text-zinc-600 text-xs">/</span>
          <span className="text-xs text-zinc-500">{portfolioData.role}</span>
        </div>

        <div className="flex items-center gap-6">
          <p className="text-xs text-zinc-500 text-center sm:text-left">
            © 2026 {portfolioData.name}. All rights reserved.
          </p>

          <button
            onClick={scrollToTop}
            className="p-2.5 rounded-full bg-zinc-900 border border-zinc-800 text-zinc-400 hover:text-white hover:bg-zinc-800 transition-all shadow-md group"
            aria-label="Back to top"
            title="Back to top"
          >
            <ArrowUp className="w-4 h-4 group-hover:-translate-y-0.5 transition-transform" />
          </button>
        </div>
      </div>
    </footer>
  );
};
