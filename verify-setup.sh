#!/bin/bash

# Hugo Website Setup Verification Script
# This script checks if all necessary components are properly installed and configured

echo "=========================================="
echo "Hugo Website Setup Verification"
echo "=========================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Function to print success
print_success() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASSED++))
}

# Function to print failure
print_failure() {
    echo -e "${RED}✗${NC} $1"
    ((FAILED++))
}

# Function to print warning
print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
    ((WARNINGS++))
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "1. Checking Prerequisites..."
echo "----------------------------"

# Check Hugo installation
if command_exists hugo; then
    HUGO_VERSION=$(hugo version)
    print_success "Hugo is installed: $HUGO_VERSION"
    
    # Check if it's extended version
    if echo "$HUGO_VERSION" | grep -q "extended"; then
        print_success "Hugo Extended version detected"
    else
        print_warning "Hugo Extended version not detected (may be required for SCSS)"
    fi
else
    print_failure "Hugo is not installed"
    echo "  Install from: https://gohugo.io/installation/"
fi

# Check Git installation
if command_exists git; then
    GIT_VERSION=$(git --version)
    print_success "Git is installed: $GIT_VERSION"
else
    print_warning "Git is not installed (recommended for version control)"
fi

echo ""
echo "2. Checking Project Structure..."
echo "--------------------------------"

# Check config file
if [ -f "config.toml" ]; then
    print_success "config.toml exists"
else
    print_failure "config.toml not found"
fi

# Check theme
if [ -d "themes/hugo-universal-theme" ]; then
    print_success "Hugo Universal Theme is installed"
else
    print_failure "Hugo Universal Theme not found in themes/ directory"
fi

# Check content directories
CONTENT_DIRS=("content" "content/about" "content/services" "content/fees" "content/payroll" "content/contact")
for dir in "${CONTENT_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        print_success "Directory exists: $dir"
    else
        print_failure "Directory missing: $dir"
    fi
done

# Check i18n directory
if [ -d "i18n" ]; then
    print_success "i18n directory exists"
else
    print_failure "i18n directory not found"
fi

# Check static directories
if [ -d "static/images" ]; then
    print_success "static/images directory exists"
else
    print_failure "static/images directory not found"
fi

if [ -d "static/css" ]; then
    print_success "static/css directory exists"
else
    print_failure "static/css directory not found"
fi

# Check layouts directory
if [ -d "layouts" ]; then
    print_success "layouts directory exists"
else
    print_failure "layouts directory not found"
fi

echo ""
echo "3. Checking Content Files..."
echo "----------------------------"

# Check content files for each language
LANGUAGES=("en" "es" "ca" "de" "fr" "it")
PAGES=("_index" "about/_index" "services/_index" "fees/_index" "payroll/_index" "contact/_index")

CONTENT_COUNT=0
MISSING_COUNT=0

for lang in "${LANGUAGES[@]}"; do
    for page in "${PAGES[@]}"; do
        file="content/${page}.${lang}.md"
        if [ -f "$file" ]; then
            ((CONTENT_COUNT++))
        else
            ((MISSING_COUNT++))
            print_failure "Missing: $file"
        fi
    done
done

if [ $MISSING_COUNT -eq 0 ]; then
    print_success "All $CONTENT_COUNT content files exist"
else
    print_failure "$MISSING_COUNT content files are missing"
fi

echo ""
echo "4. Checking Translation Files..."
echo "---------------------------------"

I18N_COUNT=0
for lang in "${LANGUAGES[@]}"; do
    file="i18n/${lang}.toml"
    if [ -f "$file" ]; then
        print_success "Translation file exists: $file"
        ((I18N_COUNT++))
    else
        print_failure "Translation file missing: $file"
    fi
done

echo ""
echo "5. Checking Image Files..."
echo "--------------------------"

IMAGES=("homepage.jpg" "aboutus.jpg" "services.jpg" "fees.jpg" "payroll.jpg" "contact.jpg")
IMAGE_COUNT=0

for img in "${IMAGES[@]}"; do
    file="static/images/$img"
    if [ -f "$file" ]; then
        print_success "Image exists: $img"
        ((IMAGE_COUNT++))
    else
        print_failure "Image missing: $img"
    fi
done

echo ""
echo "6. Checking Layout Files..."
echo "---------------------------"

LAYOUTS=("layouts/index.html" "layouts/about/list.html" "layouts/services/list.html" 
         "layouts/fees/list.html" "layouts/payroll/list.html" "layouts/contact/list.html")

LAYOUT_COUNT=0
for layout in "${LAYOUTS[@]}"; do
    if [ -f "$layout" ]; then
        print_success "Layout exists: $layout"
        ((LAYOUT_COUNT++))
    else
        print_failure "Layout missing: $layout"
    fi
done

# Check partials
PARTIALS=("layouts/partials/hero.html" "layouts/partials/features.html" "layouts/partials/pricing-cards.html")
for partial in "${PARTIALS[@]}"; do
    if [ -f "$partial" ]; then
        print_success "Partial exists: $partial"
    else
        print_failure "Partial missing: $partial"
    fi
done

echo ""
echo "7. Checking CSS Files..."
echo "------------------------"

if [ -f "static/css/custom.css" ]; then
    print_success "custom.css exists"
else
    print_failure "custom.css not found"
fi

echo ""
echo "8. Testing Hugo Configuration..."
echo "--------------------------------"

if command_exists hugo; then
    # Test configuration
    if hugo config > /dev/null 2>&1; then
        print_success "Hugo configuration is valid"
    else
        print_failure "Hugo configuration has errors"
    fi
    
    # Try to build the site
    echo "  Attempting to build site..."
    if hugo --quiet 2>/dev/null; then
        print_success "Site builds successfully"
        
        # Check if public directory was created
        if [ -d "public" ]; then
            FILE_COUNT=$(find public -type f | wc -l)
            print_success "Generated $FILE_COUNT files in public/ directory"
        fi
    else
        print_failure "Site build failed (run 'hugo' for details)"
    fi
else
    print_warning "Skipping Hugo tests (Hugo not installed)"
fi

echo ""
echo "=========================================="
echo "Verification Summary"
echo "=========================================="
echo -e "${GREEN}Passed:${NC}   $PASSED"
echo -e "${RED}Failed:${NC}   $FAILED"
echo -e "${YELLOW}Warnings:${NC} $WARNINGS"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All critical checks passed!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Run 'hugo server -D' to start the development server"
    echo "2. Visit http://localhost:1313 to view your site"
    echo "3. Test all pages and languages"
    echo "4. Review TESTING_CHECKLIST.md for comprehensive testing"
    echo ""
    exit 0
else
    echo -e "${RED}✗ Some checks failed. Please fix the issues above.${NC}"
    echo ""
    echo "Common fixes:"
    echo "- Install Hugo Extended: https://gohugo.io/installation/"
    echo "- Install theme: cd themes && git clone https://github.com/devcows/hugo-universal-theme.git"
    echo "- Check file paths and names (case-sensitive)"
    echo ""
    exit 1
fi

# Made with Bob
