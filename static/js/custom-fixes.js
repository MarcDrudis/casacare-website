/* ========================================
   CasaCare Custom JavaScript Fixes
   ======================================== */

(function($) {
  'use strict';

  console.log('CasaCare custom-fixes.js loaded');

  // Fix 1: Prevent scroll snap-back on About Us and other pages
  // Override the scroll-to functionality to account for navbar height
  function fixScrollToLinks() {
    // Remove the default scroll-to handler from front.js
    $('.scroll-to, .scroll-to-top').off('click');
    
    // Add improved scroll-to handler
    $('.scroll-to, .scroll-to-top').on('click', function(event) {
      const fullUrl = this.href;
      const parts = fullUrl.split('#');
      
      if (parts.length > 1) {
        event.preventDefault();
        const trgt = parts[1];
        const $target = $('#' + trgt);
        
        if ($target.length) {
          const navbarHeight = $('.navbar-affixed-top').outerHeight() || 62;
          let targetTop = $target.offset().top - navbarHeight - 20; // Extra 20px padding
          
          if (targetTop < 0) {
            targetTop = 0;
          }
          
          $('html, body').animate({
            scrollTop: targetTop
          }, 800, function() {
            // Update URL hash without triggering scroll
            if (history.pushState) {
              history.pushState(null, null, '#' + trgt);
            }
          });
        }
      }
    });
  }

  // Fix 2: Smart navbar hide/show on scroll
  function smartNavbar() {
    let lastScrollTop = 0;
    let delta = 5;
    let navbarHeight = $('.navbar-affixed-top').outerHeight();
    let didScroll = false;
    
    // Check if we should hide/show navbar
    function hasScrolled() {
      const st = $(window).scrollTop();
      
      // Make sure they scroll more than delta
      if (Math.abs(lastScrollTop - st) <= delta) {
        return;
      }
      
      const $navbar = $('.navbar-affixed-top');
      
      // If scrolled down and past navbar, hide it
      if (st > lastScrollTop && st > navbarHeight) {
        // Scroll Down - hide navbar
        $navbar.removeClass('nav-down').addClass('nav-up');
      } else {
        // Scroll Up - show navbar
        if (st + $(window).height() < $(document).height()) {
          $navbar.removeClass('nav-up').addClass('nav-down');
        }
      }
      
      lastScrollTop = st;
    }
    
    // Throttle scroll events
    $(window).scroll(function() {
      didScroll = true;
    });
    
    setInterval(function() {
      if (didScroll) {
        hasScrolled();
        didScroll = false;
      }
    }, 250);
  }

  // Fix 3: Prevent hash changes from causing scroll jumps
  function preventHashScrollJump() {
    // If page loads with a hash, scroll to it properly
    if (window.location.hash) {
      setTimeout(function() {
        const hash = window.location.hash;
        const $target = $(hash);
        
        if ($target.length) {
          const navbarHeight = $('.navbar-affixed-top').outerHeight() || 62;
          const targetTop = $target.offset().top - navbarHeight - 20;
          
          $('html, body').scrollTop(targetTop);
        }
      }, 100);
    }
    
    // Prevent default hash behavior
    $(window).on('hashchange', function(e) {
      e.preventDefault();
      const hash = window.location.hash;
      const $target = $(hash);
      
      if ($target.length) {
        const navbarHeight = $('.navbar-affixed-top').outerHeight() || 62;
        const targetTop = $target.offset().top - navbarHeight - 20;
        
        $('html, body').animate({
          scrollTop: targetTop
        }, 800);
      }
    });
  }

  // Initialize all fixes when document is ready
  $(document).ready(function() {
    fixScrollToLinks();
    smartNavbar();
    preventHashScrollJump();
  });

})(jQuery);

// Made with Bob
