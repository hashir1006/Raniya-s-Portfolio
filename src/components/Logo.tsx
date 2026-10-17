import React from "react";

interface LogoProps {
  className?: string;
  size?: number;
}

export const Logo: React.FC<LogoProps> = ({ className = "", size = 44 }) => {
  return (
    <div 
      className={`relative inline-flex items-center justify-center select-none cursor-pointer group ${className}`}
      style={{ width: size, height: size }}
      aria-label="Raniya Kazi Logo"
      title="Raniya Kazi"
    >
      <svg
        width={size}
        height={size}
        viewBox="0 0 48 48"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        className="transition-transform duration-300 group-hover:scale-105"
      >
        {/* Modern Geometric Monogram 'RK' matching the reference 'TG' aesthetic */}
        {/* Geometric R stem and loop */}
        <path
          d="M6 8H24C28.4183 8 32 11.5817 32 16C32 20.4183 28.4183 24 24 24H6V8Z"
          fill="currentColor"
          fillRule="evenodd"
          clipRule="evenodd"
        />
        {/* Inner cutout for R loop */}
        <path
          d="M14 14H23C24.1046 14 25 14.8954 25 16C25 17.1046 24.1046 18 23 18H14V14Z"
          fill="#D7D8D6"
        />
        {/* Diagonal leg of R extending into K */}
        <path
          d="M17 22L28 40H20L11 25.5V40H6V22H17Z"
          fill="currentColor"
        />
        {/* Modern angular K arms */}
        <path
          d="M27 20L37 8H44L33 21.5L44 40H37L28 25.5L30 22.5L27 20Z"
          fill="currentColor"
        />
        {/* Sharp architectural cut accent */}
        <path
          d="M40 7L43 3H37L34 7H40Z"
          fill="currentColor"
          opacity="0.9"
        />
      </svg>
    </div>
  );
};
