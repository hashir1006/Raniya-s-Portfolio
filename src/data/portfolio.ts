export interface Project {
  id: string;
  title: string;
  subtitle: string;
  description: string;
  tags: string[];
  image?: string;
  githubUrl?: string;
  liveUrl?: string;
}

export interface SkillCategory {
  category: string;
  skills: {
    name: string;
    level?: string;
    icon?: string;
  }[];
}

export interface PortfolioData {
  name: string;
  greeting: string;
  role: string;
  tagline: string;
  bio: string[];
  portraitImage: string;
  socialLinks: {
    email: string;
    github: string;
    linkedin: string;
    twitter?: string;
  };
  navigation: {
    label: string;
    href: string;
  }[];
  skills: SkillCategory[];
  projects: Project[];
  contact: {
    heading: string;
    description: string;
    email: string;
    location: string;
    availability: string;
  };
}

export const portfolioData: PortfolioData = {
  name: "Raniya Kazi",
  greeting: "Hi, I am",
  role: "Front-end Developer / UI Designer",
  tagline: "Crafting minimalist digital experiences with fluid motion & engineering rigor.",
  portraitImage: "/raniya-portrait.png",
  bio: [
    "I am a frontend developer and UI designer dedicated to building refined, performant, and memorable digital experiences. I bridge the intersection between minimalist aesthetic design and robust web architecture.",
    "Specializing in modern React, Next.js, TypeScript, and motion design, I transform ideas into intuitive, pixel-perfect interfaces that delight users and deliver tangible impact."
  ],
  socialLinks: {
    email: "mailto:raniya.kazi@example.com",
    github: "https://github.com/raniya-kazi",
    linkedin: "https://linkedin.com/in/raniya-kazi",
  },
  navigation: [
    { label: "About me", href: "#about" },
    { label: "Skills", href: "#skills" },
    { label: "Portfolio", href: "#portfolio" },
  ],
  skills: [
    {
      category: "Frontend Architecture",
      skills: [
        { name: "React / Next.js" },
        { name: "TypeScript" },
        { name: "Tailwind CSS" },
        { name: "Motion & Framer Motion" },
        { name: "HTML5 / Semantic Web" },
        { name: "REST & GraphQL APIs" },
      ],
    },
    {
      category: "UI / UX Design",
      skills: [
        { name: "Design Systems" },
        { name: "Figma & Prototyping" },
        { name: "Micro-interactions" },
        { name: "Responsive Layouts" },
        { name: "Accessibility (WCAG)" },
        { name: "Minimalist Typography" },
      ],
    },
    {
      category: "Tools & Engineering",
      skills: [
        { name: "Git & GitHub" },
        { name: "Vite / Turbopack" },
        { name: "Performance Optimization" },
        { name: "Component-Driven Dev" },
        { name: "Cross-Browser Testing" },
        { name: "SEO & Web Vitals" },
      ],
    },
  ],
  projects: [
    {
      id: "project-1",
      title: "Lumina Design System",
      subtitle: "Component Library & Token Engine",
      description: "An accessible, themeable design system built with React, TypeScript, and Tailwind CSS. Features over 40 customizable components with fluid micro-interactions.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Motion"],
      githubUrl: "https://github.com/raniya-kazi/lumina-design-system",
      liveUrl: "https://lumina-demo.example.com",
    },
    {
      id: "project-2",
      title: "Aura Creative Studio",
      subtitle: "Editorial Portfolio & Motion Showcase",
      description: "High-performance digital presence for an architecture and design studio. Implemented smooth diagonal transitions, custom cursor physics, and lazy-loaded galleries.",
      tags: ["Next.js", "Motion", "Tailwind CSS"],
      githubUrl: "https://github.com/raniya-kazi/aura-creative",
      liveUrl: "https://aura-studio.example.com",
    },
    {
      id: "project-3",
      title: "OmniFlow Dashboard",
      subtitle: "SaaS Analytics & Workspace",
      description: "Real-time analytics dashboard with interactive data visualization, dark/light theme persistence, and keyboard-first navigation shortcuts.",
      tags: ["TypeScript", "Next.js", "Chart.js", "Tailwind"],
      githubUrl: "https://github.com/raniya-kazi/omniflow-app",
      liveUrl: "https://omniflow.example.com",
    },
  ],
  contact: {
    heading: "Let's work together",
    description: "Have an exciting project in mind or looking for a frontend developer / UI designer to join your team? Feel free to reach out anytime.",
    email: "raniya.kazi@example.com",
    location: "Available Worldwide / Remote",
    availability: "Available for new projects & opportunities",
  },
};
