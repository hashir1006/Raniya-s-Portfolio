"use client";

import React, { useState } from "react";
import { portfolioData } from "@/data/portfolio";
import { Mail, MapPin, Copy, Check, Send, Sparkles } from "lucide-react";
import { SocialButton } from "./SocialButton";

export const ContactSection: React.FC = () => {
  const [copied, setCopied] = useState(false);
  const [formSubmitted, setFormSubmitted] = useState(false);
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const copyEmail = () => {
    navigator.clipboard.writeText(portfolioData.contact.email);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.name || !formData.email || !formData.message) return;
    setFormSubmitted(true);
    setTimeout(() => {
      setFormSubmitted(false);
      setFormData({ name: "", email: "", message: "" });
    }, 4000);
  };

  return (
    <section id="contact" className="relative w-full py-28 sm:py-36 bg-[#000000] text-white border-t border-zinc-900">
      <div className="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-16 lg:gap-20">
          {/* Left Column: Direct info & statement */}
          <div className="lg:col-span-5 flex flex-col justify-between">
            <div>
              <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-zinc-900 border border-zinc-800 text-zinc-400 text-xs mb-6 font-medium">
                <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
                {portfolioData.contact.availability}
              </div>

              <h2 className="text-4xl sm:text-5xl font-black tracking-tight text-white mb-6">
                {portfolioData.contact.heading}
              </h2>

              <p className="text-zinc-400 text-base sm:text-lg leading-relaxed mb-8 font-light">
                {portfolioData.contact.description}
              </p>

              {/* Direct Email Card */}
              <div className="p-5 rounded-2xl bg-zinc-950 border border-zinc-850 mb-8 space-y-4">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="p-2.5 rounded-xl bg-zinc-900 text-white">
                      <Mail className="w-5 h-5" />
                    </div>
                    <div>
                      <p className="text-xs text-zinc-500 uppercase tracking-wider font-semibold">Direct Email</p>
                      <a
                        href={portfolioData.socialLinks.email}
                        className="text-sm sm:text-base font-medium text-white hover:underline"
                      >
                        {portfolioData.contact.email}
                      </a>
                    </div>
                  </div>
                  <button
                    onClick={copyEmail}
                    className="p-2 rounded-lg bg-zinc-900 hover:bg-zinc-800 text-zinc-400 hover:text-white transition-colors"
                    title="Copy email address"
                  >
                    {copied ? <Check className="w-4 h-4 text-emerald-400" /> : <Copy className="w-4 h-4" />}
                  </button>
                </div>

                <div className="flex items-center gap-3 pt-3 border-t border-zinc-900 text-xs text-zinc-400">
                  <MapPin className="w-4 h-4 text-zinc-500" />
                  <span>{portfolioData.contact.location}</span>
                </div>
              </div>
            </div>

            {/* Social Buttons matching Hero */}
            <div>
              <p className="text-xs uppercase tracking-widest text-zinc-500 font-semibold mb-4">
                Connect on Socials
              </p>
              <div className="flex items-center gap-4">
                <SocialButton
                  href={portfolioData.socialLinks.email}
                  label="Email Raniya Kazi"
                  icon="email"
                />
                <SocialButton
                  href={portfolioData.socialLinks.github}
                  label="GitHub"
                  icon="github"
                />
                <SocialButton
                  href={portfolioData.socialLinks.linkedin}
                  label="LinkedIn"
                  icon="linkedin"
                />
              </div>
            </div>
          </div>

          {/* Right Column: Contact Form */}
          <div className="lg:col-span-7">
            <div className="p-8 sm:p-10 rounded-3xl bg-zinc-950/80 border border-zinc-800/80 shadow-2xl backdrop-blur-sm">
              <h3 className="text-2xl font-bold text-white tracking-tight mb-2">
                Send a Message
              </h3>
              <p className="text-sm text-zinc-400 mb-8">
                Fill in the details below and I’ll get back to you within 24 hours.
              </p>

              {formSubmitted ? (
                <div className="p-8 rounded-2xl bg-zinc-900/60 border border-emerald-500/30 text-center space-y-3 animate-in fade-in zoom-in duration-300">
                  <div className="w-12 h-12 mx-auto rounded-full bg-emerald-500/10 border border-emerald-500/20 flex items-center justify-center text-emerald-400">
                    <Check className="w-6 h-6" />
                  </div>
                  <h4 className="text-lg font-bold text-white">Message Sent Successfully!</h4>
                  <p className="text-xs sm:text-sm text-zinc-400 max-w-sm mx-auto">
                    Thank you for reaching out. I look forward to connecting with you soon.
                  </p>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-6">
                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-zinc-400 mb-2">
                      Your Name
                    </label>
                    <input
                      type="text"
                      required
                      placeholder="e.g. Alex Morgan"
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                      className="w-full px-4 py-3.5 rounded-xl bg-zinc-900/80 border border-zinc-800 text-white placeholder-zinc-500 focus:outline-none focus:border-white focus:ring-1 focus:ring-white transition-all text-sm"
                    />
                  </div>

                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-zinc-400 mb-2">
                      Email Address
                    </label>
                    <input
                      type="email"
                      required
                      placeholder="e.g. alex@example.com"
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      className="w-full px-4 py-3.5 rounded-xl bg-zinc-900/80 border border-zinc-800 text-white placeholder-zinc-500 focus:outline-none focus:border-white focus:ring-1 focus:ring-white transition-all text-sm"
                    />
                  </div>

                  <div>
                    <label className="block text-xs font-semibold uppercase tracking-wider text-zinc-400 mb-2">
                      Project or Inquiry Details
                    </label>
                    <textarea
                      required
                      rows={4}
                      placeholder="Tell me about your project, timeline, or design goals..."
                      value={formData.message}
                      onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                      className="w-full px-4 py-3.5 rounded-xl bg-zinc-900/80 border border-zinc-800 text-white placeholder-zinc-500 focus:outline-none focus:border-white focus:ring-1 focus:ring-white transition-all text-sm resize-none"
                    />
                  </div>

                  <button
                    type="submit"
                    className="w-full py-4 rounded-xl bg-white text-black font-bold text-xs uppercase tracking-widest hover:bg-zinc-200 transition-colors shadow-lg flex items-center justify-center gap-2 group"
                  >
                    <span>Send Message</span>
                    <Send className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                  </button>
                </form>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
