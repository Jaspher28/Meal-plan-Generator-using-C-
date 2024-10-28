// carousel sart
$(document).ready(function () {
    $(".carouseltop-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        loop: true,
        center: true,
        dots: false,
        nav: true,
        navText: [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ],
        responsive: {
            0: {
                items: 1
            },
        }
    });
    // carousel end   


    // carousel blog start
    $(".carouselblog-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        loop: true,
        center: true,
        dots: false,
        nav: true,
        navText: [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ],
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            }
        }
    });
    // carousel blog end


    // carousel testimonial start
    $(".carouseltestimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        loop: true,
        center: true,
        dots: false,
        nav: true,
        navText: [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ],
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            }
        }
    });
});
// carousel testimonial end


// FAQ start
document.addEventListener('DOMContentLoaded', (event) => {
    const faqItems = document.querySelectorAll('.faq-item');

    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        question.addEventListener('click', () => {
            item.classList.toggle('active');
        });
    });
});
// FAQ end


// modal start
function createStrategicPlanModal() {
    var modal = new bootstrap.Modal(document.getElementById('strategicPlanModal'));
    modal.show();
}
// modal end


//modal styling start
const triggerButton = document.getElementById('triggerModal');
const strategicPlanModal = new bootstrap.Modal(document.getElementById('strategicPlanModal'));

triggerButton.addEventListener('click', function () {
    strategicPlanModal.show();
});
//modal styling end


// toast start
function showToast(type, message) {
    if (type === 'success') {
        document.getElementById('successToastBody').innerText = message;
        var successToast = new bootstrap.Toast(document.getElementById('successToast'));
        successToast.show();
    } else if (type === 'error') {
        document.getElementById('errorToastBody').innerText = message;
        var errorToast = new bootstrap.Toast(document.getElementById('errorToast'));
        errorToast.show();
    }
}
// toast end







