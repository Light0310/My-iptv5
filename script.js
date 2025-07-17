// Loading Screen
window.addEventListener('load', () => {
    const loadingScreen = document.querySelector('.loading-screen');
    if (loadingScreen) {
        setTimeout(() => {
            loadingScreen.style.opacity = '0';
            setTimeout(() => {
                loadingScreen.style.display = 'none';
            }, 500);
        }, 1000);
    }
});

// Header Scroll Effect
window.addEventListener('scroll', () => {
    const header = document.getElementById('header');
    if (header) {
        if (window.scrollY > 100) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    }
});

// Smooth Scrolling
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// FAQ Accordion
document.querySelectorAll('.faq-question').forEach(question => {
    question.addEventListener('click', () => {
        const faqItem = question.parentElement;
        const isActive = faqItem.classList.contains('active');
        
        // Close all FAQ items
        document.querySelectorAll('.faq-item').forEach(item => {
            item.classList.remove('active');
        });
        
        // Open clicked item if it wasn't active
        if (!isActive) {
            faqItem.classList.add('active');
        }
    });
});

// Fade In Animation on Scroll
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

// Observe all fade-in elements
document.querySelectorAll('.fade-in').forEach(el => {
    observer.observe(el);
});

// Contact Form Handler
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
        
        // Create WhatsApp message
        let whatsappMessage = `🔥 *Nouvelle demande My-IPTV* 🔥\n\n`;
        whatsappMessage += `👤 *Nom:* ${name}\n`;
        whatsappMessage += `📺 *Service:* ${service}\n`;
        
        if (device) {
            whatsappMessage += `📱 *Appareil:* ${device}\n`;
        }
        
        if (message) {
            whatsappMessage += `💬 *Message:* ${message}\n`;
        }
        
        whatsappMessage += `\n✅ *Méthode de contact préférée:* ${contactMethod}`;
        
        // Encode message for URL
        const encodedMessage = encodeURIComponent(whatsappMessage);
        
        // Open WhatsApp
        if (contactMethod === 'whatsapp') {
            window.open(`https://wa.me/212694843943?text=${encodedMessage}`, '_blank');
        } else {
            // For email, create mailto link
            const emailSubject = encodeURIComponent('Demande My-IPTV - ' + service);
            const emailBody = encodeURIComponent(whatsappMessage.replace(/\*/g, '').replace(/🔥|📺|👤|📱|💬|✅/g, ''));
            window.open(`mailto:kilua031@gmail.com?subject=${emailSubject}&body=${emailBody}`, '_blank');
        }
        
        // Reset form
        this.reset();
    });
}
