"use client";

import React, { useState } from "react";
import { motion } from "motion/react";

interface PortraitProps {
  src?: string;
  alt?: string;
  isAnimated?: boolean;
}

export const Portrait: React.FC<PortraitProps> = ({
  src = "/raniya-portrait.png",
  alt = "Raniya Kazi - Frontend Developer & UI Designer",
  isAnimated = true,
}) => {
  const [imageError, setImageError] = useState<boolean>(false);

  // High-performance luxury cubic-bezier easing
  const smoothEase = [0.16, 1, 0.3, 1] as const;

  return (
    <div className="relative w-full h-full flex items-end justify-center lg:justify-end select-none pointer-events-none">
      {/* 
        Portrait positioning: 
        Centered within the right black panel's visual quadrant 
        with balanced margins from the diagonal divider and the right viewport edge.
      */}
      <motion.div
        className="relative z-10 w-[78%] sm:w-[68%] md:w-[58%] lg:w-[50%] xl:w-[44%] 2xl:w-[40%] h-[68vh] sm:h-[72vh] md:h-[75vh] lg:h-[78vh] xl:h-[80vh] max-h-[820px] flex items-end justify-center lg:mr-[2vw] xl:mr-[4vw] 2xl:mr-[5vw] pointer-events-auto"
        initial={
          isAnimated
            ? { opacity: 0, y: 50, scale: 0.96 }
            : { opacity: 1, y: 0, scale: 1 }
        }
        animate={{ opacity: 1, y: 0, scale: 1 }}
        transition={{
          duration: 1.15,
          delay: 0.95, // Seamlessly glides in right as the split-screen panels meet
          ease: smoothEase,
        }}
      >
        {/* Subtle breathing / alive micro-motion container */}
        <motion.div
          className="relative w-full h-full flex items-end justify-center group will-change-transform"
          animate={{
            y: [0, -5, 0],
          }}
          transition={{
            duration: 6.5,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        >
          {imageError ? (
            <div className="relative w-full h-full flex items-end justify-center">
              <img
                src="/raniya-portrait.svg"
                alt={alt}
                className="w-full h-full object-contain object-bottom drop-shadow-[0_20px_50px_rgba(0,0,0,0.8)]"
              />
            </div>
          ) : (
            <div className="relative w-full h-full flex items-end justify-center">
              <img
                src={src}
                alt={alt}
                onError={() => setImageError(true)}
                className="w-full h-full object-contain object-bottom select-none filter drop-shadow-[0_30px_70px_rgba(0,0,0,0.95)] transition-transform duration-700 ease-out group-hover:scale-[1.015]"
                loading="eager"
                draggable={false}
              />
              {/* Soft bottom vignette to guarantee 100% black blend at screen base */}
              <div className="absolute inset-x-0 bottom-0 h-10 bg-gradient-to-t from-black via-black/40 to-transparent pointer-events-none" />
            </div>
          )}
        </motion.div>
      </motion.div>
    </div>
  );
};
