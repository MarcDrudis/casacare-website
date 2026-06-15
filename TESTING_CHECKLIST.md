# Testing Checklist

Use this comprehensive checklist to verify that your Hugo website is properly set up and all features are working correctly.

## Pre-Deployment Testing

### ✅ Installation Verification

- [ ] **Hugo is installed**
  ```bash
  hugo version
  # Should show v0.92.0 or higher
  ```

- [ ] **Hugo Extended version** (required for SCSS processing)
  ```bash
  hugo version | grep extended
  # Should show "extended" in the output
  ```

- [ ] **Theme is installed**
  ```bash
  ls themes/hugo-universal-theme
  # Should list theme files
  ```

- [ ] **Git is installed** (for version control)
  ```bash
  git --version
  ```

### ✅ Configuration Verification

- [ ] **config.toml exists** and is valid
  ```bash
  hugo config
  # Should display configuration without errors
  ```

- [ ] **Base URL is set correctly**
  - Check `baseURL` in config.toml
  - Should match your domain or localhost for testing

- [ ] **All 6 languages are configured**
  - English (en)
  - Spanish (es)
  - Catalan (ca)
  - German (de)
  - French (fr)
  - Italian (it)

- [ ] **Default language is set** (`defaultContentLanguage = "en"`)

- [ ] **Theme is specified** (`theme = "hugo-universal-theme"`)

- [ ] **Contact information is correct**
  - Email address
  - Phone number
  - Physical address

### ✅ Content Files Verification

Check that all content files exist:

**Homepage (6 files):**
- [ ] `content/_index.en.md`
- [ ] `content/_index.es.md`
- [ ] `content/_index.ca.md`
- [ ] `content/_index.de.md`
- [ ] `content/_index.fr.md`
- [ ] `content/_index.it.md`

**About Us (6 files):**
- [ ] `content/about/_index.en.md`
- [ ] `content/about/_index.es.md`
- [ ] `content/about/_index.ca.md`
- [ ] `content/about/_index.de.md`
- [ ] `content/about/_index.fr.md`
- [ ] `content/about/_index.it.md`

**Services (6 files):**
- [ ] `content/services/_index.en.md`
- [ ] `content/services/_index.es.md`
- [ ] `content/services/_index.ca.md`
- [ ] `content/services/_index.de.md`
- [ ] `content/services/_index.fr.md`
- [ ] `content/services/_index.it.md`

**Our Fees (6 files):**
- [ ] `content/fees/_index.en.md`
- [ ] `content/fees/_index.es.md`
- [ ] `content/fees/_index.ca.md`
- [ ] `content/fees/_index.de.md`
- [ ] `content/fees/_index.fr.md`
- [ ] `content/fees/_index.it.md`

**Payroll (6 files):**
- [ ] `content/payroll/_index.en.md`
- [ ] `content/payroll/_index.es.md`
- [ ] `content/payroll/_index.ca.md`
- [ ] `content/payroll/_index.de.md`
- [ ] `content/payroll/_index.fr.md`
- [ ] `content/payroll/_index.it.md`

**Contact (6 files):**
- [ ] `content/contact/_index.en.md`
- [ ] `content/contact/_index.es.md`
- [ ] `content/contact/_index.ca.md`
- [ ] `content/contact/_index.de.md`
- [ ] `content/contact/_index.fr.md`
- [ ] `content/contact/_index.it.md`

**Total: 36 content files**

### ✅ Translation Files Verification

- [ ] `i18n/en.toml` exists and contains all translations
- [ ] `i18n/es.toml` exists and contains all translations
- [ ] `i18n/ca.toml` exists and contains all translations
- [ ] `i18n/de.toml` exists and contains all translations
- [ ] `i18n/fr.toml` exists and contains all translations
- [ ] `i18n/it.toml` exists and contains all translations

**Required translation keys in each file:**
- [ ] `home` (Home)
- [ ] `about` (About Us)
- [ ] `services` (Services)
- [ ] `fees` (Our Fees)
- [ ] `payroll` (Payroll)
- [ ] `contact` (Contact)
- [ ] `language` (Language)
- [ ] `readMore` (Read More)
- [ ] `getInTouch` (Get in Touch)
- [ ] `contactInfo` (Contact Information)

### ✅ Image Files Verification

Check that all images exist in `static/images/`:

- [ ] `static/images/homepage.jpg`
- [ ] `static/images/aboutus.jpg`
- [ ] `static/images/services.jpg`
- [ ] `static/images/fees.jpg`
- [ ] `static/images/payroll.jpg`
- [ ] `static/images/contact.jpg`

