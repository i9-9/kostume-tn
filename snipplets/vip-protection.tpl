{# Private Sale — campaña 23 jul → 2 ago 2026 (ART) · password KOSTUMEPVT
   Categoría PRIVATE SALE suele estar OCULTA en el menú; listado solo en /private-sale.
   Copias PS NO deben verse en /productos u otras colecciones sin sesión.
   Con sesión PS activa, en search se muestran precios PS (y se oculta el gemelo público).
   Ventana de código: desde 22 jul (QA) hasta fin del 2 ago #}
{% set ps_protect_product = false %}
{% if template == 'product' %}
    {% set is_private_sale %}{% include 'snipplets/helpers/is-private-sale.tpl' %}{% endset %}
    {% set ps_protect_product = is_private_sale|trim == '1' %}
{% endif %}
<script>
(function(){
    var PS_KEY = 'ps_ok';

    function hasValidSession() {
        try {
            var d = JSON.parse(localStorage.getItem(PS_KEY) || '{}');
            return !!(d && d.ok && d.t > Date.now());
        } catch (e) {
            return false;
        }
    }

    function saveSession() {
        try {
            localStorage.setItem(PS_KEY, JSON.stringify({ok: true, t: Date.now() + 86400000}));
        } catch (e) {}
    }

    function isPrivateSaleNode(p) {
        if (!p) return false;
        if (p.classList && p.classList.contains('js-private-sale-product')) return true;
        if (p.getAttribute && p.getAttribute('data-private-sale') === 'true') return true;
        var links = p.querySelectorAll ? p.querySelectorAll('a[href]') : [];
        for (var i = 0; i < links.length; i++) {
            var href = (links[i].getAttribute('href') || '').toLowerCase();
            if (href.indexOf('private-sale') !== -1 || href.indexOf('-ps-') !== -1 || /\/[^\/]*-ps\/?(\?|$)/.test(href)) {
                return true;
            }
        }
        var nameEl = p.querySelector ? p.querySelector('.js-item-name, .item-name, .search-suggest-name') : null;
        var name = ((nameEl && nameEl.textContent) || '').trim().toLowerCase();
        if (/\bps\b/.test(name) || name.slice(-3) === ' ps') return true;
        return false;
    }

    function getProductName(p) {
        var nameEl = p.querySelector ? p.querySelector('.js-item-name, .item-name, .search-suggest-name') : null;
        return ((nameEl && nameEl.textContent) || '').replace(/\s+/g, ' ').trim().toLowerCase();
    }

    function normalizeBaseName(name) {
        return (name || '')
            .toLowerCase()
            .replace(/\bps\b/g, '')
            .replace(/\s+/g, ' ')
            .trim();
    }

    function isSearchContext() {
        var path = window.location.pathname.toLowerCase();
        if (path.indexOf('/search') !== -1) return true;
        if (document.querySelector('.search-page, [data-store="search-results"]')) return true;
        return false;
    }

    function hideNode(p) {
        p.style.display = 'none';
        if (p.parentNode) p.parentNode.removeChild(p);
    }

    function filterPrivateSaleProducts() {
        var path = window.location.pathname.toLowerCase();
        var allowPrivateSaleListing = path.indexOf('private-sale') !== -1;
        if (allowPrivateSaleListing) return;

        var products = document.querySelectorAll('.js-item-product, .search-suggest-item');
        var session = hasValidSession();
        var onSearch = isSearchContext();

        // Con sesión PS en search: mostrar PS y ocultar gemelo público
        if (session && onSearch) {
            var psBases = {};
            var nodes = [];
            products.forEach(function(p) {
                if (p.classList && p.classList.contains('search-suggest-all')) return;
                if (p.closest && p.closest('.product-detail, .js-product-container-detail, #single-product')) return;
                nodes.push(p);
                if (isPrivateSaleNode(p)) {
                    psBases[normalizeBaseName(getProductName(p))] = true;
                }
            });
            nodes.forEach(function(p) {
                if (isPrivateSaleNode(p)) return;
                var base = normalizeBaseName(getProductName(p));
                if (psBases[base]) {
                    hideNode(p);
                }
            });
            // Fuera de search no filtramos públicos; en search sin gemelo PS, el público queda
            return;
        }

        // Sin sesión (o fuera de search): ocultar copias Private Sale
        products.forEach(function(p) {
            if (p.classList && p.classList.contains('search-suggest-all')) return;
            if (p.closest && p.closest('.product-detail, .js-product-container-detail, #single-product')) return;
            if (isPrivateSaleNode(p)) {
                hideNode(p);
            }
        });

        try {
            if (window.$masonry_grid && typeof window.$masonry_grid.reloadItems === 'function') {
                window.$masonry_grid.reloadItems();
                window.$masonry_grid.layout();
            }
        } catch (e) {}
    }

    // Exponer para el gate de password
    window.__psHasValidSession = hasValidSession;
    window.__psSaveSession = saveSession;
    window.__psFilterProducts = filterPrivateSaleProducts;

    var path = window.location.pathname.toLowerCase();
    var allowPrivateSaleListing = path.indexOf('private-sale') !== -1;
    if (!allowPrivateSaleListing) {
        filterPrivateSaleProducts();
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', filterPrivateSaleProducts);
        }
        if (document.body) {
            var observer = new MutationObserver(function() {
                filterPrivateSaleProducts();
            });
            observer.observe(document.body, { childList: true, subtree: true });
        }
        setInterval(filterPrivateSaleProducts, 1000);

        // Si la página quedó vacía (todos eran PS), ir a la siguiente con productos
        function skipEmptyCatalogPage() {
            var grid = document.querySelector('.js-masonry-grid, .category-products-grid, [data-store="category-grid"]');
            if (!grid) return;
            var visible = grid.querySelectorAll('.js-item-product');
            if (visible.length > 0) return;
            var next = document.querySelector('.pagination a[aria-label="Next"], .pagination-arrow-container.pull-right a, a[rel="next"]');
            if (next && next.href && next.href !== window.location.href) {
                window.location.replace(next.href);
            }
        }
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function(){ setTimeout(skipEmptyCatalogPage, 100); });
        } else {
            setTimeout(skipEmptyCatalogPage, 100);
        }
    }
})();

