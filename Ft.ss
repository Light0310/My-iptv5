/* Variables CSS */
:root {
    --primary-color: #00d4ff;
    --secondary-color: #8b5cf6;
    --background-color: #1a1a1a;
    --card-bg: #2a2a2a;
    --text-color: #f1f1f1;
    --heading-color: #fff;
    --border-color: #3a3a3a;
    --star-color: #ffc107;
    --neon-color: #ff004c;
    --card-width: 180px;
    --gap: 20px;
    --height: 260px;
    --speed: 2.5s;
}

/* Styles de base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: 'Inter', sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
    overflow-x: hidden;
}

a {
    text-decoration: none;
    color: var(--primary-color);
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.fade-in {
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.fade-in.is-visible {
    opacity: 1;
    transform: translateY(0);
}

.btn {
    display: inline-block;
    padding: 12px 24px;
    border-radius: 50px;
    font-weight: 600;
    text-align: center;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-primary {
    background-color: var(--primary-color);
    color: var(--background-color);
    border: 2px solid var(--primary-color);
}

.btn-primary:hover {
    background-color: transparent;
    color: var(--primary-color);
    transform: translateY(-3px);
}

.btn-secondary {
    background-color: transparent;
    color: var(--primary-color);
    border: 2px solid var(--primary-color);
}

.btn-secondary:hover {
    background-color: var(--primary-color);
    color: var(--background-color);
    transform: translateY(-3px);
}

/* Header & Navigation */
#header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    transition: background-color 0.3s ease;
    padding: 1rem;
}

#header.scrolled {
    background-color: rgba(26, 26, 26, 0.9);
    backdrop-filter: blur(10px);
}

nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

.logo {
    font-size: 1.8rem;
    font-weight: 900;
    color: var(--primary-color);
}

.nav-links {
    display: flex;
    list-style: none;
}

.nav-links li a {
    margin: 0 15px;
    font-weight: 500;
    color: var(--text-color);
    transition: color 0.3s ease;
    position: relative;
}

.nav-links li a:hover {
    color: var(--primary-color);
}

.nav-links li a::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 0;
    height: 2px;
    background-color: var(--primary-color);
    transition: width 0.3s ease;
}

.nav-links li a:hover::after {
    width: 100%;
}

.nav-right {
    display: flex;
    align-items: center;
}

.language-selector {
    position: relative;
    cursor: pointer;
    margin-right: 20px;
    font-weight: 500;
}

.language-toggle {
    display: flex;
    align-items: center;
    padding: 8px 12px;
    border-radius: 20px;
    border: 1px solid var(--border-color);
    transition: background-color 0.3s;
}

.language-toggle:hover {
    background-color: rgba(255, 255, 255, 0.1);
}

.language-toggle .flag {
    font-size: 1.2rem;
    margin-right: 5px;
}

.language-toggle .arrow {
    margin-left: 8px;
    font-size: 0.8rem;
    transition: transform 0.3s;
}

.language-dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    background-color: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 8px 0;
    margin-top: 10px;
    min-width: 150px;
    opacity: 0;
    visibility: hidden;
    transform: translateY(10px);
    transition: opacity 0.3s, transform 0.3s;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.language-selector:hover .language-dropdown {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.language-option {
    display: flex;
    align-items: center;
    padding: 8px 15px;
    color: var(--text-color);
    transition: background-color 0.3s;
}

.language-option:hover, .language-option.current {
    background-color: rgba(0, 212, 255, 0.1);
}

.language-option .flag {
    margin-right: 10px;
}

.mobile-menu {
    display: none;
    cursor: pointer;
    flex-direction: column;
    justify-content: space-around;
    width: 25px;
    height: 20px;
}

.mobile-menu span {
    display: block;
    height: 3px;
    background-color: var(--primary-color);
    border-radius: 3px;
}

/* Hero Section */
.hero {
    position: relative;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: var(--text-color);
}

.hero-bg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('https://i.postimg.cc/pr0tVv1Y/iptv-hero-bg.jpg');
    background-size: cover;
    background-position: center;
    filter: brightness(0.4);
    z-index: -1;
}

