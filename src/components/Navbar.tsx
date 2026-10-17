"use client";

import React, { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { Menu, X, ArrowUpRight } from "lucide-react";

interface NavbarProps {
  isAnimated?: boolean;
}

export const Navbar: React.FC<NavbarProps> = ({ isAnimated = true }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  const navLinks = [
    { name: "About me", href: "#about" },
    { name: "Skills", href: "#skills" },
    { name: "Portfolio", href: "#portfolio" },
  ];

  return (
    <header className="absolute top-0 right-0 left-0 z-40 pointer-events-none">
      <div className="w-full flex items-center justify-between px-6 sm:px-10 lg:px-16 pt-4 sm:pt-5 lg:pt-6">
        {/* Empty left spacer on desktop so nav items sit strictly on the right black panel */}
        <div className="hidden lg:block w-[46%]" />

        {/* Right side navigation container */}
        <div className="w-full lg:w-[54%] flex items-center justify-end pointer-events-auto">
          {/* Desktop Navigation */}
          <motion.nav
            className="hidden md:flex items-center gap-6 lg:gap-8 xl:gap-10"
            initial={isAnimated ? { opacity: 0, y: -20 } : { opacity: 1, y: 0 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{
              duration: 0.7,
              delay: 1.25, // Staggered reveal after panels meet
              ease: [0.16, 1, 0.3, 1] as const,
            }}
          >
            {navLinks.map((link, idx) => (
              <motion.a
                key={link.name}
                href={link.href}
                className="relative text-[14.5px] font-medium text-white/85 hover:text-white transition-colors duration-200 tracking-wide group"
                whileHover={{ y: -1 }}
                whileTap={{ y: 0 }}
              >
                <span>{link.name}</span>
                <span className="absolute -bottom-1 left-0 w-0 h-[1.5px] bg-white transition-all duration-300 group-hover:w-full" />
              </motion.a>
            ))}

            {/* Pill-shaped CONTACT ME button matching reference */}
            <motion.a
              href="#contact"
              className="inline-flex items-center justify-center px-6 py-2.5 rounded-full bg-white text-black text-[13px] font-extrabold tracking-[0.06em] uppercase shadow-[0_4px_14px_rgba(0,0,0,0.25)] hover:bg-[#f2f2f2] hover:shadow-[0_6px_20px_rgba(255,255,255,0.2)] transition-all duration-200"
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.96 }}
              transition={{ type: "spring", stiffness: 400, damping: 25 }}
            >
              CONTACT ME
            </motion.a>
          </motion.nav>

          {/* Mobile Menu Button */}
          <div className="md:hidden flex items-center">
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2.5 rounded-full bg-black/60 text-white border border-white/20 backdrop-blur-md focus:outline-none"
              aria-label="Toggle navigation menu"
            >
              {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Drawer */}
      <AnimatePresence>
        {mobileMenuOpen && (
          <motion.div
            className="md:hidden fixed inset-0 z-50 bg-black/95 backdrop-blur-xl flex flex-col justify-center items-center pointer-events-auto"
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.95 }}
            transition={{ duration: 0.25 }}
          >
            <button
              onClick={() => setMobileMenuOpen(false)}
              className="absolute top-8 right-8 p-3 rounded-full bg-white/10 text-white"
            >
              <X className="w-6 h-6" />
            </button>

            <div className="flex flex-col items-center gap-8 text-center">
              {navLinks.map((link) => (
                <a
                  key={link.name}
                  href={link.href}
                  onClick={() => setMobileMenuOpen(false)}
                  className="text-2xl font-semibold text-white/90 hover:text-white"
                >
                  {link.name}
                </a>
              ))}
              <a
                href="#contact"
                onClick={() => setMobileMenuOpen(false)}
                className="mt-4 px-8 py-3 rounded-full bg-white text-black font-bold text-sm tracking-widest uppercase shadow-lg"
              >
                CONTACT ME
              </a>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
};