// Protección por contraseña: URL /private-sale y fichas Private Sale (categoría/tag/PS)
(function(){
    var start = new Date('2026-07-22T00:00:00-03:00').getTime();
    var end = new Date('2026-08-03T00:00:00-03:00').getTime();
    if (Date.now() < start || Date.now() >= end) return;

    var path = window.location.pathname.toLowerCase();
    var isCategory = path.indexOf('private-sale') !== -1;
    var isProduct = {{ ps_protect_product ? 'true' : 'false' }};
    if (!isCategory && !isProduct) return;

    var pwd = 'KOSTUMEPVT';
    var scrollY = 0;

    function hasValidSession() {
        if (typeof window.__psHasValidSession === 'function') return window.__psHasValidSession();
        try {
            var d = JSON.parse(localStorage.getItem('ps_ok') || '{}');
            return !!(d && d.ok && d.t > Date.now());
        } catch (e) {
            return false;
        }
    }

    function saveSession() {
        if (typeof window.__psSaveSession === 'function') {
            window.__psSaveSession();
            return;
        }
        try {
            localStorage.setItem('ps_ok', JSON.stringify({ok: true, t: Date.now() + 86400000}));
        } catch (e) {}
    }

    if (hasValidSession()) return;

    function lockScroll() {
        scrollY = window.pageYOffset || document.documentElement.scrollTop || 0;
        document.documentElement.style.overflow = 'hidden';
        document.body.style.overflow = 'hidden';
    }

    function unlockScroll() {
        document.documentElement.style.overflow = '';
        document.body.style.overflow = '';
        window.scrollTo(0, scrollY);
    }

    function relayoutGrid() {
        try {
            if (window.$masonry_grid) {
                if (typeof window.$masonry_grid.reloadItems === 'function') {
                    window.$masonry_grid.reloadItems();
                }
                if (typeof window.$masonry_grid.layout === 'function') {
                    window.$masonry_grid.layout();
                }
            }
        } catch (e) {}
        try {
            window.dispatchEvent(new Event('resize'));
        } catch (e2) {}
    }

    function unlockAndRelayout(overlay) {
        if (overlay && overlay.parentNode) overlay.parentNode.removeChild(overlay);
        unlockScroll();
        relayoutGrid();
        setTimeout(relayoutGrid, 50);
        setTimeout(relayoutGrid, 250);
        setTimeout(relayoutGrid, 800);
        if (document.fonts && document.fonts.ready) {
            document.fonts.ready.then(function(){ setTimeout(relayoutGrid, 50); }).catch(function(){});
        }
        if (typeof window.__psFilterProducts === 'function') {
            setTimeout(window.__psFilterProducts, 50);
        }
    }

    function showModal() {
        if (document.getElementById('ps-overlay')) return;
        if (!document.body) {
            document.addEventListener('DOMContentLoaded', showModal);
            return;
        }

        var overlay = document.createElement('div');
        overlay.id = 'ps-overlay';
        overlay.setAttribute('role', 'dialog');
        overlay.setAttribute('aria-modal', 'true');
        overlay.setAttribute('aria-label', 'Private Sale');
        overlay.innerHTML = '' +
            '<div id="ps-box">' +
            '<h2>PRIVATE SALE</h2>' +
            '<p>Ingresá la contraseña para acceder</p>' +
            '<form id="ps-form" action="#" method="post" autocomplete="off">' +
            '<input type="password" id="ps-pwd" name="ps_pwd" placeholder="Contraseña" autocomplete="off" autocapitalize="characters" spellcheck="false" required>' +
            '<div id="ps-error" hidden>Contraseña incorrecta</div>' +
            '<button type="submit" id="ps-submit">INGRESAR</button>' +
            '</form>' +
            '</div>';

        var style = document.createElement('style');
        style.id = 'ps-overlay-style';
        style.textContent = '' +
            '#ps-overlay{position:fixed!important;top:0!important;left:0!important;right:0!important;bottom:0!important;width:100vw!important;height:100vh!important;height:100dvh!important;max-height:100vh;max-height:100dvh;background:#0a0a0a;z-index:2147483646;display:flex;align-items:center;justify-content:center;padding:20px;box-sizing:border-box;overflow:auto;-webkit-overflow-scrolling:touch;pointer-events:auto}' +
            '#ps-box{text-align:center;padding:40px 24px;max-width:400px;width:100%;position:relative;z-index:1;margin:auto}' +
            '#ps-box h2{color:#fff;font-size:28px;letter-spacing:3px;margin:0 0 15px;font-weight:700}' +
            '#ps-box p{color:#888;font-size:14px;margin:0 0 30px}' +
            '#ps-pwd{width:100%;padding:15px;font-size:16px;border:1px solid #333;background:#1a1a1a;color:#fff;text-align:center;box-sizing:border-box;margin:0 0 15px;border-radius:0;-webkit-appearance:none}' +
            '#ps-pwd:focus{outline:none;border-color:#fff}' +
            '#ps-error{color:#ff4444;font-size:13px;margin:0 0 15px}' +
            '#ps-error[hidden]{display:none!important}' +
            '#ps-submit{width:100%;padding:15px;font-size:14px;font-weight:bold;letter-spacing:2px;background:#fff;color:#000;border:none;cursor:pointer;border-radius:0}' +
            '#ps-submit:hover,#ps-submit:focus{background:#ddd;outline:none}';

        if (!document.getElementById('ps-overlay-style')) {
            document.head.appendChild(style);
        }
        document.body.appendChild(overlay);
        lockScroll();

        var form = document.getElementById('ps-form');
        var input = document.getElementById('ps-pwd');
        var err = document.getElementById('ps-error');

        function fail() {
            err.hidden = false;
            err.style.display = 'block';
            input.value = '';
            input.focus();
        }

        function check(e) {
            if (e) {
                e.preventDefault();
                e.stopPropagation();
            }
            var val = (input.value || '').trim().toUpperCase();
            if (val === pwd) {
                saveSession();
                unlockAndRelayout(overlay);
            } else {
                fail();
            }
        }

        form.addEventListener('submit', check);
        input.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') check(e);
        });
        overlay.addEventListener('click', function(e) {
            if (e.target === overlay) {
                input.focus();
            }
        });
        document.addEventListener('keydown', function(e) {
            if (!document.getElementById('ps-overlay')) return;
            if (e.key === 'Escape') {
                e.preventDefault();
                input.focus();
            }
        });

        setTimeout(function(){
            try { input.focus(); } catch (e) {}
        }, 50);
    }

    showModal();
})();
</script>