.hero-content {
    max-width: 800px;
    padding: 2rem;
}

.hero h1 {
    font-size: clamp(2.5rem, 6vw, 4.5rem);
    font-weight: 800;
    margin-bottom: 1rem;
    line-height: 1.2;
}

.hero p {
    font-size: clamp(1rem, 2.5vw, 1.25rem);
    margin-bottom: 2rem;
}

.hero-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
}

/* Features Section */
#features {
    padding: 80px 1rem;
    background-color: #202020;
}

.section-title {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 3rem;
    color: var(--heading-color);
    position: relative;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background-color: var(--primary-color);
    border-radius: 2px;
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

.feature-card {
    background-color: var(--card-bg);
    padding: 2rem;
    border-radius: 12px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border: 1px solid var(--border-color);
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.feature-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
    color: var(--primary-color);
}

.feature-card h3 {
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: var(--heading-color);
}

/* Pricing Section */
#pricing {
    padding: 80px 1rem;
    background-color: var(--background-color);
}

.pricing-container {
    display: flex;
    justify-content: center;
    gap: 2rem;
    flex-wrap: wrap;
}

.pricing-card {
    background-color: var(--card-bg);
    padding: 2rem;
    border-radius: 12px;
    text-align: center;
    width: 350px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
    border: 2px solid transparent;
}

.pricing-card.featured {
    border-color: var(--primary-color);
    box-shadow: 0 0 20px rgba(0, 212, 255, 0.4);
}

.pricing-card:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.pricing-badge {
    position: absolute;
    top: -15px;
    left: 50%;
    transform: translateX(-50%);
    background-color: var(--primary-color);
    color: var(--background-color);
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: bold;
    text-transform: uppercase;
}

.pricing-title {
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 1rem;
    color: var(--heading-color);
}

.pricing-price {
    font-size: 3rem;
    font-weight: 900;
    color: var(--primary-color);
    margin-bottom: 1.5rem;
}

.pricing-features {
    list-style: none;
    text-align: left;
    margin-bottom: 2rem;
}

.pricing-features li {
    padding: 10px 0;
    border-bottom: 1px solid var(--border-color);
    display: flex;
    align-items: center;
}

.pricing-features li::before {
    content: '✅';
    margin-right: 10px;
    font-size: 1.2rem;
}

/* FAQ Section */
#faq {
    padding: 80px 1rem;
    background-color: #202020;
}

.faq-container {
    max-width: 800px;
    margin: 0 auto;
}

