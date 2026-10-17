"use client";

import React from "react";
import { portfolioData } from "@/data/portfolio";
import { ExternalLink, ArrowUpRight, FolderGit2 } from "lucide-react";

export const PortfolioSection: React.FC = () => {
  return (
    <section id="portfolio" className="relative w-full py-28 sm:py-36 bg-[#0a0a0a] text-white border-t border-zinc-900">
      <div className="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-16 pb-6 border-b border-zinc-800/80 gap-6">
          <div>
            <span className="text-xs uppercase tracking-[0.25em] text-zinc-400 font-semibold mb-2 block">
              Selected Works
            </span>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white">
              Featured Portfolio
            </h2>
          </div>
          <p className="text-sm text-zinc-400 max-w-sm">
            Explorations in design systems, motion interactions, and frontend engineering.
          </p>
        </div>

        {/* Project Cards */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {(portfolioData.projects || []).map((project, idx) => (
            <div
              key={project.id}
              className="group relative flex flex-col justify-between p-8 rounded-2xl bg-zinc-950 border border-zinc-800/80 hover:border-zinc-600 transition-all duration-300 hover:shadow-2xl hover:-translate-y-1"
            >
              <div>
                {/* Project Index / Badge */}
                <div className="flex items-center justify-between mb-6">
                  <span className="text-xs font-mono text-zinc-500 uppercase tracking-widest">
                    0{idx + 1} // CASE STUDY
                  </span>
                  <div className="flex items-center gap-3">
                    {project.githubUrl && (
                      <a
                        href={project.githubUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-zinc-500 hover:text-white transition-colors"
                        aria-label={`GitHub repository for ${project.title}`}
                      >
                        <svg
                          className="w-4 h-4 fill-current"
                          viewBox="0 0 24 24"
                          aria-hidden="true"
                        >
                          <path
                            fillRule="evenodd"
                            clipRule="evenodd"
                            d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                          />
                        </svg>
                      </a>
                    )}
                    {project.liveUrl && (
                      <a
                        href={project.liveUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-zinc-500 hover:text-white transition-colors"
                        aria-label={`Live demo for ${project.title}`}
                      >
                        <ArrowUpRight className="w-4 h-4" />
                      </a>
                    )}
                  </div>
                </div>

                {/* Title & Subtitle */}
                <h3 className="text-2xl font-bold text-white tracking-tight mb-2 group-hover:text-zinc-200 transition-colors">
                  {project.title}
                </h3>
                <p className="text-xs uppercase tracking-wider text-zinc-400 font-semibold mb-4">
                  {project.subtitle}
                </p>

                {/* Description */}
                <p className="text-sm text-zinc-400 leading-relaxed mb-6 font-light">
                  {project.description}
                </p>
              </div>

              <div>
                {/* Tags */}
                <div className="flex flex-wrap gap-2 pt-4 border-t border-zinc-900">
                  {project.tags.map((tag) => (
                    <span
                      key={tag}
                      className="px-2.5 py-1 rounded-md text-[11px] font-medium bg-zinc-900 text-zinc-400 border border-zinc-800"
                    >
                      {tag}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};
