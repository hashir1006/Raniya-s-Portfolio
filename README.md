# Raniya Kazi — Personal Portfolio (Flutter Web)

> **Academic Project Aim:**  
> *"To design, develop, and deploy a fully responsive personal portfolio website using Flutter Web framework with dark and light theme support, animated UI components, and public hosting on the Vercel cloud platform."*

---

## 1. Project Overview & Architecture

This repository contains the production personal portfolio of **Raniya Kazi**, migrated from a previous Next.js prototype to a **Flutter Web & Dart** implementation.

The design is directly based on the reference split-screen aesthetic:
- **Left Panel:** Concrete light-gray (`#D7D8D6`) background with geometric monogram logo, introduction ("Hi, I am"), prominent typography ("Raniya Kazi"), professional role ("Front-end Developer / UI Designer"), and 3 tactile social buttons (Email, GitHub, LinkedIn).
- **Right Panel:** Pitch black (`#000000`) background with top navigation (About me, Skills, Education, Portfolio, CONTACT ME pill button, Theme selector), atmospheric radial lighting, and Raniya's portrait cutout anchored to the bottom edge.
- **Diagonal Divider:** Engineered using Flutter's native `CustomClipper<Path>` ensuring responsive angles across desktop, tablet, and mobile displays.

---

## 2. Key Features

### 🎬 Animated Split-Screen Entrance
A native Flutter multi-stage animation sequence managed by an `AnimationController` with luxury cubic-bezier easing (`Cubic(0.16, 1.0, 0.3, 1.0)`):
1. **Initial Concealment:** Left panel positioned at `Offset(-1.0, 0)` and right panel at `Offset(1.0, 0)`. Zero flash or horizontal overflow.
2. **Dual Panel Slide-in (0.0s – 1.4s):** Simultaneously glides inward from opposite viewport edges and settles seamlessly into the diagonal split.
3. **Portrait Reveal (0.9s – 1.8s):** Fades in with a subtle upward glide (`Offset(0, 0.12) -> Offset.zero`) anchored to the bottom edge.
4. **Typography Reveal (1.1s – 2.0s):** Sequential rise-and-fade for *"Hi, I am"* $\rightarrow$ *"Raniya Kazi"* $\rightarrow$ *"Front-end Developer / UI Designer"*.
5. **Navigation & Social Entrance (1.5s – 2.2s):** Staggered reveal of navigation items, theme switcher, and tactile social buttons.
6. **Replay Entrance Control:** A discreet floating button at the bottom-right allowing examiners and visitors to replay the cinematic entrance animation at any time.

### 🌗 Dark, Light & System Theme Support
- **Three Modes:** Dark Mode, Light Mode, and System Default.
- **Immediate State Reaction:** Controlled via `ThemeProvider` (`ChangeNotifier`) and Flutter's `ListenableBuilder`.
- **System Preference Detection:** Seamlessly follows device/OS brightness changes when set to System Default (`MediaQuery.platformBrightnessOf(context)`).
- **Persistence Across Refreshes:** User's theme selection is saved via `SharedPreferences`.
- **Theme-Adaptive Hero:** Dark mode retains high-contrast `#D7D8D6` / `#000000` panels; light mode adapts to crisp light tones with high legibility.

### 📱 Full Multi-Device Responsiveness
- **Desktop ($\ge 1024\text{px}$):** 50.5% top width to 41.5% bottom width diagonal split with side-by-side bento layouts.
- **Tablet ($768\text{px} - 1023\text{px}$):** Widened diagonal split (58% top to 48% bottom), touch-friendly targets, and adaptive grids.
- **Mobile ($< 768\text{px}$):** Dynamic top angled panel with bottom portrait anchor, drawer navigation menu, and single-column cards with zero horizontal overflow.

### 💼 Complete Academic & Professional Content
- **About Me:** Professional bio bridging UI/UX design with engineering rigor, accompanied by 4 competency pillars (Design Sensibility, Frontend Engineering, Motion & Interaction, Modern Tooling).
- **Technical Skills:** 3 categorized competency cards (Frontend Architecture, UI/UX Design, Tools & Engineering) with verified stack tags.
- **Education & Background:**
  - **Featured Degree:** Bachelor of Engineering (B.E.) in Computer Science & Engineering (AI & ML) at M. H. Saboo Siddik College of Engineering, University of Mumbai.
  - **Academic Qualifications:** Higher Secondary Certificate (HSC - 78.50%), Secondary School Certificate (SSC - 85.20%), and MHT-CET Entrance (82.45 Percentile).
  - **Hackathon Track Record:** 18+ final-round hackathon sprints, 2 top podium wins, and team leadership across competitive engineering hackathons.
  - **Curiosity Areas:** Applied AI/ML, Flutter Web Architecture, HCI, and Full-Stack Systems.
- **Featured Works:** Detailed case study cards with tags and direct repository/demo links.
- **Contact:** One-click email copy button with toast feedback, direct email trigger, working contact form with validation and submission confirmation state, and social links.

