function HideParentMask() {
    if (parent.document.getElementById('mask') !== null) {
        window.parent.postMessage({ type: "toggleModal", isOpen: false }, "*");
    }
}

function ShowParentMask(modal) {
    if (parent.document.getElementById('mask') !== null) {
        window.parent.postMessage({ type: "toggleModal", isOpen: true }, "*");
        if (modal !== 'undefined' && (window.top.scrollY - 250) > 0) {
            $(modal).css('top', window.top.scrollY - 250); //set modal position
        }
    }
}

// FUNCION DETECTAR NAVEGADOR
function detectIE() {
    var ua = window.navigator.userAgent;

    var msie = ua.indexOf('MSIE');
    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        // IE 12 => return version number
        return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    // other browser
    return false;
}
// FIN FUNCION DETECTAR NAVEGADOR

//CENTRAR MODALES
function centerModal() {
    var getParentScroll = parent.window.pageYOffset;
    $(this).css('display', 'block');
    var dialogHeight = $(this).find(".modal-dialog").height();
    var $dialog = $(this).find(".modal-dialog"),
        offset = getParentScroll - (dialogHeight / 2);
    var windowHeight = $(parent.window).height(); //ALTO DE PANTALLA
    var documentHeight = $('body', window.parent.document).height(); //ALTO DEL DOCUMENTO
    var iframeHeight = $('#fraDetalle', window.parent.document).height(); //ALTO DEL IFRAME
    var footerHeight = $('#ccFooterPrivado', window.parent.document).height();
    var headerHeight = $('section.rowa.row', window.parent.document).height();

    //SI LA MODAL ES MAS GRANDE QUE LA PANTALLA
    if ((windowHeight - 80) < dialogHeight) {
        offset = getParentScroll - 150;
        //SI EL FOOTER ESTÁ A LA VISTA
        if (getParentScroll >= (documentHeight - windowHeight)) {
            //SI ES EXPLORER
            if (detectIE() == false) {
                offset = getParentScroll - 150;
            }
        } else if (getParentScroll >= ((documentHeight - windowHeight) - footerHeight)) {
            offset = getParentScroll - 150;
        } else if (getParentScroll < 160) {
            offset = getParentScroll + 20;
        }
    }
    //SI ES EXPLORER
    if (detectIE() != false) {
        offset = 20;
        $dialog.css("margin-top", offset);
    } else {
        offset = getParentScroll - headerHeight;
        $dialog.css("margin-top", offset + 20);
        if (getParentScroll < 160) {
            offset = 0;
            setTimeout(function () { $(parent.document).scrollTop(160); }, 10);
            $dialog.css("margin-top", 30);
        }
    }
}
//FIN CENTRAR MODALES