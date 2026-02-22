# Pricing Section Design

**Date:** 2026-02-22  
**Status:** Approved

## Overview

Add a `#pricing` section to the landing page. The navbar already links to `#pricing` but the section does not exist, creating a broken navigation experience. This design adds a full pricing section with a monthly/annual billing toggle and three tier cards.

## Placement

Insert `<section id="pricing">` between the Features grid (`#features`) and the existing Testimonial section.

## Layout

Three visual layers, top to bottom:

1. **Section header** — title: "Simple, transparent pricing." / subtitle: "Start free. Scale as you grow."
2. **Billing toggle** — pill-shaped `Monthly / Annual` switcher. Annual is selected by default. A "Save 20%" badge (green chip) sits beside the Annual label. The badge pulses briefly via a CSS animation when the user switches to the annual billing cycle.
3. **3-column card grid** — Free | Pro | Business

## Tier Definitions

| | Free | Pro | Business |
|---|---|---|---|
| Monthly price | $0 | $20/mo | $40/mo |
| Annual price | $0 | $16/mo | $32/mo |
| Tagline | For individuals exploring AI coding | For serious developers | For teams & organizations |
| Key features | 2,000 completions/mo, 50 AI requests | Unlimited completions, 500 fast requests, Priority support | Everything in Pro + SSO, Admin controls, Centralized billing |
| CTA label | "Get started free" | "Start free trial" | "Contact sales" |
| CTA style | `.btn-ghost` | `.btn-glow` (primary) | `.btn-ghost` |

The **Pro** card is visually elevated: `--accent-blue` border glow, a "Most Popular" badge pinned at the top edge of the card.

## JavaScript Behavior

- A click listener on the billing toggle (in `script.js`, inside the existing `DOMContentLoaded` block).
- Each price `<span>` carries `data-monthly` and `data-annual` attributes.
- On toggle, iterate all price elements and swap displayed text based on current billing mode.
- Toggle state tracked with a boolean (`isAnnual`).
- The toggle pill slides via a CSS transition on `.toggle-btn.active`.

## CSS

All new rules appended to `style.css`. New selectors:

- `.pricing-section` — section padding, centered layout
- `.billing-toggle` — pill container, flex row
- `.toggle-btn` — individual Monthly/Annual button, transitions
- `.toggle-btn.active` — active state with blue background
- `.save-badge` — green "Save 20%" chip, brief pulse animation on activation
- `.pricing-grid` — 3-column responsive grid (single column on mobile)
- `.pricing-card` — inherits `.glass-panel`, padding, flex column
- `.pricing-card.featured` — accent-blue border, slight upward translate on hover
- `.popular-badge` — "Most Popular" label pinned at card top
- `.price-amount` — large display font for the price number
- `.feature-list` — list with checkmark icons per feature item

All values use existing design tokens (`--accent-blue`, `--accent-purple`, `--bg-elevated`, `--text-muted`, etc.). No new tokens needed.

## Constraints

- Vanilla HTML/CSS/JS only — no frameworks, no build tools
- All markup in `index.html`, styles in `style.css`, logic in `script.js`
- Icons via Lucide (`data-lucide="check"` for feature checkmarks)
- Mobile-first: grid collapses to single column below 768px breakpoint
