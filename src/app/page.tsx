"use client";

import React, { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { Hero } from "@/components/Hero";
import { AboutSection } from "@/components/AboutSection";
import { SkillsSection } from "@/components/SkillsSection";
import { EducationSection } from "@/components/EducationSection";
import { ContactSection } from "@/components/ContactSection";
import { Footer } from "@/components/Footer";
import { Logo } from "@/components/Logo";

export default function Home() {
  const [animationKey, setAnimationKey] = useState(0);
  const [isLoading, setIsLoading] = useState(true);

  // Initial loader sequence: Step 1 of entrance animation
  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 600); // 0.6s elegant initial reveal
    return () => clearTimeout(timer);
  }, [animationKey]);

  const handleReplay = () => {
    setIsLoading(true);
    setAnimationKey((prev) => prev + 1);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  return (
    <main className="relative min-h-screen bg-black text-white overflow-x-hidden">
      {/* ======================================================== */}
      {/* 1. INITIAL ELEGANT LOGO INTRO (Phase 1)                  */}
      {/* ======================================================== */}
      <AnimatePresence>
        {isLoading && (
          <motion.div
            key="splash-loader"
            className="fixed inset-0 z-50 flex flex-col items-center justify-center bg-black"
            initial={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] as const }}
          >
            <motion.div
              initial={{ scale: 0.85, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 1.1, opacity: 0 }}
              transition={{ duration: 0.5, ease: "easeOut" }}
              className="flex flex-col items-center gap-4"
            >
              <div className="p-3.5 rounded-2xl bg-[#D7D8D6] text-black shadow-[0_10px_30px_rgba(255,255,255,0.1)]">
                <Logo size={52} />
              </div>
              <motion.div
                className="w-16 h-[2px] bg-zinc-700 overflow-hidden rounded-full mt-2"
              >
                <motion.div
                  className="w-full h-full bg-[#D7D8D6]"
                  initial={{ x: "-100%" }}
                  animate={{ x: "0%" }}
                  transition={{ duration: 0.5, ease: "easeInOut" }}
                />
              </motion.div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* ======================================================== */}
      {/* 2. SPLIT-SCREEN HERO WITH ENTRANCE ANIMATION (Phase 2-7)  */}
      {/* ======================================================== */}
      <Hero onReplay={handleReplay} animationKey={animationKey} />

      {/* ======================================================== */}
      {/* 3. SUBSEQUENT SECTIONS FOR COMPLETE NAVIGATION FLOW      */}
      {/* ======================================================== */}
      <AboutSection />
      <SkillsSection />
      <EducationSection />
      <ContactSection />
      <Footer />
    </main>
  );
}
