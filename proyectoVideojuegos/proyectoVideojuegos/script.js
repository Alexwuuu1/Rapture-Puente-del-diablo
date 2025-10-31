// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Image gallery modal
function openModal(imgSrc, altText) {
    const modal = document.createElement('div');
    modal.classList.add('modal');
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="${imgSrc}" alt="${altText}" style="max-width: 100%; max-height: 80vh;">
        </div>
    `;
    document.body.appendChild(modal);

    modal.style.display = 'block';

    modal.querySelector('.close').onclick = function() {
        modal.style.display = 'none';
        document.body.removeChild(modal);
    };

    modal.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
            document.body.removeChild(modal);
        }
    };
}

// Add click event to images for modal
document.querySelectorAll('.card img, .historia img').forEach(img => {
    img.addEventListener('click', function() {
        openModal(this.src, this.alt);
    });
});

// Animate elements on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate');
        }
    });
}, observerOptions);

document.querySelectorAll('.card, .historia-intro, .historia-sinopsis').forEach(el => {
    observer.observe(el);
});

// Toggle mobile menu
const menuToggle = document.querySelector('.icono');
const nav = document.querySelector('.enlaces');

if (menuToggle) {
    menuToggle.addEventListener('click', () => {
        nav.classList.toggle('active');
    });
}