.faq-item {
    background-color: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    margin-bottom: 1rem;
    padding: 1.5rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.faq-item:hover {
    background-color: #2a2a2a;
}

.faq-question {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.faq-question h3 {
    font-size: 1.2rem;
    font-weight: 600;
    color: var(--heading-color);
}

.faq-icon {
    font-size: 1.5rem;
    color: var(--primary-color);
    transition: transform 0.3s ease;
}

.faq-item.active .faq-icon {
    transform: rotate(180deg);
}

.faq-answer {
    padding-top: 1rem;
    display: none;
    border-top: 1px solid var(--border-color);
    margin-top: 1rem;
}

.faq-item.active .faq-answer {
    display: block;
}

/* Contact Section */
#contact {
    padding: 80px 1rem;
    background-color: var(--background-color);
}

.contact-form {
    max-width: 600px;
    margin: 0 auto;
    background-color: var(--card-bg);
    padding: 2rem;
    border-radius: 12px;
    border: 1px solid var(--border-color);
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: var(--heading-color);
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    background-color: #333;
    color: var(--text-color);
}

.form-group textarea {
    resize: vertical;
}

.btn-primary {
    width: 100%;
}

/* Footer */
footer {
    padding: 30px 1rem;
    background-color: #0d0d0d;
    text-align: center;
    border-top: 1px solid var(--border-color);
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
}

.footer-links {
    margin-bottom: 15px;
}

.footer-links a {
    margin: 0 10px;
    color: #999;
    transition: color 0.3s ease;
}

.footer-links a:hover {
    color: var(--primary-color);
}

footer p {
    font-size: 0.9rem;
    color: #777;
}

/* WhatsApp Float Button */
.whatsapp-float {
    position: fixed;
    width: 60px;
    height: 60px;
    bottom: 40px;
    right: 40px;
    background-color: #25d366;
    color: #fff;
    border-radius: 50px;
    text-align: center;
    font-size: 30px;
    box-shadow: 2px 2px 3px #999;
    z-index: 100;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.3s ease;
}

.whatsapp-float:hover {
    transform: scale(1.1);
}

.whatsapp-float svg {
    fill: white;
    width: 35px;
    height: 35px;
}

/* Loading Screen */
.loading-screen {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: var(--background-color);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
    transition: opacity 0.5s ease, visibility 0.5s ease;
}

.loading-logo {
    font-size: 3rem;
    font-weight: 900;
    color: var(--primary-color);
    animation: pulse 1.5s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.1); opacity: 0.7; }
    100% { transform: scale(1); opacity: 1; }
}

/* Media Queries */
@media (max-width: 768px) {
    .nav-links {
        display: none;
        flex-direction: column;
        width: 100%;
        text-align: center;
        position: absolute;
        top: 60px;
        left: 0;
        background-color: rgba(26, 26, 26, 0.95);
        padding: 1rem 0;
    }

    .nav-links.active {
        display: flex;
    }

    .nav-links li {
        margin: 10px 0;
    }

    .mobile-menu {
        display: flex;
    }

    .hero-content h1 {
        font-size: 2.5rem;
    }

    .hero-buttons {
        flex-direction: column;
    }

    .pricing-container {
        flex-direction: column;
        align-items: center;
    }

    .whatsapp-float {
        bottom: 20px;
        right: 20px;
        width: 50px;
        height: 50px;
        font-size: 25px;
    }

    .whatsapp-float svg {
        width: 30px;
        height: 30px;
    }

    .section-title {
        font-size: 2rem;
    }
}

/* Styles pour la section Avis */
.avis-section {
    padding: 2rem 1rem;
    background-color: #202020;
}
.avis-section .container {
    max-width: 1200px;
    margin: 0 auto;
}
.avis-section h2.main-heading {
    text-align: center;
    font-size: 2.5rem;
    color: var(--heading-color);
    margin-bottom: 3rem;
    position: relative;
}
.avis-section h2.main-heading::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background-color: var(--primary-color);
    border-radius: 2px;
}
.avis-section .avis-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
}
.avis-section .avis-card {
    background-color: #fff;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border-top: 5px solid var(--primary-color);
}
.avis-section .avis-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}
.avis-section .avis-card .etoiles {
    color: var(--star-color);
    font-size: 1.2rem;
    margin-bottom: 1rem;
}
.avis-section .avis-card h4 {
    color: var(--primary-color);
    font-size: 1.4rem;
    margin: 0 0 1rem 0;
}
.avis-section .avis-card p {
    font-style: italic;
    line-height: 1.7;
    margin-bottom: 1.5rem;
    flex-grow: 1;
}
.avis-section .avis-card .signature {
    border-top: 1px solid var(--border-color);
    padding-top: 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 0.9rem;
    color: #6c757d;
}
.avis-section .avis-card .nom {
    font-weight: bold;
    color: var(--heading-color);
}
@media (max-width: 768px) {
    .avis-section h2.main-heading {
        font-size: 2rem;
    }
}

