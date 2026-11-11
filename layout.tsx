import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "BeamNG Mods — Drive. Modify. Dominate.",
  description: "Discover premium vehicles, maps, parts and creator packs for BeamNG.drive.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
