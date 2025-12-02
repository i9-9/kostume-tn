<script>
// Ocultar productos de Private Sale en búsqueda
(function(){
    function hidePrivateSaleProducts() {
        // Buscar por clase y data-attribute
        var products = document.querySelectorAll('.js-private-sale-product, [data-private-sale="true"]');
        products.forEach(function(p) {
            p.style.display = 'none';
            p.remove(); // Remover completamente del DOM
        });
        
        // También buscar productos que tengan links a /private-sale
        var allProducts = document.querySelectorAll('.js-item-product, [data-product-id]');
        allProducts.forEach(function(p) {
            var links = p.querySelectorAll('a[href*="private-sale"]');
            if(links.length > 0) {
                p.style.display = 'none';
                p.remove();
            }
        });
    }
    
    // Ejecutar en búsqueda
    if(window.location.pathname.toLowerCase().indexOf('/search') !== -1 || window.location.search.indexOf('q=') !== -1) {
        // Ejecutar inmediatamente
        hidePrivateSaleProducts();
        
        // Ejecutar cuando el DOM esté listo
        if(document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', hidePrivateSaleProducts);
        }
        
        // Observar cambios en el DOM (para scroll infinito)
        var observer = new MutationObserver(hidePrivateSaleProducts);
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
        
        // También ejecutar periódicamente por si acaso
        setInterval(hidePrivateSaleProducts, 1000);
    }
})();

// Private Sale Protection - KOSTUMEPVT
(function(){
    // Solo ejecutar en /private-sale
    if(window.location.pathname.toLowerCase().indexOf('private-sale') === -1) return;
    
    var pwd = 'KOSTUMEPVT';
    var key = 'ps_ok';
    
    // Ya autenticado?
    try {
        var d = JSON.parse(localStorage.getItem(key) || '{}');
        if(d.ok && d.t > Date.now()) return;
    } catch(e){}
    
    // Crear overlay
    var overlay = document.createElement('div');
    overlay.id = 'ps-overlay';
    overlay.innerHTML = '<div id="ps-box"><h2>PRIVATE SALE</h2><p>Ingresá la contraseña para acceder</p><input type="password" id="ps-pwd" placeholder="Contraseña"><div id="ps-error" style="display:none">Contraseña incorrecta</div><button id="ps-submit">INGRESAR</button></div>';
    
    // Estilos
    var style = document.createElement('style');
    style.textContent = '#ps-overlay{position:fixed;top:0;left:0;width:100%;height:100%;background:#0a0a0a;z-index:999999;display:flex;align-items:center;justify-content:center}#ps-box{text-align:center;padding:40px;max-width:400px;width:90%}#ps-box h2{color:#fff;font-size:28px;letter-spacing:3px;margin:0 0 15px}#ps-box p{color:#888;font-size:14px;margin:0 0 30px}#ps-pwd{width:100%;padding:15px;font-size:16px;border:1px solid #333;background:#1a1a1a;color:#fff;text-align:center;box-sizing:border-box;margin-bottom:15px}#ps-pwd:focus{outline:none;border-color:#fff}#ps-error{color:#ff4444;font-size:13px;margin-bottom:15px}#ps-submit{width:100%;padding:15px;font-size:14px;font-weight:bold;letter-spacing:2px;background:#fff;color:#000;border:none;cursor:pointer}#ps-submit:hover{background:#ddd}';
    
    document.head.appendChild(style);
    document.body.appendChild(overlay);
    document.body.style.overflow = 'hidden';
    
    var input = document.getElementById('ps-pwd');
    var btn = document.getElementById('ps-submit');
    var err = document.getElementById('ps-error');
    
    function check(){
        var val = (input.value || '').trim().toUpperCase();
        if(val === pwd){
            localStorage.setItem(key, JSON.stringify({ok:true, t:Date.now()+86400000}));
            overlay.remove();
            document.body.style.overflow = '';
        } else {
            err.style.display = 'block';
            input.value = '';
            input.focus();
        }
    }
    
    btn.addEventListener('click', check);
    input.addEventListener('keypress', function(e){
        if(e.key === 'Enter') check();
    });
    
    input.focus();
})();
</script>
