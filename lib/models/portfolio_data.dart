class EducationItem {
  final String id;
  final String period;
  final String qualification;
  final String degree;
  final String institution;
  final String boardOrUniversity;
  final String description;
  final String? scoreLabel;
  final String? score;
  final List<String>? keySubjects;
  final String? statusBadge;

  const EducationItem({
    required this.id,
    required this.period,
    required this.qualification,
    required this.degree,
    required this.institution,
    required this.boardOrUniversity,
    required this.description,
    this.scoreLabel,
    this.score,
    this.keySubjects,
    this.statusBadge,
  });
}

class AchievementItem {
  final String title;
  final String description;
  final String? metric;
  final String tag;

  const AchievementItem({
    required this.title,
    required this.description,
    this.metric,
    required this.tag,
  });
}

class SkillItem {
  final String name;
  final String? level;

  const SkillItem({
    required this.name,
    this.level,
  });
}

class SkillCategory {
  final String category;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.category,
    required this.skills,
  });
}

class ProjectItem {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final String? image;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    this.image,
    this.githubUrl,
    this.liveUrl,
  });
}

class SocialLinks {
  final String email;
  final String github;
  final String linkedin;
  final String? twitter;

  const SocialLinks({
    required this.email,
    required this.github,
    required this.linkedin,
    this.twitter,
  });
}

class ContactInfo {
  final String heading;
  final String description;
  final String email;
  final String location;
  final String availability;

  const ContactInfo({
    required this.heading,
    required this.description,
    required this.email,
    required this.location,
    required this.availability,
  });
}

class PortfolioData {
  final String name;
  final String greeting;
  final String role;
  final String tagline;
  final List<String> bio;
  final String portraitAsset;
  final SocialLinks socialLinks;
  final List<SkillCategory> skills;
  final List<ProjectItem> projects;
  final List<EducationItem> education;
  final List<AchievementItem> achievements;
  final List<String> academicInterests;
  final ContactInfo contact;

  const PortfolioData({
    required this.name,
    required this.greeting,
    required this.role,
    required this.tagline,
    required this.bio,
    required this.portraitAsset,
    required this.socialLinks,
    required this.skills,
    required this.projects,
    required this.education,
    required this.achievements,
    required this.academicInterests,
    required this.contact,
  });
}