**Image quality check:**
- [ ] Images are properly sized (not too large)
- [ ] Images are optimized for web
- [ ] Images have appropriate resolution
- [ ] Images are in correct format (JPG/PNG)

### ✅ Layout Files Verification

- [ ] `layouts/index.html` (Homepage template)
- [ ] `layouts/about/list.html` (About page template)
- [ ] `layouts/services/list.html` (Services page template)
- [ ] `layouts/fees/list.html` (Fees page template)
- [ ] `layouts/payroll/list.html` (Payroll page template)
- [ ] `layouts/contact/list.html` (Contact page template)

**Partial templates:**
- [ ] `layouts/partials/hero.html`
- [ ] `layouts/partials/features.html`
- [ ] `layouts/partials/pricing-cards.html`

### ✅ CSS Verification

- [ ] `static/css/custom.css` exists
- [ ] Custom colors are defined (blue #1E3A8A, gold #F59E0B)
- [ ] Responsive styles are included
- [ ] Pricing card styles are present

---

## Development Server Testing

Start the development server:
```bash
hugo server -D
```

### ✅ Server Startup

- [ ] Server starts without errors
- [ ] Server is accessible at `http://localhost:1313`
- [ ] No error messages in terminal
- [ ] Hot reload is working (make a change and verify auto-refresh)

### ✅ Homepage Testing (All Languages)

Test each language version:

**English (`/en/`):**
- [ ] Page loads correctly
- [ ] Hero section displays with image
- [ ] Features section displays
- [ ] Content is in English
- [ ] Navigation menu works
- [ ] Language switcher shows all 6 languages

**Spanish (`/es/`):**
- [ ] Page loads correctly
- [ ] Content is in Spanish
- [ ] All sections display properly
- [ ] Navigation works

**Catalan (`/ca/`):**
- [ ] Page loads correctly
- [ ] Content is in Catalan
- [ ] All sections display properly
- [ ] Navigation works

**German (`/de/`):**
- [ ] Page loads correctly
- [ ] Content is in German
- [ ] All sections display properly
- [ ] Navigation works

**French (`/fr/`):**
- [ ] Page loads correctly
- [ ] Content is in French
- [ ] All sections display properly
- [ ] Navigation works

**Italian (`/it/`):**
- [ ] Page loads correctly
- [ ] Content is in Italian
- [ ] All sections display properly
- [ ] Navigation works

### ✅ About Us Page Testing

For each language (`/en/about/`, `/es/about/`, etc.):

- [ ] Page loads correctly
- [ ] Hero image displays
- [ ] Content is properly formatted
- [ ] Text is in correct language
- [ ] Navigation works
- [ ] Language switcher works

### ✅ Services Page Testing

For each language (`/en/services/`, `/es/services/`, etc.):

- [ ] Page loads correctly
- [ ] Hero image displays
- [ ] Service list displays
- [ ] Content is properly formatted
- [ ] Text is in correct language
- [ ] Navigation works

### ✅ Our Fees Page Testing

For each language (`/en/fees/`, `/es/fees/`, etc.):

- [ ] Page loads correctly
- [ ] Hero image displays
- [ ] **Pricing cards display correctly**
- [ ] All 3 pricing tiers show:
  - [ ] Basic Plan
  - [ ] Standard Plan
  - [ ] Premium Plan
- [ ] Prices are visible
- [ ] Features list displays
- [ ] "Get Started" buttons work
- [ ] Cards are properly styled (blue/gold colors)
- [ ] Content is in correct language

### ✅ Payroll Page Testing

For each language (`/en/payroll/`, `/es/payroll/`, etc.):

- [ ] Page loads correctly
- [ ] Hero image displays
- [ ] Content is properly formatted
- [ ] Text is in correct language
- [ ] Navigation works

### ✅ Contact Page Testing

For each language (`/en/contact/`, `/es/contact/`, etc.):

- [ ] Page loads correctly
- [ ] Hero image displays
- [ ] Contact information displays:
  - [ ] Email address
  - [ ] Phone number
  - [ ] Physical address
- [ ] Content is in correct language
- [ ] All contact details are correct

### ✅ Navigation Testing

- [ ] **Top navigation menu** displays on all pages
- [ ] All menu items are clickable
- [ ] Menu items link to correct pages
- [ ] Active page is highlighted
- [ ] Menu is responsive (mobile view)
- [ ] Mobile menu toggle works

### ✅ Language Switcher Testing

- [ ] Language switcher appears on all pages
- [ ] All 6 languages are listed
- [ ] Clicking a language switches to that language
- [ ] Current language is highlighted
- [ ] Language switch maintains current page context
- [ ] URLs change correctly (e.g., `/en/about/` → `/es/about/`)

### ✅ Responsive Design Testing

Test on different screen sizes:

**Desktop (1920x1080):**
- [ ] Layout is proper
- [ ] Images scale correctly
- [ ] Text is readable
- [ ] Navigation is horizontal
- [ ] Pricing cards are in a row

**Tablet (768x1024):**
- [ ] Layout adapts properly
- [ ] Images scale correctly
- [ ] Text is readable
- [ ] Navigation may collapse
- [ ] Pricing cards stack appropriately

**Mobile (375x667):**
- [ ] Layout is mobile-friendly
- [ ] Images scale correctly
- [ ] Text is readable without zooming
- [ ] Navigation collapses to hamburger menu
- [ ] Pricing cards stack vertically
- [ ] Touch targets are adequate (44x44px minimum)

### ✅ Color Scheme Verification

- [ ] Primary blue (#1E3A8A) is used consistently
- [ ] Secondary gold (#F59E0B) is used for accents
- [ ] Text color is readable (#1F2937)
- [ ] Contrast ratios meet accessibility standards
- [ ] Hover states are visible
- [ ] Links are distinguishable

### ✅ Image Loading Testing

- [ ] All images load correctly
- [ ] No broken image icons
- [ ] Images have appropriate alt text
- [ ] Images are properly sized (not stretched/squashed)
- [ ] Images load reasonably fast
- [ ] Hero images display full-width

### ✅ Performance Testing

- [ ] Pages load quickly (< 3 seconds)
- [ ] No console errors in browser
- [ ] No 404 errors for resources
- [ ] CSS loads correctly
- [ ] JavaScript (if any) loads correctly
- [ ] Images are optimized

---

## Build Testing

Build the site for production:
```bash
hugo --minify
```

### ✅ Build Process

- [ ] Build completes without errors
- [ ] `public/` directory is created
- [ ] All pages are generated
- [ ] All languages are generated
- [ ] Assets are minified
- [ ] No warning messages

### ✅ Generated Files Verification

Check that `public/` directory contains:

- [ ] `index.html` (redirects to default language)
- [ ] `en/index.html` (English homepage)
- [ ] `es/index.html` (Spanish homepage)
- [ ] `ca/index.html` (Catalan homepage)
- [ ] `de/index.html` (German homepage)
- [ ] `fr/index.html` (French homepage)
- [ ] `it/index.html` (Italian homepage)
- [ ] All page subdirectories for each language
- [ ] `css/` directory with styles
- [ ] `images/` directory with images
- [ ] `sitemap.xml`
- [ ] `robots.txt` (if configured)

### ✅ Static File Server Testing

Serve the built site:
```bash
cd public
python3 -m http.server 8000
```

Then test at `http://localhost:8000`:

- [ ] Site loads correctly
- [ ] All pages are accessible
- [ ] All languages work
- [ ] Images load
- [ ] CSS is applied
- [ ] Navigation works
- [ ] No console errors

---

## Browser Compatibility Testing

Test in multiple browsers:

### ✅ Chrome/Edge (Chromium)

- [ ] All pages load correctly
- [ ] Layout is proper
- [ ] Images display
- [ ] Navigation works
- [ ] Language switcher works
- [ ] No console errors

### ✅ Firefox

- [ ] All pages load correctly
- [ ] Layout is proper
- [ ] Images display
- [ ] Navigation works
- [ ] Language switcher works
- [ ] No console errors

### ✅ Safari (if available)

- [ ] All pages load correctly
- [ ] Layout is proper
- [ ] Images display
- [ ] Navigation works
- [ ] Language switcher works
- [ ] No console errors

### ✅ Mobile Browsers

- [ ] Chrome Mobile
- [ ] Safari Mobile (iOS)
- [ ] Firefox Mobile
- [ ] Samsung Internet

---

## Accessibility Testing

### ✅ Keyboard Navigation

- [ ] Can navigate using Tab key
- [ ] Focus indicators are visible
- [ ] Can activate links with Enter
- [ ] Can use language switcher with keyboard
- [ ] No keyboard traps

### ✅ Screen Reader Testing

- [ ] Page titles are descriptive
- [ ] Headings are properly structured (H1, H2, H3)
- [ ] Images have alt text
- [ ] Links have descriptive text
- [ ] Language is properly declared

### ✅ Color Contrast

- [ ] Text has sufficient contrast (4.5:1 minimum)
- [ ] Links are distinguishable
- [ ] Buttons have sufficient contrast
- [ ] Focus indicators are visible

---

## SEO Testing

### ✅ Meta Tags

For each page:
- [ ] Has unique `<title>` tag
- [ ] Has meta description
- [ ] Has proper heading hierarchy
- [ ] Has language declaration (`lang` attribute)

### ✅ Sitemap

- [ ] `sitemap.xml` is generated
- [ ] Contains all pages
- [ ] Contains all languages
- [ ] Is accessible at `/sitemap.xml`

### ✅ URLs

- [ ] URLs are clean and descriptive
- [ ] No broken links
- [ ] Language codes in URLs are correct
- [ ] Canonical URLs are set (if applicable)

---

## Content Verification

### ✅ Text Content

- [ ] No spelling errors
- [ ] No grammar errors
- [ ] Consistent terminology
- [ ] Proper formatting (bold, italic, lists)
- [ ] Correct contact information

### ✅ Translations

- [ ] All content is translated
- [ ] Translations are accurate
- [ ] No untranslated text
- [ ] Cultural appropriateness
- [ ] Consistent tone across languages

### ✅ Pricing Information

- [ ] Prices are correct
- [ ] Currency is specified
- [ ] Features are accurate
- [ ] Call-to-action buttons work
- [ ] Pricing is consistent across languages

---

## Security Testing

### ✅ HTTPS (Post-Deployment)

- [ ] Site loads over HTTPS
- [ ] HTTP redirects to HTTPS
- [ ] SSL certificate is valid
- [ ] No mixed content warnings
- [ ] Security headers are set

### ✅ Content Security

- [ ] No sensitive information exposed
- [ ] No debug information visible
- [ ] No commented-out code in production
- [ ] No test data visible

---

## Performance Benchmarks

Use [PageSpeed Insights](https://pagespeed.web.dev/):

### ✅ Desktop Performance

- [ ] Performance score > 90
- [ ] First Contentful Paint < 1.8s
- [ ] Largest Contentful Paint < 2.5s
- [ ] Total Blocking Time < 200ms
- [ ] Cumulative Layout Shift < 0.1

### ✅ Mobile Performance

- [ ] Performance score > 80
- [ ] First Contentful Paint < 2.5s
- [ ] Largest Contentful Paint < 4.0s
- [ ] Total Blocking Time < 300ms
- [ ] Cumulative Layout Shift < 0.1

---

## Final Verification

### ✅ Pre-Launch Checklist

- [ ] All content is finalized
- [ ] All translations are complete
- [ ] All images are optimized
- [ ] Contact information is correct
- [ ] Pricing information is accurate
- [ ] No test/placeholder content
- [ ] Analytics is configured (if applicable)
- [ ] Favicon is set
- [ ] Social media meta tags (if applicable)

### ✅ Post-Deployment Checklist

- [ ] Site is accessible at production URL
- [ ] All pages load correctly
- [ ] All languages work
- [ ] HTTPS is working
- [ ] DNS is properly configured
- [ ] Email addresses work
- [ ] Phone numbers are correct
- [ ] Google Search Console is set up (optional)
- [ ] Analytics is tracking (if configured)

---

## Testing Tools

### Recommended Tools

- **Hugo**: `hugo server` for development
- **Browser DevTools**: For debugging and testing
- **PageSpeed Insights**: https://pagespeed.web.dev/
- **Mobile-Friendly Test**: https://search.google.com/test/mobile-friendly
- **WAVE**: https://wave.webaim.org/ (accessibility)
- **SSL Labs**: https://www.ssllabs.com/ssltest/ (SSL testing)
- **Dead Link Checker**: https://www.deadlinkchecker.com/
- **GTmetrix**: https://gtmetrix.com/ (performance)

### Command-Line Tools

```bash
# Check Hugo version
hugo version

# Validate configuration
hugo config

# Build and check for errors
hugo --minify

# Serve production build
hugo server --renderToDisk

# Check for broken links (requires htmltest)
hugo && htmltest
```

---

## Issue Tracking

Use this section to track any issues found during testing:

| Issue # | Description | Severity | Status | Notes |
|---------|-------------|----------|--------|-------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

**Severity Levels:**
- **Critical**: Site is broken or unusable
- **High**: Major feature doesn't work
- **Medium**: Minor feature issue or cosmetic problem
- **Low**: Nice-to-have improvement

---

## Sign-Off

Once all items are checked and verified:

- [ ] All critical issues resolved
- [ ] All high-priority issues resolved
- [ ] Site is ready for deployment
- [ ] Documentation is complete
- [ ] Team has been notified

**Tested by**: ___________________  
**Date**: ___________________  
**Approved by**: ___________________  
**Date**: ___________________

---

**Last Updated**: April 2026