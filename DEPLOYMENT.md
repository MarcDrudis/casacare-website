# Deployment Guide

This guide provides step-by-step instructions for deploying your Hugo website to Netlify with Git.

## Table of Contents

1. [Git Setup](#git-setup)
2. [Netlify Deployment (Recommended)](#netlify-deployment-recommended)
3. [Domain Configuration](#domain-configuration)
4. [SSL/HTTPS Setup](#sslhttps-setup)
5. [Post-Deployment Checklist](#post-deployment-checklist)
6. [Troubleshooting](#troubleshooting)

---

## Git Setup

Before deploying to Netlify, you need to set up Git for your project.

### Step 1: Initialize Git Repository

**IMPORTANT**: The project already has `.gitignore` and `netlify.toml` files configured. Follow these steps:

1. **Initialize Git** in your project directory:

```bash
cd /home/marc/Code/mmm/website
git init
```

2. **Configure Git** (if not already done):

```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

3. **Review what will be committed**:

```bash
git status
```

You should see:
- ✅ All source files (content/, layouts/, static/, etc.)
- ✅ Configuration files (config.toml, netlify.toml)
- ✅ Documentation files
- ❌ `public/` directory (excluded by .gitignore)
- ❌ `.hugo_build.lock` (excluded by .gitignore)
- ❌ OS and editor files (excluded by .gitignore)

4. **Add all files to Git**:

```bash
git add .
```

5. **Create initial commit**:

```bash
git commit -m "Initial commit: Hugo website with multilingual support"
```

### Step 2: Create GitHub Repository

1. **Go to GitHub** and create a new repository:
   - Repository name: `casacare-website` (or your preferred name)
   - Description: "CasaCare Professional Household Management Services Website"
   - Visibility: Private or Public (your choice)
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)

2. **Connect local repository to GitHub**:

```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/casacare-website.git

# Verify remote was added
git remote -v
```

3. **Push to GitHub**:

```bash
# For first push, set upstream
git push -u origin main

# Or if your default branch is 'master'
git push -u origin master
```

### Step 3: Verify Repository

1. **Check GitHub** to ensure all files are uploaded
2. **Verify `.gitignore` is working** - `public/` directory should NOT be in the repository
3. **Confirm `netlify.toml` is present** in the root directory

---

## Netlify Deployment (Recommended)

Netlify offers the easiest deployment with automatic builds, free SSL, and excellent performance.

### Prerequisites

✅ Git repository set up (completed above)
✅ GitHub account
✅ Netlify account (free tier available - sign up at [netlify.com](https://www.netlify.com/))

### Configuration Files Already Created

Your project includes these pre-configured files:

1. **`.gitignore`** - Excludes build artifacts and unnecessary files
2. **`netlify.toml`** - Netlify build configuration with:
   - Hugo version: 0.121.0 (extended)
   - Build command: `hugo --minify`
   - Publish directory: `public`
   - Automatic redirects for multilingual support
   - Security headers
   - Cache optimization

### Step 1: Connect Repository to Netlify

1. **Log in to Netlify** at [app.netlify.com](https://app.netlify.com/)

2. **Click "Add new site"** → **"Import an existing project"**

3. **Choose Git provider**: Select "GitHub"

4. **Authorize Netlify**: Grant Netlify access to your GitHub repositories

5. **Select repository**: Choose your `casacare-website` repository

### Step 2: Configure Build Settings

Netlify should **automatically detect** settings from `netlify.toml`. Verify:

- ✅ **Build command**: `hugo --minify`
- ✅ **Publish directory**: `public`
- ✅ **Hugo version**: 0.121.0 (set in netlify.toml)

**No manual configuration needed** - everything is in `netlify.toml`!

### Step 3: Deploy

1. **Click "Deploy site"**

2. **Monitor build progress**:
   - Build typically takes 1-2 minutes
   - Watch the build log for any errors
   - First build may take slightly longer

3. **Build success indicators**:
   - ✅ "Site is live" message
   - ✅ Random Netlify URL (e.g., `random-name-123.netlify.app`)
   - ✅ Green checkmark on deploy

4. **Test your site**:
   - Click the generated URL
   - Verify homepage loads
   - Test language switcher (English ↔ Catalan)
   - Check all pages load correctly

### Step 4: Configure Site Name (Optional)

1. **Go to Site settings** → **General** → **Site details**

2. **Click "Change site name"**

3. **Enter custom name**: e.g., `casacare` → `casacare.netlify.app`

4. **Save changes**

### Step 2: Connect to Netlify

1. Go to [netlify.com](https://www.netlify.com/) and sign up/log in
2. Click **"Add new site"** → **"Import an existing project"**
3. Choose your Git provider (GitHub, GitLab, or Bitbucket)
4. Authorize Netlify to access your repositories
5. Select your website repository

### Step 3: Configure Build Settings

Netlify should auto-detect your settings from `netlify.toml`, but verify:

- **Build command**: `hugo --gc --minify`
- **Publish directory**: `public`
- **Hugo version**: `0.123.0` (or your version)

### Step 4: Deploy

1. Click **"Deploy site"**
2. Wait for the build to complete (usually 1-2 minutes)
3. Your site will be live at a random Netlify subdomain (e.g., `random-name-123.netlify.app`)

### Step 5: Configure Custom Domain (Optional)

1. In Netlify dashboard, go to **Site settings** → **Domain management**
2. Click **"Add custom domain"**
3. Enter your domain name (e.g., `yourdomain.com`)
4. Follow DNS configuration instructions (see [Domain Configuration](#domain-configuration))

### Step 6: Enable HTTPS

1. In **Domain management**, scroll to **HTTPS**
2. Click **"Verify DNS configuration"**
3. Click **"Provision certificate"**
4. SSL certificate will be automatically issued (takes a few minutes)

### Continuous Deployment

Netlify automatically rebuilds your site when you push to your repository:

```bash
# Make changes to your site
git add .
git commit -m "Update content"
git push origin main
# Netlify automatically rebuilds and deploys
```


---

## Domain Configuration

### DNS Settings for Netlify

Add these DNS records at your domain registrar:

**For apex domain (yourdomain.com):**
```
Type: A
Name: @
Value: 75.2.60.5
```

**For www subdomain:**
```
Type: CNAME
Name: www
Value: your-site.netlify.app
```

### DNS Settings for Vercel

```
Type: A
Name: @
Value: 76.76.21.21

Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

### DNS Settings for GitHub Pages

```
Type: A
Name: @
Value: 185.199.108.153
Value: 185.199.109.153
Value: 185.199.110.153
Value: 185.199.111.153

Type: CNAME
Name: www
Value: yourusername.github.io
```

### DNS Propagation

- DNS changes can take 24-48 hours to propagate globally
- Check propagation status: [whatsmydns.net](https://www.whatsmydns.net/)
- Most changes are visible within 1-2 hours

---

## SSL/HTTPS Setup

### Netlify/Vercel (Automatic)

SSL certificates are automatically provisioned and renewed. No action needed.

### GitHub Pages (Automatic)

1. Go to repository **Settings** → **Pages**
2. Check **"Enforce HTTPS"**
3. Certificate is automatically issued

### Traditional Hosting

**Option 1: Let's Encrypt (Free)**

Most cPanel hosts offer free Let's Encrypt SSL:

1. Log in to cPanel
2. Find **SSL/TLS Status** or **Let's Encrypt**
3. Select your domain
4. Click **Install** or **Issue**

**Option 2: Purchased SSL Certificate**

1. Purchase SSL from your hosting provider or third party
2. Generate CSR in cPanel
3. Submit CSR to certificate authority
4. Install certificate in cPanel

**Force HTTPS:**

Add to `.htaccess`:
```apache
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
```

---

## Post-Deployment Checklist

After deploying, verify the following:

### Functionality Tests

- [ ] All 6 pages load correctly
- [ ] All 6 languages are accessible
- [ ] Language switcher works
- [ ] Navigation menu works on all pages
- [ ] Images load properly
- [ ] Pricing cards display correctly
- [ ] Contact information is correct
- [ ] Links work (internal and external)

### Performance Tests

- [ ] Page load time < 3 seconds
- [ ] Images are optimized
- [ ] CSS/JS is minified
- [ ] Compression is enabled
- [ ] Browser caching is configured

### SEO Tests

- [ ] Meta titles are present
- [ ] Meta descriptions are present
- [ ] Proper heading hierarchy (H1, H2, etc.)
- [ ] Alt text on images
- [ ] Sitemap is accessible (`/sitemap.xml`)
- [ ] Robots.txt is present

### Security Tests

- [ ] HTTPS is working
- [ ] HTTP redirects to HTTPS
- [ ] SSL certificate is valid
- [ ] No mixed content warnings
- [ ] Security headers are set

### Mobile Tests

- [ ] Responsive design works on mobile
- [ ] Touch targets are adequate
- [ ] Text is readable without zooming
- [ ] No horizontal scrolling

### Browser Compatibility

Test in:
- [ ] Chrome/Edge
- [ ] Firefox
- [ ] Safari
- [ ] Mobile browsers

### Tools for Testing

- **Performance**: [PageSpeed Insights](https://pagespeed.web.dev/)
- **SEO**: [Google Search Console](https://search.google.com/search-console)
- **Mobile**: [Mobile-Friendly Test](https://search.google.com/test/mobile-friendly)
- **SSL**: [SSL Labs](https://www.ssllabs.com/ssltest/)
- **Broken Links**: [Dead Link Checker](https://www.deadlinkchecker.com/)

---

## Troubleshooting Deployment Issues

### Build Fails on Netlify/Vercel

**Problem**: Build process fails

**Solutions**:
1. Check Hugo version matches your local version
2. Verify theme is properly committed (not just as submodule)
3. Check build logs for specific errors
4. Ensure all dependencies are in repository

### 404 Errors After Deployment

**Problem**: Pages show 404 errors

**Solutions**:
1. Check baseURL in config.toml matches your domain
2. Verify file paths are correct (case-sensitive)
3. Check redirect rules
4. Clear browser cache

### Images Not Loading

**Problem**: Images show broken links

**Solutions**:
1. Verify images are in `static/images/` directory
2. Check image paths start with `/images/`
3. Ensure images were uploaded/committed
4. Check file permissions (traditional hosting)

### Language Switching Not Working

**Problem**: Language menu doesn't work

**Solutions**:
1. Verify all language content files exist
2. Check language configuration in config.toml
3. Test language URLs directly
4. Check redirect rules aren't interfering

### SSL Certificate Issues

**Problem**: SSL certificate not working

**Solutions**:
1. Wait for DNS propagation (24-48 hours)
2. Verify DNS records are correct
3. Check domain ownership verification
4. Try reprovisioning certificate

---

## Maintenance and Updates

### Regular Updates

1. **Content Updates**: Edit Markdown files and push to repository
2. **Hugo Updates**: Update Hugo version in build configuration
3. **Theme Updates**: Pull latest theme changes if using Git submodule
4. **Security**: Keep dependencies updated

### Backup Strategy

1. **Git Repository**: Your primary backup
2. **Hosting Platform**: Most platforms keep deployment history
3. **Local Backup**: Keep local copy of repository
4. **Database**: Not applicable (static site)

### Monitoring

Set up monitoring for:
- **Uptime**: Use UptimeRobot or similar
- **Performance**: Google Analytics, PageSpeed Insights
- **Errors**: Check hosting platform logs
- **Traffic**: Google Analytics or similar

---

## Support and Resources

- **Netlify Docs**: https://docs.netlify.com/
- **Vercel Docs**: https://vercel.com/docs
- **GitHub Pages Docs**: https://docs.github.com/pages
- **Hugo Deployment Docs**: https://gohugo.io/hosting-and-deployment/

For project-specific issues, refer to [README.md](README.md) and [TESTING_CHECKLIST.md](TESTING_CHECKLIST.md).

---

**Last Updated**: April 2026