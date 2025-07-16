// My-IPTV - Modern JavaScript with Animations
document.addEventListener('DOMContentLoaded', function() {
    
    // Loading screen
    setTimeout(() => {
        const loadingScreen = document.querySelector('.loading-screen');
        if (loadingScreen) {
            loadingScreen.style.display = 'none';
        }
    }, 2500);

    // Header scroll effect
    const header = document.getElementById('header');
    let lastScrollTop = 0;
    
    window.addEventListener('scroll', () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        if (scrollTop > 100) {
            header.classList.add('header-scrolled');
        } else {
            header.classList.remove('header-scrolled');
        }
        
        // Hide/show header on scroll
        if (scrollTop > lastScrollTop && scrollTop > 200) {
            header.style.transform = 'translateY(-100%)';
        } else {
            header.style.transform = 'translateY(0)';
        }
        
        lastScrollTop = scrollTop;
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerHeight = header.offsetHeight;
                const targetPosition = target.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Mobile menu toggle
    const mobileMenu = document.querySelector('.mobile-menu');
    const navLinks = document.querySelector('.nav-links');
    
    if (mobileMenu) {
        mobileMenu.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            mobileMenu.classList.toggle('active');
        });
    }

    // Intersection Observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    // Observe all elements with animation classes
    document.querySelectorAll('.fade-in, .slide-in-left, .slide-in-right').forEach(el => {
        observer.observe(el);
    });

    // FAQ Accordion
    document.querySelectorAll('.faq-question').forEach(question => {
        question.addEventListener('click', () => {
            const faqItem = question.parentElement;
            const answer = faqItem.querySelector('.faq-answer');
            const icon = question.querySelector('.faq-icon');
            
            // Close other FAQ items
            document.querySelectorAll('.faq-item').forEach(item => {
                if (item !== faqItem) {
                    item.querySelector('.faq-answer').classList.remove('active');
                    item.querySelector('.faq-icon').classList.remove('active');
                }
            });
            
            // Toggle current FAQ item
            answer.classList.toggle('active');
            icon.classList.toggle('active');
        });
    });

    // Pricing card hover effects
    document.querySelectorAll('.pricing-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-15px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', () => {
            if (card.classList.contains('featured')) {
                card.style.transform = 'scale(1.05)';
            } else {
                card.style.transform = 'translateY(0) scale(1)';
            }
        });
    });

    // Feature cards stagger animation
    const featureCards = document.querySelectorAll('.feature-card');
    featureCards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
    });

    // Contact form handling
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const name = formData.get('name');
            const service = formData.get('service');
            const device = formData.get('device');
            const message = formData.get('message');
            const contactMethod = formData.get('contact-method');
            
            // Validation
            if (!name || !service || !contactMethod) {
                showNotification('⚠️ Veuillez remplir tous les champs obligatoires.', 'error');
                return;
            }
            
            // Prepare message with emojis
            let fullMessage = `👋 Bonjour,\n\n`;
            fullMessage += `👤 Nom: ${name}\n`;
            fullMessage += `📺 Service demandé: ${getServiceLabel(service)}\n`;
            
            if (device) {
                fullMessage += `📱 Appareil: ${getDeviceLabel(device)}\n`;
            }
            
            if (message) {
                fullMessage += `\n💬 Message:\n${message}\n`;
            }
            
            fullMessage += `\n✨ Cordialement,\nMy-IPTV`;
            
            // Handle contact method
            if (contactMethod === 'whatsapp') {
                const whatsappMessage = encodeURIComponent(fullMessage);
                const whatsappUrl = `https://wa.me/212694843943?text=${whatsappMessage}`;
                window.open(whatsappUrl, '_blank');
                showNotification('📱 Redirection vers WhatsApp...', 'success');
            } else if (contactMethod === 'email') {
                const subject = encodeURIComponent(`📺 Demande ${getServiceLabel(service).replace(/🆓|💎|❓/g, '').trim()} - My-IPTV`);
                const body = encodeURIComponent(fullMessage);
                const emailUrl = `mailto:kilua031@gmail.com?subject=${subject}&body=${body}`;
                window.location.href = emailUrl;
                showNotification('📧 Ouverture de votre client email...', 'success');
            }
            
            // Reset form
            this.reset();
        });
    }

    // Helper functions for form
    function getServiceLabel(service) {
        const services = {
            'test': '🆓 Test gratuit 24h',
            'annual': '💎 Abonnement annuel (29€)',
            'info': '❓ Demande d\'information'
        };
        return services[service] || service;
    }
    
    function getDeviceLabel(device) {
        const devices = {
            'smart-tv': '📺 Smart TV',
            'android-tv': '📱 Android TV',
            'mag': '📦 Boîtier MAG',
            'mobile': '📱 Smartphone/Tablette',
            'pc': '💻 PC/Mac',
            'other': '🔧 Autre'
        };
        return devices[device] || device;
    }

    // Notification system
    function showNotification(message, type = 'info') {
        // Remove existing notifications
        const existingNotification = document.querySelector('.notification');
        if (existingNotification) {
            existingNotification.remove();
        }
        
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.innerHTML = `
            <div class="notification-content">
                <span class="notification-message">${message}</span>
                <button class="notification-close">&times;</button>
            </div>
        `;
        
        // Add styles
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: ${type === 'error' ? '#ef4444' : type === 'success' ? '#10b981' : '#3b82f6'};
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            z-index: 10000;
            transform: translateX(100%);
            transition: transform 0.3s ease;
            max-width: 300px;
        `;
        
        document.body.appendChild(notification);
        
        // Animate in
        setTimeout(() => {
            notification.style.transform = 'translateX(0)';
        }, 100);
        
        // Close button
        const closeBtn = notification.querySelector('.notification-close');
        closeBtn.addEventListener('click', () => {
            notification.style.transform = 'translateX(100%)';
            setTimeout(() => notification.remove(), 300);
        });
        
        // Auto remove
        setTimeout(() => {
            if (notification.parentNode) {
                notification.style.transform = 'translateX(100%)';
                setTimeout(() => notification.remove(), 300);
            }
        }, 5000);
    }

    // Parallax effect for hero background
    window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const heroBackground = document.querySelector('.hero-bg');
        if (heroBackground) {
            heroBackground.style.transform = `translateY(${scrolled * 0.5}px)`;
        }
    });

    // Dynamic typing effect for hero title
    function typeWriter(element, text, speed = 100) {
        let i = 0;
        element.innerHTML = '';
        
        function type() {
            if (i < text.length) {
                element.innerHTML += text.charAt(i);
                i++;
                setTimeout(type, speed);
            }
        }
        
        type();
    }

    // Initialize typing effect after loading
    setTimeout(() => {
        const heroTitle = document.querySelector('.hero h1');
        if (heroTitle) {
            const originalText = heroTitle.textContent;
            typeWriter(heroTitle, originalText, 80);
        }
    }, 3000);

    // Floating elements animation
    function createFloatingElements() {
        const hero = document.querySelector('.hero');
        if (!hero) return;
        
        for (let i = 0; i < 5; i++) {
            const element = document.createElement('div');
            element.className = 'floating-element';
            element.style.cssText = `
                position: absolute;
                width: ${Math.random() * 10 + 5}px;
                height: ${Math.random() * 10 + 5}px;
                background: linear-gradient(45deg, #00d4ff, #8b5cf6);
                border-radius: 50%;
                opacity: 0.3;
                left: ${Math.random() * 100}%;
                top: ${Math.random() * 100}%;
                animation: float ${Math.random() * 10 + 10}s infinite linear;
                pointer-events: none;
            `;
            hero.appendChild(element);
        }
    }

    // Add floating animation keyframes
    const style = document.createElement('style');
    style.textContent = `
        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 0.3;
            }
            90% {
                opacity: 0.3;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }
        
        .notification-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 1rem;
        }
        
        .notification-close {
            background: none;
            border: none;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            padding: 0;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .notification-close:hover {
            opacity: 0.7;
        }
        
        @media (max-width: 768px) {
            .nav-links.active {
                display: flex;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background: rgba(10, 10, 10, 0.98);
                flex-direction: column;
                padding: 2rem;
                backdrop-filter: blur(10px);
                border-top: 1px solid rgba(0, 212, 255, 0.2);
            }
            
            .mobile-menu.active span:nth-child(1) {
                transform: rotate(-45deg) translate(-5px, 6px);
            }
            
            .mobile-menu.active span:nth-child(2) {
                opacity: 0;
            }
            
            .mobile-menu.active span:nth-child(3) {
                transform: rotate(45deg) translate(-5px, -6px);
            }
        }
    `;
    document.head.appendChild(style);

    // Initialize floating elements
    createFloatingElements();

    // Add scroll progress indicator
    const progressBar = document.createElement('div');
    progressBar.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 0%;
        height: 3px;
        background: linear-gradient(90deg, #00d4ff, #8b5cf6);
        z-index: 10001;
        transition: width 0.1s ease;
    `;
    document.body.appendChild(progressBar);

    window.addEventListener('scroll', () => {
        const scrollTop = window.pageYOffset;
        const docHeight = document.documentElement.scrollHeight - window.innerHeight;
        const scrollPercent = (scrollTop / docHeight) * 100;
        progressBar.style.width = scrollPercent + '%';
    });

    // Add click ripple effect to buttons
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${x}px;
                top: ${y}px;
                background: rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                transform: scale(0);
                animation: ripple 0.6s linear;
                pointer-events: none;
            `;
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });

    // Add ripple animation
    const rippleStyle = document.createElement('style');
    rippleStyle.textContent = `
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(rippleStyle);

    // Performance optimization: Throttle scroll events
    function throttle(func, limit) {
        let inThrottle;
        return function() {
            const args = arguments;
            const context = this;
            if (!inThrottle) {
                func.apply(context, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        }
    }

    // Apply throttling to scroll events
    window.addEventListener('scroll', throttle(() => {
        // Scroll-dependent animations here
    }, 16)); // ~60fps

    console.log('My-IPTV website loaded successfully! 🚀');
});