const portfolioData = PortfolioData(
  name: "Raniya Kazi",
  greeting: "Hi, I am",
  role: "Front-end Developer / UI Designer",
  tagline: "Crafting minimalist digital experiences with fluid motion & engineering rigor.",
  portraitAsset: "assets/raniya-portrait.png",
  bio: [
    "I am a frontend developer and UI designer dedicated to building refined, performant, and memorable digital experiences. I bridge the intersection between minimalist aesthetic design and robust web architecture.",
    "Specializing in modern Flutter Web, responsive interfaces, Dart, and motion design, I transform ideas into intuitive, pixel-perfect interfaces that delight users and deliver tangible impact."
  ],
  socialLinks: SocialLinks(
    email: "mailto:raniya.kazi@example.com",
    github: "https://github.com/raniya-kazi",
    linkedin: "https://linkedin.com/in/raniya-kazi",
  ),
  skills: [
    SkillCategory(
      category: "Frontend Architecture",
      skills: [
        SkillItem(name: "Flutter Web & Dart"),
        SkillItem(name: "React / Next.js"),
        SkillItem(name: "TypeScript"),
        SkillItem(name: "Modern CSS / Tailwind"),
        SkillItem(name: "Micro-interactions & Physics"),
        SkillItem(name: "REST & GraphQL APIs"),
      ],
    ),
    SkillCategory(
      category: "UI / UX Design",
      skills: [
        SkillItem(name: "Design Systems & Tokens"),
        SkillItem(name: "Figma & Interactive Prototyping"),
        SkillItem(name: "Editorial & Split-Screen Layouts"),
        SkillItem(name: "Responsive Multi-Device Layouts"),
        SkillItem(name: "Accessibility (WCAG AA)"),
        SkillItem(name: "Minimalist Typography"),
      ],
    ),
    SkillCategory(
      category: "Tools & Engineering",
      skills: [
        SkillItem(name: "Git & GitHub CI/CD"),
        SkillItem(name: "Vercel Cloud Deployment"),
        SkillItem(name: "Web Performance & Vitals"),
        SkillItem(name: "State Management"),
        SkillItem(name: "Cross-Browser Testing"),
        SkillItem(name: "SEO & Semantic Web"),
      ],
    ),
  ],
  projects: [
    ProjectItem(
      id: "split-portfolio",
      title: "Split-Screen Personal Portfolio",
      subtitle: "Flutter Web · Motion & Themes",
      description: "An academic portfolio engineered in Flutter Web featuring synchronized dual-panel entrance animations, dynamic light/dark/system theme switching, and seamless Vercel cloud hosting.",
      tags: ["Flutter Web", "Dart", "Custom Painter", "Vercel"],
      githubUrl: "https://github.com/raniya-kazi",
      liveUrl: "https://raniya-portfolio.vercel.app",
    ),
    ProjectItem(
      id: "women-safety-app",
      title: "Campus & Women Safety System",
      subtitle: "Mobile & Real-Time Emergency App",
      description: "A proactive safety and emergency assistance system designed with rapid SOS triggers, real-time geolocation sharing, and intuitive UX during critical situations.",
      tags: ["Android", "Flutter", "Geolocation", "UI/UX"],
      githubUrl: "https://github.com/raniya-kazi",
    ),
    ProjectItem(
      id: "hackathon-ai-platform",
      title: "AI Hackathon Prototyping Engine",
      subtitle: "18+ Hackathon National Finalist Project",
      description: "An AI-powered rapid prototyping and insight tool built during 24-48 hour competitive hackathons, winning top podium accolades for practical technology implementation.",
      tags: ["AI/ML", "React", "Python", "Hackathons"],
      githubUrl: "https://github.com/raniya-kazi",
    ),
  ],
  education: [
    EducationItem(
      id: "edu-be",
      period: "2023–2028 · Expected",
      qualification: "Undergraduate Degree",
      degree: "Bachelor of Engineering (B.E.)",
      institution: "M. H. Saboo Siddik College of Engineering",
      boardOrUniversity: "University of Mumbai · Mumbai, Maharashtra",
      description: "Pursuing an engineering degree focused on Artificial Intelligence, Machine Learning, software engineering, and the development of practical technology solutions.",
      statusBadge: "Currently Pursuing · AI & ML",
      keySubjects: [
        "AI & Machine Learning",
        "Data Structures & Algorithms",
        "DBMS",
        "Operating Systems",
        "Web Engineering",
      ],
    ),
    EducationItem(
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
    ),
    EducationItem(
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
    ),
    EducationItem(
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
    ),
  ],
  achievements: [
    AchievementItem(
      title: "18+ Final-Round Hackathons",
      description: "Active competitor across national-level engineering and technology hackathons with strong problem-solving under pressure.",
      metric: "18+",
      tag: "Competitions",
    ),
    AchievementItem(
      title: "Team Leadership",
      description: "Served as team leader across multiple hackathon teams, directing product vision, architecture, and frontend execution.",
      metric: "Lead",
      tag: "Leadership",
    ),
    AchievementItem(
      title: "2 Hackathon Wins",
      description: "Secured top podium finishes and accolades for building practical AI/ML and web applications.",
      metric: "2 Wins",
      tag: "Accolades",
    ),
  ],
  academicInterests: [
    "AI/ML Applications",
    "Flutter Web Architecture",
    "Full-Stack Systems",
    "Android Development",
    "Human-Computer Interaction",
    "Kinetic Animation & Physics",
  ],
  contact: ContactInfo(
    heading: "Let's work together",
    description: "Have an exciting project in mind or looking for a frontend developer / UI designer to join your team? Feel free to reach out anytime.",
    email: "raniya.kazi@example.com",
    location: "Mumbai, Maharashtra · Available Worldwide",
    availability: "Available for new projects & opportunities",
  ),
);