/* Styles pour le carrousel des films */
.neon-carousel {
    width: 100%;
    max-width: 1200px;
    margin: 20px auto;
    background: #0a0a0a;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 0 25px var(--neon-color), inset 0 0 30px rgba(255,0,76,0.4);
    overflow: hidden;
    font-family: Arial, sans-serif;
    position: relative;
}
.neon-title {
    color: #fff;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 15px;
    text-align: center;
    letter-spacing: 2px;
    text-shadow: 
        2px 2px 4px #000,
        -2px -2px 4px #ff004c,
        2px -2px 4px #00ffe5,
        -2px 2px 4px #ffff00,
        0 0 10px var(--neon-color),
        0 0 20px var(--neon-color);
}
.neon-viewport {
    overflow: hidden;
}
.neon-track {
    display: flex;
    gap: var(--gap);
    padding-bottom: 10px;
    transition: transform 0.5s ease;
}
.neon-card {
    flex: 0 0 auto;
    width: var(--card-width);
    background: #111;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(255,0,76,0.4);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.neon-card:hover {
    transform: scale(1.07);
    box-shadow: 0 0 20px var(--neon-color), 0 0 35px var(--neon-color);
}
.neon-card img {
    width: 100%;
    height: 230px;
    object-fit: cover;
}
.neon-info {
    padding: 8px;
    color: #fff;
    text-align: center;
}
.neon-title-movie {
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 4px;
}
.neon-title-movie a {
    color: #fff;
    text-decoration: none;
}
.neon-title-movie a:hover {
    text-decoration: underline;
    color: var(--neon-color);
}
.stars {
    color: gold;
    font-size: 13px;
    margin-bottom: 4px;
}
.review {
    font-size: 12px;
    color: #ccc;
}
.carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0,0,0,0.6);
    color: #fff;
    border: 2px solid var(--neon-color);
    padding: 10px 15px;
    cursor: pointer;
    font-size: 18px;
    border-radius: 50%;
    box-shadow: 0 0 10px var(--neon-color);
    z-index: 10;
    transition: background 0.3s, transform 0.2s;
}
.carousel-btn:hover {
    background: var(--neon-color);
    transform: scale(1.1);
}
.btn-left { left: 5px; }
.btn-right { right: 5px; }
@media (max-width: 800px) {
    .neon-carousel { --card-width: 140px; }
    .neon-card img { height: 190px; }
}
@media (max-width: 420px) {
    .neon-carousel { --card-width: 120px; }
    .neon-card img { height: 170px; }
}
/* Tournois de Football 2025 */
.container {
    max-width: 1000px;
    margin: 0 auto;
    display: grid;
    gap: 2rem;
    padding: 2rem;
}

header {
    margin-bottom: 2rem;
}

h1 {
    color: var(--primary-color);
    font-size: clamp(2rem, 5vw, 3rem);
    margin: 0;
}

main {
    display: grid;
    gap: 1.5rem;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
}

.card {
    background-color: var(--card-bg);
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    text-align: left;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
}

.card:hover, .card:focus-within {
    transform: translateY(-8px) scale(1.02);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
    outline: none;
}

.card:focus-within {
    outline: 2px solid var(--primary-color);
    outline-offset: 4px;
}

.card-header {
    display: flex;
    align-items: center;
    margin-bottom: 1rem;
}

.flag-icon {
    font-size: 2.5rem;
    margin-right: 1rem;
    filter: grayscale(20%);
}

h2.tournament-name {
    margin: 0;
    font-size: 1.4rem;
    color: var(--primary-color);
    line-height: 1.2;
}

.card-body p {
    margin: 0 0 0.5rem 0;
    color: #a0a0a0;
}

/* Paiement Section */
#paiement {
    padding: 30px;
    background-color: #f8f8f8;
    border-top: 2px solid #ccc;
    border-radius: 10px;
    margin-top: 40px;
}

#paiement h2 {
    text-align: center;
    color: #222;
}

#paiement div {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

#paiement div div {
    text-align: center;
    width: 200px;
    color: #333;
}
