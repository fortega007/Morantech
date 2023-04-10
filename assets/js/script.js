
// & Script Dark Mode \(⌐■_■)ノ

var mode = document.getElementById('tema');
var body = document.getElementById('body');
var menu = document.getElementById('menu');
var sectBI = document.getElementById('section_banner_inicial');
var secC = document.getElementById('section_caixa');
var servico = document.getElementById('servico');
var footer = document.getElementById('footer');

mode.addEventListener('click', () => {
    if (mode.classList.contains('fa-moon')) {
        mode.classList.remove('fa-moon');
        mode.classList.add('fa-sun');

        sectBI.classList.add('dark_mode');
        menu.classList.add('dark_mode');
        body.classList.add('dark_mode');
        secC.classList.add('dark_mode');
        servico.classList.add('dark_mode');
        footer.classList.add('dark_mode');

    }
    else {
        mode.classList.remove('fa-sun');
        mode.classList.add('fa-moon');

        sectBI.classList.remove('dark_mode');
        menu.classList.remove('dark_mode');
        body.classList.remove('dark_mode');
        secC.classList.remove('dark_mode');
        servico.classList.remove('dark_mode');
        footer.classList.remove('dark_mode');
    }
})