document.addEventListener('DOMContentLoaded', () => {
    // 1. Navigation Scrolled State
    const navbar = document.getElementById('navbar');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 20) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // 2. OS Detection for Download Buttons
    const detectOS = () => {
        const userAgent = window.navigator.userAgent.toLowerCase();
        if (userAgent.includes('mac')) return 'Mac';
        if (userAgent.includes('win')) return 'Windows';
        if (userAgent.includes('linux')) return 'Linux';
        return 'Download';
    };

    const os = detectOS();
    const osTexts = document.querySelectorAll('.os-text');
    osTexts.forEach(el => {
        if (os !== 'Download') {
            el.textContent = `for ${os}`;
        } else {
            el.textContent = '';
        }
    });

    // 3. Command K Typing Animation Simulation
    const cmdKInputBox = document.querySelector('.cmd-k-input span');
    const textsToType = [
        "Add a subtle animation to the header component...",
        "Refactor this useEffect to be purely functional...",
        "Write unit tests for the Hero component...",
        "Generate a fully responsive navigation bar..."
    ];
    let textIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    let typingSpeed = 50;

    function typeEffect() {
        const currentText = textsToType[textIndex];
        
        if (isDeleting) {
            cmdKInputBox.textContent = currentText.substring(0, charIndex - 1);
            charIndex--;
            typingSpeed = 20; // Faster when deleting
        } else {
            cmdKInputBox.textContent = currentText.substring(0, charIndex + 1);
            charIndex++;
            typingSpeed = 50; // Normal speed typing
        }

        if (!isDeleting && charIndex === currentText.length) {
            // Pause at the end
            typingSpeed = 2000;
            isDeleting = true;
        } else if (isDeleting && charIndex === 0) {
            isDeleting = false;
            textIndex = (textIndex + 1) % textsToType.length;
            typingSpeed = 500; // Pause before new word
        }

        setTimeout(typeEffect, typingSpeed);
    }

    // Start typing effect after initial delay
    setTimeout(typeEffect, 1500);

    // 4. Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if(targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});
