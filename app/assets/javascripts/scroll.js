$(function () {
    $('.container').jscroll({
        nextSelector: 'span.next:last a',
        contentSelector: '.container'
    });
});

// $(function () {
//     $('.card-colomns').jscroll({
//         nextSelector: 'span.next:last a',
//         contentSelector: '.card-colomns'
//     });
// });

// $(window).on('scroll', function () {
//     scrollHeight = $(document).height();
//     scrollPosition = $(window).height() + $(window).scrollTop();
//     if ((scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
//         $('.container').jscroll({
//             nextSelector: 'span.next:last a',
//             contentSelector: '.container'
//         });
//     }
// });