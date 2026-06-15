# Accounting Services Website

A multilingual Hugo-based website for an accounting services company, supporting 6 languages (English, Spanish, Catalan, German, French, and Italian).

## 🌟 Features

- **6 Languages**: Full multilingual support with easy language switching
- **6 Pages**: Home, About Us, Services, Our Fees, Payroll, Contact
- **Responsive Design**: Mobile-friendly layout using Hugo Universal Theme
- **Custom Styling**: Professional color scheme (blue #1E3A8A, gold #F59E0B)
- **Pricing Cards**: Interactive pricing display on the Fees page
- **SEO Optimized**: Proper meta tags and structured content
- **Fast Performance**: Static site generation with Hugo

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Hugo Extended** (v0.92.0 or higher)
  - Download from: https://github.com/gohugoio/hugo/releases
  - Verify installation: `hugo version`
- **Git** (for theme management and deployment)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd website
```

### 2. Install the Theme

The Hugo Universal Theme is already included in the `themes/` directory. If you need to reinstall it:

```bash
git submodule update --init --recursive
```

Or manually:

```bash
cd themes
git clone https://github.com/devcows/hugo-universal-theme.git
cd ..
```

### 3. Run the Development Server

```bash
hugo server -D
```

The site will be available at: `http://localhost:1313`

**Hot Reload**: The server automatically reloads when you make changes to content, layouts, or styles.

### 4. Test Different Languages

Access different language versions:
- English: `http://localhost:1313/en/`
- Spanish: `http://localhost:1313/es/`
- Catalan: `http://localhost:1313/ca/`
- German: `http://localhost:1313/de/`
- French: `http://localhost:1313/fr/`
- Italian: `http://localhost:1313/it/`

## 🏗️ Build for Production

Generate the static site files:

```bash
hugo --minify
```

This creates a `public/` directory with all static files ready for deployment.

**Build Options**:
- `--minify`: Minifies HTML, CSS, and JS
- `--baseURL "https://yourdomain.com"`: Override base URL
- `--environment production`: Set production environment

## 📁 Project Structure

```
website/
├── config.toml              # Main configuration file
├── content/                 # Content files (Markdown)
│   ├── _index.{lang}.md    # Homepage content
│   ├── about/              # About Us page
│   ├── services/           # Services page
│   ├── fees/               # Our Fees page
│   ├── payroll/            # Payroll page
│   └── contact/            # Contact page
├── i18n/                   # Translation files
│   ├── en.toml             # English translations
│   ├── es.toml             # Spanish translations
│   ├── ca.toml             # Catalan translations
│   ├── de.toml             # German translations
│   ├── fr.toml             # French translations
│   └── it.toml             # Italian translations
├── layouts/                # Custom page templates
│   ├── index.html          # Homepage template
│   ├── about/list.html     # About page template
│   ├── services/list.html  # Services page template
│   ├── fees/list.html      # Fees page template
│   ├── payroll/list.html   # Payroll page template
│   ├── contact/list.html   # Contact page template
│   └── partials/           # Reusable components
│       ├── hero.html       # Hero section
│       ├── features.html   # Features section
│       └── pricing-cards.html # Pricing cards
├── static/                 # Static assets
│   ├── css/custom.css      # Custom styles
│   └── images/             # Page images
├── themes/                 # Hugo themes
│   └── hugo-universal-theme/
└── public/                 # Generated site (after build)
```

## ✏️ Content Management

### Adding/Editing Content

1. **Edit existing pages**: Modify files in `content/` directory
2. **Add new pages**: Create new `.md` files with proper front matter
3. **Update translations**: Edit files in `i18n/` directory

### Front Matter Example

```yaml
---
title: "Page Title"
description: "Page description for SEO"
draft: false
---

Your content here in Markdown format.
```

### Adding Images

1. Place images in `static/images/`
2. Reference in content: `![Alt text](/images/filename.jpg)`
3. Recommended image sizes:
   - Hero images: 1920x800px
   - Feature images: 800x600px
   - Thumbnails: 400x300px

## 🎨 Customization

### Colors

Edit `static/css/custom.css` to change the color scheme:

```css
:root {
  --primary-color: #1E3A8A;    /* Blue */
  --secondary-color: #F59E0B;  /* Gold */
  --text-color: #1F2937;       /* Dark gray */
}
```

### Navigation Menu

Edit `config.toml` to modify menu items:

```toml
[[Languages.en.menu.main]]
    name = "Menu Item"
    url  = "/page/"
    weight = 1
```

### Contact Information

Update contact details in `config.toml`:

```toml
[params]
    email = "your@email.com"
    phone = "+1234567890"
    address = "Your Address"
```

## 🌐 Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions for:
- Netlify (recommended)
- Vercel
- GitHub Pages
- Traditional hosting

## 🧪 Testing

See [TESTING_CHECKLIST.md](TESTING_CHECKLIST.md) for a comprehensive testing checklist.

### Quick Test Commands

```bash
# Check Hugo installation
hugo version

# Validate configuration
hugo config

# Check for broken links (requires htmltest)
hugo && htmltest

# Build and serve production version
hugo --minify && hugo server --renderToDisk
```

## 🔧 Troubleshooting

### Hugo Server Won't Start

**Problem**: `hugo server` fails or shows errors

**Solutions**:
1. Check Hugo version: `hugo version` (need v0.92.0+)
2. Verify theme is installed: `ls themes/hugo-universal-theme`
3. Check config.toml syntax
4. Clear Hugo cache: `hugo --gc`

### Theme Not Loading

**Problem**: Site appears unstyled

**Solutions**:
1. Verify theme name in config.toml: `theme = "hugo-universal-theme"`
2. Reinstall theme: `git submodule update --init --recursive`
3. Check theme directory exists: `themes/hugo-universal-theme/`

### Language Switching Not Working

**Problem**: Language menu doesn't appear or doesn't work

**Solutions**:
1. Verify all language files exist in `i18n/`
2. Check language configuration in `config.toml`
3. Ensure content files have correct language suffix (e.g., `_index.en.md`)

### Images Not Displaying

**Problem**: Images show broken links

**Solutions**:
1. Verify images are in `static/images/` directory
2. Check image paths start with `/images/` (not `images/`)
3. Ensure image filenames match exactly (case-sensitive)
4. Check image file formats are supported (jpg, png, gif, svg)

### Build Errors

**Problem**: `hugo` command fails with errors

**Solutions**:
1. Check for syntax errors in Markdown files
2. Verify front matter is valid YAML/TOML
3. Run `hugo --debug` for detailed error messages
4. Check for missing required fields in config.toml

### Port Already in Use

**Problem**: `hugo server` says port 1313 is in use

**Solutions**:
1. Use different port: `hugo server -p 1314`
2. Kill existing process: `lsof -ti:1313 | xargs kill -9`
3. Find and stop other Hugo instances

## 📚 Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Universal Theme Docs](https://github.com/devcows/hugo-universal-theme)
- [Markdown Guide](https://www.markdownguide.org/)
- [TOML Syntax](https://toml.io/)

## 🤝 Contributing

1. Create a new branch for your changes
2. Make your modifications
3. Test thoroughly using the testing checklist
4. Submit a pull request with a clear description

## 📄 License

This project uses the Hugo Universal Theme, which is licensed under the MIT License.

## 📞 Support

For issues or questions:
1. Check the troubleshooting section above
2. Review [TESTING_CHECKLIST.md](TESTING_CHECKLIST.md)
3. Consult Hugo documentation
4. Contact the development team

---

**Last Updated**: April 2026  
**Hugo Version**: 0.92.0+  
**Theme**: Hugo Universal Theme