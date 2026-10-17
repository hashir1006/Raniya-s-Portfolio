export interface EducationItem {
  id: string;
  period: string;
  qualification: string;
  degree: string;
  institution: string;
  boardOrUniversity: string;
  description: string;
  scoreLabel?: string;
  score?: string;
  keySubjects?: string[];
  statusBadge?: string;
}

export interface AchievementItem {
  title: string;
  description: string;
  metric?: string;
  tag: string;
}

export interface SkillCategory {
  category: string;
  skills: {
    name: string;
    level?: string;
    icon?: string;
  }[];
}

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
  projects?: Project[];
  education: EducationItem[];
  achievements: AchievementItem[];
  academicInterests: string[];
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
    { label: "Education", href: "#education" },
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
  projects: [],
  education: [
    {
      id: "edu-be",
      period: "2023–2028 · Expected",
      qualification: "Undergraduate Degree",
      degree: "Bachelor of Engineering (B.E.)",
      institution: "M. H. Saboo Siddik College of Engineering",
      boardOrUniversity: "University of Mumbai · Mumbai, Maharashtra",
      description: "Pursuing an engineering degree focused on Artificial Intelligence, Machine Learning, software engineering, and the development of practical technology solutions.",
      statusBadge: "Currently Pursuing · AI & ML",
      keySubjects: [
        "AI & ML",
        "Data Structures and Algorithms",
        "DBMS",
        "Operating Systems",
        "Web Development",
      ],
    },
    {
      id: "edu-hsc",
      period: "2021–2023",
      qualification: "Class XII",
      degree: "Higher Secondary Certificate (HSC)",
      institution: "Sample College of Science, Mumbai, Maharashtra",
      boardOrUniversity: "Maharashtra State Board (MSBSHSE)",
      description: "Built a solid academic foundation in mathematics, physics, and computer science, developing rigorous analytical thinking and problem-solving skills.",
      scoreLabel: "Percentage",
      score: "78.50%",
      keySubjects: ["Physics", "Chemistry", "Mathematics", "Computer Science"],
    },
    {
      id: "edu-ssc",
      period: "2020–2021",
      qualification: "Class X",
      degree: "Secondary School Certificate (SSC)",
      institution: "Sample English High School, Mumbai, Maharashtra",
      boardOrUniversity: "Maharashtra State Board (MSBSHSE)",
      description: "Developed a strong academic foundation in mathematics, science, English, and logical reasoning.",
      scoreLabel: "Percentage",
      score: "85.20%",
      keySubjects: ["Mathematics", "Science", "English", "Social Sciences"],
    },
    {
      id: "edu-cet",
      period: "2023 · Entrance Examination",
      qualification: "State Level Entrance",
      degree: "MHT-CET (Maharashtra Common Entrance Test)",
      institution: "State CET Cell, Maharashtra",
      boardOrUniversity: "Government of Maharashtra",
      description: "State-level engineering entrance examination used as qualification for undergraduate engineering admissions across Maharashtra.",
      scoreLabel: "Percentile",
      score: "82.45",
      keySubjects: ["Physics", "Chemistry", "Mathematics"],
    },
  ],
  achievements: [
    {
      title: "18+ Final-Round Hackathons",
      description: "Active competitor across national-level engineering and technology hackathons with strong problem-solving under pressure.",
      metric: "18+",
      tag: "Competitions",
    },
    {
      title: "Team Leadership",
      description: "Served as team leader across multiple hackathon teams, directing product vision, architecture, and frontend execution.",
      metric: "Lead",
      tag: "Leadership",
    },
    {
      title: "2 Hackathon Wins",
      description: "Secured top podium finishes and accolades for building practical AI/ML and web applications.",
      metric: "2 Wins",
      tag: "Accolades",
    },
  ],
  academicInterests: [
    "AI/ML Applications",
    "Full-Stack Development",
    "Android Apps",
    "Software Engineering",
    "Real-World Technology Solutions",
    "Human-Computer Interaction",
  ],
  contact: {
    heading: "Let's work together",
    description: "Have an exciting project in mind or looking for a frontend developer / UI designer to join your team? Feel free to reach out anytime.",
    email: "raniya.kazi@example.com",
    location: "Available Worldwide / Remote",
    availability: "Available for new projects & opportunities",
  },
};
