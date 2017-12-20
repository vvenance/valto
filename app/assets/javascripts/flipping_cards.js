// window.setInterval (function () {
//     document.getElementById ("third-card").style.transform = "rotateY(" + document.getElementById ("third-card-controller").value + "deg)";
//     document.getElementById ("fifth-card").style.transform = "rotateX(" + document.getElementById ("fifth-card-controller").value + "deg)";
//     if (document.getElementById ("fifth-card-controller").value > 90) {
//         document.getElementById ("fifth-card").style.boxShadow = "0 -1px 3px rgba(0,0,0,0.12), 0 -1px 2px rgba(0,0,0,0.24)";
//     } else {
//         document.getElementById ("fifth-card").style.boxShadow = "0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)";
//     }
// }, 0);

function flip6CardToFront () {
    document.getElementById ("sixth-card").classList.remove ("show-back");
}

function flip6CardToBack () {
    document.getElementById ("sixth-card").classList.add ("show-back");
}

$('.flip').hover(function(){
        $(this).find('.card').toggleClass('flipped');

    });
