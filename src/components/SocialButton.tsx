"use client";

import React from "react";
import { motion } from "motion/react";

interface SocialButtonProps {
  href: string;
  label: string;
  icon: "email" | "github" | "linkedin";
  onClick?: () => void;
}

export const SocialButton: React.FC<SocialButtonProps> = ({
  href,
  label,
  icon,
  onClick,
}) => {
  const renderIcon = () => {
    switch (icon) {
      case "email":
        return (
          // Crisp @ symbol matching the reference
          <span className="text-[20px] font-bold leading-none text-black font-sans select-none">
            @
          </span>
        );
      case "github":
        return (
          // GitHub icon silhouette
          <svg
            className="w-5 h-5 text-black fill-current"
            viewBox="0 0 24 24"
            aria-hidden="true"
          >
            <path
              fillRule="evenodd"
              clipRule="evenodd"
              d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
            />
          </svg>
        );
      case "linkedin":
        return (
          // In symbol in small rounded box matching reference
          <div className="w-[18px] h-[18px] bg-black rounded-[3px] flex items-center justify-center p-[2px]">
            <span className="text-[11px] font-bold text-[#D7D8D6] leading-none tracking-tighter">
              in
            </span>
          </div>
        );
      default:
        return null;
    }
  };

  return (
    <motion.a
      href={href}
      target={href.startsWith("http") ? "_blank" : undefined}
      rel={href.startsWith("http") ? "noopener noreferrer" : undefined}
      onClick={onClick}
      aria-label={label}
      whileHover={{ y: -3, scale: 1.06 }}
      whileTap={{ y: 0, scale: 0.95 }}
      transition={{ type: "spring", stiffness: 400, damping: 20 }}
      className="relative flex items-center justify-center w-11 h-11 sm:w-12 sm:h-12 rounded-[8px] bg-[#D7D8D6] border border-white/60 text-black cursor-pointer shadow-[3px_4px_8px_rgba(0,0,0,0.12),-2px_-2px_6px_rgba(255,255,255,0.7)] hover:shadow-[4px_6px_12px_rgba(0,0,0,0.16),-3px_-3px_8px_rgba(255,255,255,0.9)] transition-all duration-200"
    >
      {renderIcon()}
    </motion.a>
  );
};