---

## 3. Technology Stack

- **Framework:** Flutter Web 3.47.7 (Channel stable)
- **Language:** Dart 3.13.5
- **UI Architecture:** Material 3, Custom Painters (`LogoPainter`), Custom Clippers (`_DiagonalSplitClipper`)
- **Typography:** Google Fonts (`Plus Jakarta Sans`)
- **State & Persistence:** `ChangeNotifier`, `SharedPreferences`
- **Hosting & Cloud:** Vercel Static Web Hosting (`build/web`)

---

## 4. Local Development

### Prerequisites
- Flutter SDK $\ge 3.24.0$ (installed in environment at `C:\flutter\bin` or added to system `PATH`)
- Google Chrome or Microsoft Edge
- Node.js $\ge 18.0.0$ (optional, for npm helper scripts)

### Running Locally
```bash
# 1. Get dependencies
flutter pub get

# 2. Run on Chrome
flutter run -d chrome

# Alternatively via npm scripts
npm run flutter:dev
```

### Static Analysis & Tests
```bash
# Run static Dart analyzer (0 errors, 0 warnings)
flutter analyze

# Run unit and widget tests
flutter test
```

---

## 5. Production Web Build & Vercel Deployment

### 1. Generate Web Release Bundle
```bash
# Compiles tree-shaken, optimized web output into build/web
flutter build web --release
```

### 2. Output Verification
The generated output directory `build/web` contains:
- `index.html`: Optimized HTML5 shell with viewport settings and preloaded metadata
- `main.dart.js`: Tree-shaken production application JavaScript
- `flutter_bootstrap.js`: Engine bootstrap script
- `assets/`: Bundled fonts, icons, manifests, and Raniya's portrait asset (`assets/raniya-portrait.png`)
- `canvaskit/`: CanvasKit WASM binaries for high-fidelity rendering

### 3. Vercel Configuration (`vercel.json`)
```json
{
  "$schema": "https://openapi.vercel.sh/vercel.json",
  "outputDirectory": "build/web",
  "cleanUrls": true,
  "routes": [
    {
      "src": "/assets/(.*)",
      "headers": {
        "cache-control": "public, max-age=31536000, immutable"
      },
      "continue": true
    },
    {
      "src": "/(.*)\\.js",
      "headers": {
        "cache-control": "public, max-age=31536000, immutable"
      },
      "continue": true
    },
    {
      "handle": "filesystem"
    },
    {
      "src": "/.*",
      "dest": "/index.html"
    }
  ]
}
```

### 4. Deploying to Vercel
#### Option A: Via Vercel CLI
```bash
# Deploy to preview
npx vercel

# Deploy directly to production
npx vercel --prod
```

#### Option B: Via Vercel Web Dashboard (Git Integration)
1. Push this repository to GitHub (`raniya-kazi/raniya-portfolio`).
2. Import the repository in [Vercel](https://vercel.com/new).
3. Under **Build & Development Settings**:
   - **Framework Preset:** Other
   - **Build Command:** `flutter build web --release` (or pre-commit `build/web` and leave empty)
   - **Output Directory:** `build/web`
4. Click **Deploy**. Vercel will serve the application with high-performance global CDN caching and automatic HTTPS.

---

## 6. Verification & Test Summary

| Requirement | Status | Verification Detail |
|---|---|---|
| **Flutter Web Implementation** | ✅ Verified | Pure Dart frontend compiled using Flutter Web 3.47.7 & Dart 3.13.5 |
| **Split-Screen Reference Layout** | ✅ Verified | Custom clipper matching the diagonal split with gray and black panels |
| **Animated Entrance** | ✅ Verified | Staged 2.2s multi-phase timeline with panel slides, portrait reveal, and typography cascade |
| **Dark / Light / System Theme** | ✅ Verified | Accessible 3-option toggle, immediate theme changes, `SharedPreferences` persistence |
| **Multi-Device Responsiveness** | ✅ Verified | LayoutBuilder & Wrap responsive containers tested across desktop, tablet, and mobile viewports |
| **Preserved Content & Info** | ✅ Verified | Raniya Kazi AI & ML degree at MHSSCE, Class X/XII, 18+ hackathons, 2 wins, project links |
| **Contact Form & Email Copy** | ✅ Verified | Interactive form validation, submission success feedback, and 1-click clipboard copy |
| **Static Analysis (`flutter analyze`)** | ✅ Verified | 0 errors, 0 warnings across all project Dart files |
| **Widget Tests (`flutter test`)** | ✅ Verified | All widget tests passed with pumpAndSettle verification |
| **Release Build (`flutter build web`)** | ✅ Verified | Successfully built release bundle in `build/web` |
| **Vercel Preparation (`vercel.json`)** | ✅ Verified | Configured with `outputDirectory: "build/web"`, SPA routing, and caching headers |
| **Browser Interactive Test** | ✅ Verified | Verified live at `http://localhost:8080/` via browser subagent with video recording |
