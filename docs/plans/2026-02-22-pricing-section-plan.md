# Implementation Plan: Pricing Section

**Date:** 2026-02-22  
**Design doc:** [2026-02-22-pricing-section-design.md](2026-02-22-pricing-section-design.md)

## Overview

Add a `#pricing` section with a monthly/annual billing toggle and three tier cards (Free, Pro, Business). Changes span `index.html`, `style.css`, and `script.js`.

---

## Step 1 — HTML: Add the pricing section to `index.html`

Insert a `<section id="pricing">` block between `</section>` (end of `#features`) and `<section class="testimonial-section">`.

**Structure:**

```html
<section class="pricing-section" id="pricing">
  <h2 class="section-title">Simple, transparent pricing.</h2>
  <p class="section-subtitle">Start free. Scale as you grow.</p>

  <!-- Billing toggle -->
  <div class="billing-toggle">
    <button class="toggle-btn" id="toggleMonthly">Monthly</button>
    <button class="toggle-btn active" id="toggleAnnual">Annual</button>
    <span class="save-badge" id="saveBadge">Save 20%</span>
  </div>

  <!-- 3-column card grid -->
  <div class="pricing-grid">

    <!-- Free -->
    <div class="pricing-card glass-panel">
      <h3 class="tier-name">Hobby</h3>
      <p class="tier-desc">For individuals exploring AI coding</p>
      <div class="price-display">
        <span class="price-amount" data-monthly="$0" data-annual="$0">$0</span>
        <span class="price-period">/mo</span>
      </div>
      <button class="btn btn-ghost btn-large">Get started free</button>
      <ul class="feature-list">
        <li><i data-lucide="check"></i> 2,000 completions / month</li>
        <li><i data-lucide="check"></i> 50 slow AI requests</li>
        <li><i data-lucide="check"></i> Community support</li>
      </ul>
    </div>

    <!-- Pro (featured) -->
    <div class="pricing-card glass-panel featured">
      <div class="popular-badge">Most Popular</div>
      <h3 class="tier-name">Pro</h3>
      <p class="tier-desc">For serious developers</p>
      <div class="price-display">
        <span class="price-amount" data-monthly="$20" data-annual="$16">$16</span>
        <span class="price-period">/mo</span>
      </div>
      <button class="btn btn-glow btn-large">Start free trial</button>
      <ul class="feature-list">
        <li><i data-lucide="check"></i> Unlimited completions</li>
        <li><i data-lucide="check"></i> 500 fast AI requests / month</li>
        <li><i data-lucide="check"></i> Priority support</li>
        <li><i data-lucide="check"></i> Everything in Hobby</li>
      </ul>
    </div>

    <!-- Business -->
    <div class="pricing-card glass-panel">
      <h3 class="tier-name">Business</h3>
      <p class="tier-desc">For teams & organizations</p>
      <div class="price-display">
        <span class="price-amount" data-monthly="$40" data-annual="$32">$32</span>
        <span class="price-period">/mo</span>
      </div>
      <button class="btn btn-ghost btn-large">Contact sales</button>
      <ul class="feature-list">
        <li><i data-lucide="check"></i> Everything in Pro</li>
        <li><i data-lucide="check"></i> SSO / SAML</li>
        <li><i data-lucide="check"></i> Admin controls</li>
        <li><i data-lucide="check"></i> Centralized billing</li>
      </ul>
    </div>

  </div>
</section>
```

After inserting, call `lucide.createIcons()` — it is already called once at the bottom of `<body>`, so no change needed there.

---

## Step 2 — CSS: Add pricing styles to `style.css`

Append all new rules to the end of `style.css`. No existing rules to modify.

**Selectors and rules to add:**

