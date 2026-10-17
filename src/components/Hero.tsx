"use client";

import React, { useState, useEffect } from "react";
import { motion, useReducedMotion } from "motion/react";
import { Logo } from "./Logo";
import { SocialButton } from "./SocialButton";
import { Portrait } from "./Portrait";
import { Navbar } from "./Navbar";
import { portfolioData } from "@/data/portfolio";
import { RotateCcw } from "lucide-react";

interface HeroProps {
  onReplay?: () => void;
  animationKey?: number;
}

export const Hero: React.FC<HeroProps> = ({ onReplay, animationKey = 0 }) => {
  const shouldReduceMotion = useReducedMotion();
  const [mounted, setMounted] = useState(false);
  const [showReplay, setShowReplay] = useState(false);
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    setMounted(true);
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    checkMobile();
    window.addEventListener("resize", checkMobile);

    const timer = setTimeout(() => {
      setShowReplay(true);
    }, 2600);
    return () => {
      window.removeEventListener("resize", checkMobile);
      clearTimeout(timer);
    };
  }, [animationKey]);

  // Luxury easing curve for cinematic motion
  const panelEase = [0.16, 1, 0.3, 1] as const;

  return (
    <section 
      id="hero"
      key={animationKey}
      className="relative w-full h-screen min-h-[640px] max-h-[1200px] overflow-hidden bg-black select-none"
      aria-label="Hero Section"
    >
      {/* ======================================================== */}
      {/* TOP NAVIGATION (z-40 for full unobstructed layering)    */}
      {/* ======================================================== */}
      <Navbar isAnimated={!shouldReduceMotion} />

      {/* ======================================================== */}
      {/* 1. RIGHT / BOTTOM PANEL (Pure Black #000000)             */}
      {/* ======================================================== */}
      <motion.div
        className="absolute inset-0 w-full h-full bg-black z-0 flex items-end justify-center md:justify-end"
        initial={
          shouldReduceMotion
            ? { opacity: 1 }
            : isMobile
            ? { y: "100%", opacity: 0 }
            : { x: "100%", opacity: 0 }
        }
        animate={isMobile ? { y: "0%", opacity: 1 } : { x: "0%", opacity: 1 }}
        transition={{
          duration: shouldReduceMotion ? 0 : 1.35,
          delay: 0.15,
          ease: panelEase,
        }}
      >
        {/* Right Panel Background Ambience */}
        <div className="absolute inset-0 bg-gradient-to-bl from-white/[0.02] via-transparent to-transparent pointer-events-none" />

        {/* Portrait of Raniya Kazi positioned toward center-right, anchored to bottom */}
        <Portrait
          src={portfolioData.portraitImage}
          alt={portfolioData.name}
          isAnimated={!shouldReduceMotion}
        />
      </motion.div>

      {/* ======================================================== */}
      {/* 2. LEFT / TOP PANEL (Soft Concrete Light Gray #D7D8D6)    */}
      {/* Slanted edge forming the diagonal divider                 */}
      {/* ======================================================== */}
      <motion.div
        className="absolute inset-x-0 top-0 h-[53vh] md:h-full md:inset-0 bg-[#D7D8D6] z-10 overflow-hidden split-hero-gray shadow-[10px_0_35px_rgba(0,0,0,0.5)]"
        initial={
          shouldReduceMotion
            ? { opacity: 1 }
            : isMobile
            ? { y: "-100%", opacity: 0 }
            : { x: "-100%", opacity: 0 }
        }
        animate={isMobile ? { y: "0%", opacity: 1 } : { x: "0%", opacity: 1 }}
        transition={{
          duration: shouldReduceMotion ? 0 : 1.35,
          delay: 0.15,
          ease: panelEase,
        }}
      >
        {/* Inner Content Container */}
        <div className="relative w-full h-full flex flex-col justify-between p-5 sm:p-8 md:p-12 lg:p-16 xl:p-20 z-20">
          {/* Top: Logo */}
          <motion.div
            className="flex items-center"
            initial={shouldReduceMotion ? { opacity: 1 } : { opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{
              duration: 0.7,
              delay: shouldReduceMotion ? 0 : 1.1,
              ease: panelEase,
            }}
          >
            <Logo size={42} className="text-black" />
          </motion.div>

          {/* Middle: Introduction & Name */}
          <div className="my-auto max-w-[320px] sm:max-w-[400px] md:max-w-[440px] lg:max-w-[480px] xl:max-w-[540px]">
            {/* Greeting: "Hi, I am" */}
            <motion.p
              className="text-base sm:text-lg md:text-xl lg:text-2xl font-medium text-black/90 tracking-tight mb-1 sm:mb-2 md:mb-3"
              initial={shouldReduceMotion ? { opacity: 1, y: 0 } : { opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{
                duration: 0.6,
                delay: shouldReduceMotion ? 0 : 1.25,
                ease: panelEase,
              }}
            >
              {portfolioData.greeting}
            </motion.p>

            {/* Name: "Raniya Kazi" */}
            <motion.h1
              className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl xl:text-[68px] 2xl:text-[76px] font-black tracking-[-0.035em] text-black leading-[1.05] mb-2 sm:mb-3 md:mb-4 drop-shadow-[0_1px_1px_rgba(255,255,255,0.6)]"
              initial={shouldReduceMotion ? { opacity: 1, y: 0 } : { opacity: 0, y: 26 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{
                duration: 0.75,
                delay: shouldReduceMotion ? 0 : 1.38,
                ease: panelEase,
              }}
            >
              {portfolioData.name}
            </motion.h1>

            {/* Subtitle / Role */}
            <motion.p
              className="text-xs sm:text-sm md:text-base lg:text-lg xl:text-[19px] font-semibold text-[#707270] tracking-normal leading-relaxed"
              initial={shouldReduceMotion ? { opacity: 1, y: 0 } : { opacity: 0, y: 16 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{
                duration: 0.6,
                delay: shouldReduceMotion ? 0 : 1.5,
                ease: panelEase,
              }}
            >
              {portfolioData.role}
            </motion.p>
          </div>

          {/* Bottom-left: 3 Tactile Social Buttons */}
          <motion.div
            className="flex items-center gap-3 sm:gap-3.5 md:gap-4 pt-2 sm:pt-4 md:pt-6"
            initial={shouldReduceMotion ? { opacity: 1 } : { opacity: 0, y: 15 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{
              duration: 0.6,
              delay: shouldReduceMotion ? 0 : 1.65,
              ease: panelEase,
            }}
          >
            <SocialButton
              href={portfolioData.socialLinks.email}
              label="Email Raniya Kazi"
              icon="email"
            />
            <SocialButton
              href={portfolioData.socialLinks.github}
              label="GitHub Profile"
              icon="github"
            />
            <SocialButton
              href={portfolioData.socialLinks.linkedin}
              label="LinkedIn Profile"
              icon="linkedin"
            />
          </motion.div>
        </div>
      </motion.div>

      {/* ======================================================== */}
      {/* 3. DISCREET REPLAY ENTRANCE BUTTON                        */}
      {/* ======================================================== */}
      {showReplay && onReplay && (
        <motion.div
          className="fixed bottom-4 right-4 z-40"
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.3 }}
        >
          <button
            onClick={onReplay}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-zinc-900/80 hover:bg-zinc-800 text-zinc-300 hover:text-white border border-zinc-700/60 shadow-lg text-xs font-medium backdrop-blur-md transition-all hover:scale-105 active:scale-95"
            title="Replay split-screen entrance animation"
          >
            <RotateCcw className="w-3.5 h-3.5 text-zinc-400 group-hover:rotate-180 transition-transform duration-500" />
            <span className="hidden sm:inline">Replay Intro</span>
          </button>
        </motion.div>
      )}
    </section>
  );
};
