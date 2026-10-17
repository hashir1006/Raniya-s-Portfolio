import type { Metadata } from "next";
import { Plus_Jakarta_Sans } from "next/font/google";
import "./globals.css";

const plusJakartaSans = Plus_Jakarta_Sans({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
  variable: "--font-sans",
});

export const viewport = {
  width: "device-width",
  initialScale: 1,
  maximumScale: 5,
};

export const metadata: Metadata = {
  title: "Raniya Kazi — Frontend Developer / UI Designer",
  description:
    "Personal portfolio of Raniya Kazi. Frontend developer and UI designer crafting minimalist digital experiences with fluid motion and modern engineering.",
  keywords: [
    "Raniya Kazi",
    "Frontend Developer",
    "UI Designer",
    "Portfolio",
    "React",
    "Next.js",
    "TypeScript",
    "Motion",
  ],
  authors: [{ name: "Raniya Kazi" }],
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${plusJakartaSans.variable} scroll-smooth antialiased`}>
      <body className="min-h-screen bg-black text-white font-sans selection:bg-black selection:text-white overflow-x-hidden">
        {children}
      </body>
    </html>
  );
}