```css
/* ── Pricing Section ─────────────────────────────────────────── */
.pricing-section {
    padding: 120px 24px;
    max-width: 1100px;
    margin: 0 auto;
    text-align: center;
}

.section-subtitle {
    color: var(--text-muted);
    font-size: 1.125rem;
    margin-top: 12px;
    margin-bottom: 48px;
}

/* Billing toggle */
.billing-toggle {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    background: var(--bg-elevated);
    border: 1px solid var(--border-subtle);
    border-radius: 999px;
    padding: 4px;
    margin-bottom: 64px;
}

.toggle-btn {
    background: transparent;
    border: none;
    color: var(--text-muted);
    font-family: var(--font-ui);
    font-size: 0.875rem;
    font-weight: 500;
    padding: 8px 20px;
    border-radius: 999px;
    cursor: pointer;
    transition: background 0.2s, color 0.2s;
}

.toggle-btn.active {
    background: var(--accent-blue);
    color: #fff;
}

.save-badge {
    background: rgba(16, 185, 129, 0.15);
    color: #10b981;
    font-size: 0.75rem;
    font-weight: 600;
    padding: 4px 10px;
    border-radius: 999px;
    margin-left: 8px;
}

@keyframes pulse-badge {
    0%   { transform: scale(1); }
    50%  { transform: scale(1.12); }
    100% { transform: scale(1); }
}

.save-badge.pulse {
    animation: pulse-badge 0.3s ease;
}

/* Pricing grid */
.pricing-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
    align-items: start;
}

@media (max-width: 768px) {
    .pricing-grid {
        grid-template-columns: 1fr;
    }
}

/* Pricing cards */
.pricing-card {
    display: flex;
    flex-direction: column;
    gap: 16px;
    padding: 36px 28px;
    text-align: left;
    position: relative;
    transition: transform 0.2s, box-shadow 0.2s;
}

.pricing-card.featured {
    border-color: var(--accent-blue);
    box-shadow: 0 0 32px rgba(59, 130, 246, 0.15);
    transform: translateY(-8px);
}

.pricing-card.featured:hover {
    transform: translateY(-12px);
    box-shadow: 0 0 48px rgba(59, 130, 246, 0.25);
}

.popular-badge {
    position: absolute;
    top: -14px;
    left: 50%;
    transform: translateX(-50%);
    background: var(--accent-blue);
    color: #fff;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    padding: 4px 16px;
    border-radius: 999px;
    white-space: nowrap;
}

.tier-name {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-primary);
}

.tier-desc {
    font-size: 0.875rem;
    color: var(--text-muted);
    margin-top: -8px;
}

.price-display {
    display: flex;
    align-items: baseline;
    gap: 4px;
    margin: 8px 0;
}

.price-amount {
    font-size: 2.75rem;
    font-weight: 800;
    color: var(--text-primary);
    line-height: 1;
    transition: opacity 0.15s;
}

.price-period {
    font-size: 1rem;
    color: var(--text-muted);
}

.pricing-card .btn {
    width: 100%;
    justify-content: center;
    margin-top: 4px;
}

/* Feature list */
.feature-list {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-top: 8px;
}

.feature-list li {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.9rem;
    color: var(--text-muted);
}

.feature-list li i {
    color: var(--accent-blue);
    flex-shrink: 0;
    width: 16px;
    height: 16px;
}
```

---

## Step 3 — JS: Add billing toggle logic to `script.js`

Append inside the existing `DOMContentLoaded` block, after the smooth scroll listener.

```js
// 5. Pricing billing toggle
const toggleMonthly = document.getElementById('toggleMonthly');
const toggleAnnual  = document.getElementById('toggleAnnual');
const saveBadge     = document.getElementById('saveBadge');
const priceAmounts  = document.querySelectorAll('.price-amount');

let isAnnual = true;

function updatePrices() {
    priceAmounts.forEach(el => {
        el.textContent = isAnnual ? el.dataset.annual : el.dataset.monthly;
    });
    toggleAnnual.classList.toggle('active', isAnnual);
    toggleMonthly.classList.toggle('active', !isAnnual);
    saveBadge.style.display = isAnnual ? '' : 'none';
}

toggleAnnual.addEventListener('click', () => {
    if (!isAnnual) {
        isAnnual = true;
        updatePrices();
        saveBadge.classList.remove('pulse');
        void saveBadge.offsetWidth; // reflow to restart animation
        saveBadge.classList.add('pulse');
    }
});

toggleMonthly.addEventListener('click', () => {
    if (isAnnual) {
        isAnnual = false;
        updatePrices();
    }
});
```

---

## Step 4 — Verify

1. Open the page in a browser (e.g. via `php -S localhost:8000` or Live Server).
2. Confirm the navbar "Pricing" link scrolls to the new section.
3. Toggle between Monthly and Annual — prices should update and `save-badge` should pulse.
4. Resize below 768px — grid should collapse to a single column.
5. Confirm checkmark icons render (Lucide `check` icon).
6. No linter errors in the edited files.

---

## Files Changed

| File | Change |
|---|---|
| `index.html` | Insert `<section id="pricing">` block |
| `style.css` | Append pricing styles (≈ 120 lines) |
| `script.js` | Append billing toggle handler inside `DOMContentLoaded` |
