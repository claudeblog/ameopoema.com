// Populate the sidebar
//
// This is a script, and not included directly in the page, to control the total size of the book.
// The TOC contains an entry for each page, so if each page includes a copy of the TOC,
// the total size of the page becomes O(n**2).
class MDBookSidebarScrollbox extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = '<ol class="chapter"><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-06-22-Haicai_ao_Artista.html"><strong aria-hidden="true">1.</strong> Haicai ao Artista</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-06-02-Haicai_desejo.html"><strong aria-hidden="true">2.</strong> Haicai desejo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-06-01-Haicai_preocupado.html"><strong aria-hidden="true">3.</strong> Haicai preocupado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-31-Se_sua_casa_pegar_fogo.html"><strong aria-hidden="true">4.</strong> Se sua casa pegar fogo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-25-Haicai_detento.html"><strong aria-hidden="true">5.</strong> Haicai detento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-25-Haicai_de_prático.html"><strong aria-hidden="true">6.</strong> Haicai de prático</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-25-Haicai_de_Conteúdo.html"><strong aria-hidden="true">7.</strong> Haicai de Conteúdo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-25-Haicai_de_Bet.html"><strong aria-hidden="true">8.</strong> Haicai de Bet</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-25-Haicai_de_acidente.html"><strong aria-hidden="true">9.</strong> Haicai de acidente</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-22-Haicai_de_Livro.html"><strong aria-hidden="true">10.</strong> Haicai de Livro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-08-Haicai_de_gole.html"><strong aria-hidden="true">11.</strong> Haicai de gole</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-05-02-Textículos_Camisetas_pretas.html"><strong aria-hidden="true">12.</strong> Textículos Camisetas pretas</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-27-Haicai_me_leve.html"><strong aria-hidden="true">13.</strong> Haicai me leve</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-27-Haicai_Malescrito.html"><strong aria-hidden="true">14.</strong> Haicai Malescrito</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-27-Haicai_de_jogos.html"><strong aria-hidden="true">15.</strong> Haicai de jogos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-26-Haicai_de_amigos.html"><strong aria-hidden="true">16.</strong> Haicai de amigos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-20-Haicaiu_o_PIB.html"><strong aria-hidden="true">17.</strong> Haicaiu o PIB</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-04-20-Haicai_de_PIB.html"><strong aria-hidden="true">18.</strong> Haicai de PIB</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-21-Haicai_de_espera.html"><strong aria-hidden="true">19.</strong> Haicai de espera</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-21-Haicai_de_Ânsia.html"><strong aria-hidden="true">20.</strong> Haicai de Ânsia</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-09-Texticulos_Descalços_fazendo_o_caminho.html"><strong aria-hidden="true">21.</strong> Texticulos Descalços fazendo o caminho</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-09-Haicai_Destóico.html"><strong aria-hidden="true">22.</strong> Haicai Destóico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-09-Haicai_de_maratona.html"><strong aria-hidden="true">23.</strong> Haicai de maratona</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-09-Haicai_de_Decalque.html"><strong aria-hidden="true">24.</strong> Haicai de Decalque</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-07-Haicai_de_Desencontro.html"><strong aria-hidden="true">25.</strong> Haicai de Desencontro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-07-Culpa_e_resignação.html"><strong aria-hidden="true">26.</strong> Culpa e resignação</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-02-03-Haicai_Fora_do_ar.html"><strong aria-hidden="true">27.</strong> Haicai Fora do ar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-29-Haicai_Nefelibata.html"><strong aria-hidden="true">28.</strong> Haicai Nefelibata</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-25-Haicai_de_rodeio.html"><strong aria-hidden="true">29.</strong> Haicai de rodeio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-24-Haicai_de_dia_livre.html"><strong aria-hidden="true">30.</strong> Haicai de dia livre</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-22-Haicai_de_frustração.html"><strong aria-hidden="true">31.</strong> Haicai de frustração</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-18-Haicai_Favela.html"><strong aria-hidden="true">32.</strong> Haicai Favela</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-12-Haicai_dispoente.html"><strong aria-hidden="true">33.</strong> Haicai dispoente</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-11-Haicai_de_Equilíbrio.html"><strong aria-hidden="true">34.</strong> Haicai de Equilíbrio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-10-Poesias_Hombridade_Solo.html"><strong aria-hidden="true">35.</strong> Poesias Hombridade Solo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-08-Haicai_de_veto.html"><strong aria-hidden="true">36.</strong> Haicai de veto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-05-Textículo_55_Transfuga_de_Classe_Mudança_e_Caminhos.html"><strong aria-hidden="true">37.</strong> Textículo 55 Transfuga de Classe Mudança e Caminhos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-03-Haicai_Revitalizar.html"><strong aria-hidden="true">38.</strong> Haicai Revitalizar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-02-Haicai_de_Acesso.html"><strong aria-hidden="true">39.</strong> Haicai de Acesso</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2026-01-01-Haicai_Sankofa.html"><strong aria-hidden="true">40.</strong> Haicai Sankofa</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-31-Haicai_de_fim.html"><strong aria-hidden="true">41.</strong> Haicai de fim</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-29-Haicai_Á_vó_nova.html"><strong aria-hidden="true">42.</strong> Haicai Á vó nova</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-26-Haicai_Circular.html"><strong aria-hidden="true">43.</strong> Haicai Circular</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-25-Haicai_de_partilha.html"><strong aria-hidden="true">44.</strong> Haicai de partilha</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-24-Haicai_de_Rigidez.html"><strong aria-hidden="true">45.</strong> Haicai de Rigidez</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-23-Haicai_Recontinuar.html"><strong aria-hidden="true">46.</strong> Haicai Recontinuar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-17-Haicai_Hiperativo.html"><strong aria-hidden="true">47.</strong> Haicai Hiperativo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-13-Haicai_Aos_Sábados.html"><strong aria-hidden="true">48.</strong> Haicai Aos Sábados</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-03-Poeminha_de_Transbordo.html"><strong aria-hidden="true">49.</strong> Poeminha de Transbordo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-12-03-Ame_Ó_Poesia.html"><strong aria-hidden="true">50.</strong> Ame Ó Poesia</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-11-25-Delírios_e_Devaneios.html"><strong aria-hidden="true">51.</strong> Delírios e Devaneios</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-11-19-Haicai_de_programa.html"><strong aria-hidden="true">52.</strong> Haicai de programa</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-11-15-Haicai_Distraído.html"><strong aria-hidden="true">53.</strong> Haicai Distraído</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-11-05-Haicai_em_Chiaroscuro.html"><strong aria-hidden="true">54.</strong> Haicai em Chiaroscuro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-11-04-Haïku_Impressionniste.html"><strong aria-hidden="true">55.</strong> Haïku Impressionniste</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-22-Hoje_fui_contornado_por_um_arco_Iris.html"><strong aria-hidden="true">56.</strong> Hoje fui contornado por um arco Iris</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-21-Haicai_tampouco.html"><strong aria-hidden="true">57.</strong> Haicai tampouco</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-18-Haicai_de_Pai.html"><strong aria-hidden="true">58.</strong> Haicai de Pai</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-16-Haicai_de_Coabito.html"><strong aria-hidden="true">59.</strong> Haicai de Coabito</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-15-Haicai_de_Faxina.html"><strong aria-hidden="true">60.</strong> Haicai de Faxina</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-14-Haicai_de_recursos_humanos.html"><strong aria-hidden="true">61.</strong> Haicai de recursos humanos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-04-Haicai_de_Fome.html"><strong aria-hidden="true">62.</strong> Haicai de Fome</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-10-02-Haicai_Compensatório.html"><strong aria-hidden="true">63.</strong> Haicai Compensatório</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-30-Haicai_de_Paradeiro.html"><strong aria-hidden="true">64.</strong> Haicai de Paradeiro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-29-Haicai_Geracional.html"><strong aria-hidden="true">65.</strong> Haicai Geracional</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-28-Haicai_de_Parabéns.html"><strong aria-hidden="true">66.</strong> Haicai de Parabéns</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-17-Haicai_de_Skank.html"><strong aria-hidden="true">67.</strong> Haicai de Skank</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-16-Haicai_de_Burnout.html"><strong aria-hidden="true">68.</strong> Haicai de Burnout</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-15-Haicai_de_Sonho.html"><strong aria-hidden="true">69.</strong> Haicai de Sonho</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-10-Haicai_Regado.html"><strong aria-hidden="true">70.</strong> Haicai Regado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-09-Haicai_Podado.html"><strong aria-hidden="true">71.</strong> Haicai Podado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-07-Haicai_Respire.html"><strong aria-hidden="true">72.</strong> Haicai Respire</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-02-Haicai_Eu_Esqueço.html"><strong aria-hidden="true">73.</strong> Haicai Eu Esqueço</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-09-01-Haicai_Corrompido.html"><strong aria-hidden="true">74.</strong> Haicai Corrompido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-31-Hoje_contornei_um_arco_íris.html"><strong aria-hidden="true">75.</strong> Hoje contornei um arco íris</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-31-Haicai_de_Arcoíris.html"><strong aria-hidden="true">76.</strong> Haicai de Arcoíris</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-28-Haicai_só_hoje.html"><strong aria-hidden="true">77.</strong> Haicai só hoje</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-27-Haicai_Revisto.html"><strong aria-hidden="true">78.</strong> Haicai Revisto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-26-Haicai_Doase.html"><strong aria-hidden="true">79.</strong> Haicai Doase</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-25-Haicai_Horizontal.html"><strong aria-hidden="true">80.</strong> Haicai Horizontal</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-21-Haicai_Bilingue.html"><strong aria-hidden="true">81.</strong> Haicai Bilingue</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-18-Haicai_Brasílis.html"><strong aria-hidden="true">82.</strong> Haicai Brasílis</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-17-Haicai_Dejavu.html"><strong aria-hidden="true">83.</strong> Haicai Dejavu</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-15-Haicai_de_Penso.html"><strong aria-hidden="true">84.</strong> Haicai de Penso</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-14-Haicai_Extremamente_Fácil.html"><strong aria-hidden="true">85.</strong> Haicai Extremamente Fácil</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-12-Haicalismo.html"><strong aria-hidden="true">86.</strong> Haicalismo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-10-Haicai_de_Pensamento.html"><strong aria-hidden="true">87.</strong> Haicai de Pensamento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-09-Haicais_de_seria.html"><strong aria-hidden="true">88.</strong> Haicais de seria</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-08-Palindromo_Ó_vovó.html"><strong aria-hidden="true">89.</strong> Palindromo Ó vovó</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-06-Haicai_vulnerável.html"><strong aria-hidden="true">90.</strong> Haicai vulnerável</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-05-Haicai_Tupinambá.html"><strong aria-hidden="true">91.</strong> Haicai Tupinambá</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Textículo_Reencontrado_1_Pés_de_vento.html"><strong aria-hidden="true">92.</strong> Textículo Reencontrado 1 Pés de vento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_reencontradas_Versinho_de_Dor.html"><strong aria-hidden="true">93.</strong> Poesias reencontradas Versinho de Dor</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_Reencontradas_Rascunhicídio.html"><strong aria-hidden="true">94.</strong> Poesias Reencontradas Rascunhicídio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_Reencontradas_Natureza_da_árvore.html"><strong aria-hidden="true">95.</strong> Poesias Reencontradas Natureza da árvore</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_Reencontradas_Fim_do_ano_sem_fim.html"><strong aria-hidden="true">96.</strong> Poesias Reencontradas Fim do ano sem fim</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_Reencontradas_Falta.html"><strong aria-hidden="true">97.</strong> Poesias Reencontradas Falta</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Poesias_Hoje_sairei_de_casa.html"><strong aria-hidden="true">98.</strong> Poesias Hoje sairei de casa</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-O_tempo_não_para.html"><strong aria-hidden="true">99.</strong> O tempo não para</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Haicai_de_Passeio.html"><strong aria-hidden="true">100.</strong> Haicai de Passeio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-04-Haicai_Amarelo.html"><strong aria-hidden="true">101.</strong> Haicai Amarelo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-08-03-Haicai_Caminha.html"><strong aria-hidden="true">102.</strong> Haicai Caminha</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-30-Haicai_Reencontrado.html"><strong aria-hidden="true">103.</strong> Haicai Reencontrado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-29-Haicai_de_Imbróglio.html"><strong aria-hidden="true">104.</strong> Haicai de Imbróglio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-29-Haicai_de_desamparo.html"><strong aria-hidden="true">105.</strong> Haicai de desamparo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-28-Haicai_Insit.html"><strong aria-hidden="true">106.</strong> Haicai Insit</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-28-Aviso_estou_morrendo.html"><strong aria-hidden="true">107.</strong> Aviso estou morrendo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-27-Haicai_de_emergência.html"><strong aria-hidden="true">108.</strong> Haicai de emergência</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-26-Haicai_comentado.html"><strong aria-hidden="true">109.</strong> Haicai comentado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-25-Haicai_Essencialista.html"><strong aria-hidden="true">110.</strong> Haicai Essencialista</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-24-Haicai_de_semeador.html"><strong aria-hidden="true">111.</strong> Haicai de semeador</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-22-Haicai_de_Escritura.html"><strong aria-hidden="true">112.</strong> Haicai de Escritura</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-22-Haicai_a_Ozzy.html"><strong aria-hidden="true">113.</strong> Haicai a Ozzy</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-21-Haicai_de_Fofoca.html"><strong aria-hidden="true">114.</strong> Haicai de Fofoca</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-20-Haicai_de_Preenchimento.html"><strong aria-hidden="true">115.</strong> Haicai de Preenchimento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-19-Haicai_a_Madonna.html"><strong aria-hidden="true">116.</strong> Haicai a Madonna</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-18-Apesar_de_Você.html"><strong aria-hidden="true">117.</strong> Apesar de Você</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-17-Haicai_Devirista.html"><strong aria-hidden="true">118.</strong> Haicai Devirista</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-16-Haicai_Latino.html"><strong aria-hidden="true">119.</strong> Haicai Latino</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-14-Timbres_Personas_e_Descobertas.html"><strong aria-hidden="true">120.</strong> Timbres Personas e Descobertas</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-13-Haicai_de_Pintura.html"><strong aria-hidden="true">121.</strong> Haicai de Pintura</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-11-Haicai_de_Sementes.html"><strong aria-hidden="true">122.</strong> Haicai de Sementes</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-10-Haicai_Hostil.html"><strong aria-hidden="true">123.</strong> Haicai Hostil</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-09-Haicai_de_Mão.html"><strong aria-hidden="true">124.</strong> Haicai de Mão</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-08-Haicai_16mil.html"><strong aria-hidden="true">125.</strong> Haicai 16mil</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-07-Haicai_de_Garra.html"><strong aria-hidden="true">126.</strong> Haicai de Garra</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-06-Haicai_de_Passagem.html"><strong aria-hidden="true">127.</strong> Haicai de Passagem</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-05-Haicai_Temporão.html"><strong aria-hidden="true">128.</strong> Haicai Temporão</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-04-Haicai_de_Arte.html"><strong aria-hidden="true">129.</strong> Haicai de Arte</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-03-Haicai_de_Bailarina.html"><strong aria-hidden="true">130.</strong> Haicai de Bailarina</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-02-Haicai_Pela_Metade.html"><strong aria-hidden="true">131.</strong> Haicai Pela Metade</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-07-01-Haicai_de_convalescência.html"><strong aria-hidden="true">132.</strong> Haicai de convalescência</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-30-Haicai_de_Resistência.html"><strong aria-hidden="true">133.</strong> Haicai de Resistência</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-29-Haicai_Vital.html"><strong aria-hidden="true">134.</strong> Haicai Vital</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-28-Haicai_Mudo.html"><strong aria-hidden="true">135.</strong> Haicai Mudo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-27-Mudança.html"><strong aria-hidden="true">136.</strong> Mudança</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-27-Haicai_de_Trauma.html"><strong aria-hidden="true">137.</strong> Haicai de Trauma</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-26-Haicai_Luto.html"><strong aria-hidden="true">138.</strong> Haicai Luto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-25-Haicai_de_frete.html"><strong aria-hidden="true">139.</strong> Haicai de frete</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-24-Haicai_de_mudança.html"><strong aria-hidden="true">140.</strong> Haicai de mudança</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-19-Ei_Erra_Farreie.html"><strong aria-hidden="true">141.</strong> Ei Erra Farreie</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-18-Haicai_de_resmas.html"><strong aria-hidden="true">142.</strong> Haicai de resmas</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-16-Haicai_era_Acróstico.html"><strong aria-hidden="true">143.</strong> Haicai era Acróstico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-15-Poema_Palindromo_O_colo.html"><strong aria-hidden="true">144.</strong> Poema Palindromo O colo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-15-Haicais_Acrósticos.html"><strong aria-hidden="true">145.</strong> Haicais Acrósticos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-15-Haicai_Aos_acrósticos.html"><strong aria-hidden="true">146.</strong> Haicai Aos acrósticos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-14-Haicai_de_Legado.html"><strong aria-hidden="true">147.</strong> Haicai de Legado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-13-Haicai_à_Antônia.html"><strong aria-hidden="true">148.</strong> Haicai à Antônia</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-12-Só_então_vai_se_tornar.html"><strong aria-hidden="true">149.</strong> Só então vai se tornar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-12-Haicai_Ora_acróstico.html"><strong aria-hidden="true">150.</strong> Haicai Ora acróstico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-11-Haicai_São_acrósticos.html"><strong aria-hidden="true">151.</strong> Haicai São acrósticos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-10-Materiais_Sensíveis.html"><strong aria-hidden="true">152.</strong> Materiais Sensíveis</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-10-Haicai_aos_acrósticos.html"><strong aria-hidden="true">153.</strong> Haicai aos acrósticos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-09-Haicai_de_Valeu.html"><strong aria-hidden="true">154.</strong> Haicai de Valeu</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-08-Haicai_de_Quermesse.html"><strong aria-hidden="true">155.</strong> Haicai de Quermesse</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-07-Haicai_de_Ontem.html"><strong aria-hidden="true">156.</strong> Haicai de Ontem</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-05-Haicai_de_Vidro.html"><strong aria-hidden="true">157.</strong> Haicai de Vidro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-04-Haicai_de_Amizade.html"><strong aria-hidden="true">158.</strong> Haicai de Amizade</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-02-Haicai_de_Amor.html"><strong aria-hidden="true">159.</strong> Haicai de Amor</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-06-01-Haicai_de_Melhores_Pessoas.html"><strong aria-hidden="true">160.</strong> Haicai de Melhores Pessoas</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-30-Haicai_Proibido.html"><strong aria-hidden="true">161.</strong> Haicai Proibido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-29-Haicai_de_Entrega.html"><strong aria-hidden="true">162.</strong> Haicai de Entrega</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-28-Haicai_de_Porcelana.html"><strong aria-hidden="true">163.</strong> Haicai de Porcelana</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-27-Haicai_de_Cristais.html"><strong aria-hidden="true">164.</strong> Haicai de Cristais</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-26-Haicai_de_Louça.html"><strong aria-hidden="true">165.</strong> Haicai de Louça</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-25-Haicai_de_ficha.html"><strong aria-hidden="true">166.</strong> Haicai de ficha</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-22-Haicai_de_Sono.html"><strong aria-hidden="true">167.</strong> Haicai de Sono</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-21-Haicai_Revivido.html"><strong aria-hidden="true">168.</strong> Haicai Revivido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-15-Haicai_de_Passagem.html"><strong aria-hidden="true">169.</strong> Haicai de Passagem</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-14-Perdão.html"><strong aria-hidden="true">170.</strong> Perdão</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-13-Haicai_à_Mujica.html"><strong aria-hidden="true">171.</strong> Haicai à Mujica</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-12-Haicai_de_pet.html"><strong aria-hidden="true">172.</strong> Haicai de pet</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-11-Haicai_de_Vazio.html"><strong aria-hidden="true">173.</strong> Haicai de Vazio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-10-Haicai_de_acaso.html"><strong aria-hidden="true">174.</strong> Haicai de acaso</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-09-Haicai_de_enterrador.html"><strong aria-hidden="true">175.</strong> Haicai de enterrador</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-08-Haicai_de_Nunca_Mais.html"><strong aria-hidden="true">176.</strong> Haicai de Nunca Mais</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-07-Haicai_do_garoto.html"><strong aria-hidden="true">177.</strong> Haicai do garoto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-06-Haicai_Eventual.html"><strong aria-hidden="true">178.</strong> Haicai Eventual</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-02-Haicai_de_Tempo.html"><strong aria-hidden="true">179.</strong> Haicai de Tempo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-05-01-Ananá_Banana_Ana.html"><strong aria-hidden="true">180.</strong> Ananá Banana Ana</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-30-Haicai_de_Trinta.html"><strong aria-hidden="true">181.</strong> Haicai de Trinta</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-29-Haicai_de_Aniversário.html"><strong aria-hidden="true">182.</strong> Haicai de Aniversário</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-28-Haicai_Original.html"><strong aria-hidden="true">183.</strong> Haicai Original</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-27-Haicai_Íntimo.html"><strong aria-hidden="true">184.</strong> Haicai Íntimo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-26-Haicai_de_velho.html"><strong aria-hidden="true">185.</strong> Haicai de velho</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-24-Rejeição.html"><strong aria-hidden="true">186.</strong> Rejeição</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-24-Haicai_Desoriginalizado.html"><strong aria-hidden="true">187.</strong> Haicai Desoriginalizado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-23-Haicais_de_cabeça.html"><strong aria-hidden="true">188.</strong> Haicais de cabeça</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-22-Haicai_de_Samba.html"><strong aria-hidden="true">189.</strong> Haicai de Samba</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-21-Haicais_coincidente.html"><strong aria-hidden="true">190.</strong> Haicais coincidente</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-20-Haicai_Quaresmal.html"><strong aria-hidden="true">191.</strong> Haicai Quaresmal</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-19-Sem_fins_lucrativos.html"><strong aria-hidden="true">192.</strong> Sem fins lucrativos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-19-Haicai_Limerente.html"><strong aria-hidden="true">193.</strong> Haicai Limerente</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-18-Haicai_de_Refúgio.html"><strong aria-hidden="true">194.</strong> Haicai de Refúgio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-17-Haicai_de_Ruptura.html"><strong aria-hidden="true">195.</strong> Haicai de Ruptura</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-04-01-Poemas_Palíndromo_Eu_quê.html"><strong aria-hidden="true">196.</strong> Poemas Palíndromo Eu quê</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-29-Sobresalências.html"><strong aria-hidden="true">197.</strong> Sobresalências</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-29-Poemas_Palíndromo_Da_Terra.html"><strong aria-hidden="true">198.</strong> Poemas Palíndromo Da Terra</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-29-Haicai_de_diferença.html"><strong aria-hidden="true">199.</strong> Haicai de diferença</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-29-Haicai_Colorido.html"><strong aria-hidden="true">200.</strong> Haicai Colorido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-28-Haicai_Atentoh.html"><strong aria-hidden="true">201.</strong> Haicai Atentoh</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-24-Troco_acolhimento.html"><strong aria-hidden="true">202.</strong> Troco acolhimento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-23-Haicai_de_coração.html"><strong aria-hidden="true">203.</strong> Haicai de coração</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-18-Refluxo_gastroencefálico.html"><strong aria-hidden="true">204.</strong> Refluxo gastroencefálico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-14-Haicai_à_Ritalee.html"><strong aria-hidden="true">205.</strong> Haicai à Ritalee</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-12-O_mímico.html"><strong aria-hidden="true">206.</strong> O mímico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-11-Haicais_de_Tratamento.html"><strong aria-hidden="true">207.</strong> Haicais de Tratamento</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-10-Haicai_Sentido.html"><strong aria-hidden="true">208.</strong> Haicai Sentido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-09-Haicai_Incontido.html"><strong aria-hidden="true">209.</strong> Haicai Incontido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-08-Haicai_autocorreto.html"><strong aria-hidden="true">210.</strong> Haicai autocorreto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-06-Haicais_Substituto.html"><strong aria-hidden="true">211.</strong> Haicais Substituto</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-05-Soneto_Palindromia_Sonética.html"><strong aria-hidden="true">212.</strong> Soneto Palindromia Sonética</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-05-Pare_Lola_descanse.html"><strong aria-hidden="true">213.</strong> Pare Lola descanse</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-05-Haicai_Insone.html"><strong aria-hidden="true">214.</strong> Haicai Insone</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-04-Haicai_Brutalista.html"><strong aria-hidden="true">215.</strong> Haicai Brutalista</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-03-Poemas_Palíndromos_Ramos_a_somar.html"><strong aria-hidden="true">216.</strong> Poemas Palíndromos Ramos a somar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-03-Haicai_Relaxante.html"><strong aria-hidden="true">217.</strong> Haicai Relaxante</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-02-Haicai_às_Eunices.html"><strong aria-hidden="true">218.</strong> Haicai às Eunices</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-03-01-Haicai_afiado.html"><strong aria-hidden="true">219.</strong> Haicai afiado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-28-Haicai_Haver.html"><strong aria-hidden="true">220.</strong> Haicai Haver</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-27-TDAHaicai.html"><strong aria-hidden="true">221.</strong> TDAHaicai</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-27-Movimentação.html"><strong aria-hidden="true">222.</strong> Movimentação</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-26-Hai_Cai_de_Patins.html"><strong aria-hidden="true">223.</strong> Hai Cai de Patins</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-25-Haicais_enterrados.html"><strong aria-hidden="true">224.</strong> Haicais enterrados</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-25-Haicai_de_ônibus.html"><strong aria-hidden="true">225.</strong> Haicai de ônibus</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-24-Haicai_Lunar.html"><strong aria-hidden="true">226.</strong> Haicai Lunar</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-21-Haicai_Sobre_Vida.html"><strong aria-hidden="true">227.</strong> Haicai Sobre Vida</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-21-Haicais_de_Fios_e_fé.html"><strong aria-hidden="true">228.</strong> Haicais de Fios e fé</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-18-Haicais_Silenciosos.html"><strong aria-hidden="true">229.</strong> Haicais Silenciosos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-16-Pequeno_Espacinho.html"><strong aria-hidden="true">230.</strong> Pequeno Espacinho</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-12-Haicais_sobre_nós.html"><strong aria-hidden="true">231.</strong> Haicais sobre nós</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-07-Poesia_Errada_Prioridades.html"><strong aria-hidden="true">232.</strong> Poesia Errada Prioridades</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-02-01-Poesia_Roubada_Tu_me_manques.html"><strong aria-hidden="true">233.</strong> Poesia Roubada Tu me manques</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-30-Haicai_Apagado.html"><strong aria-hidden="true">234.</strong> Haicai Apagado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-29-Reviver_e_viver.html"><strong aria-hidden="true">235.</strong> Reviver e viver</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-29-Haicai_Reduzido.html"><strong aria-hidden="true">236.</strong> Haicai Reduzido</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-27-Haicai_de_Autoengano.html"><strong aria-hidden="true">237.</strong> Haicai de Autoengano</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-26-Haicai_excitado.html"><strong aria-hidden="true">238.</strong> Haicai excitado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-25-Haicai_derramado.html"><strong aria-hidden="true">239.</strong> Haicai derramado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-24-Haicai_espinhoso.html"><strong aria-hidden="true">240.</strong> Haicai espinhoso</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-23-Haicai_de_Uva.html"><strong aria-hidden="true">241.</strong> Haicai de Uva</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-22-Haicai_Aéreo.html"><strong aria-hidden="true">242.</strong> Haicai Aéreo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-21-Haicai_Cítrico.html"><strong aria-hidden="true">243.</strong> Haicai Cítrico</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-20-Haicai_de_Parede.html"><strong aria-hidden="true">244.</strong> Haicai de Parede</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-19-Um_Haicai_Sobre_Nós.html"><strong aria-hidden="true">245.</strong> Um Haicai Sobre Nós</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-18-Haicai_pro_futuro.html"><strong aria-hidden="true">246.</strong> Haicai pro futuro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-17-Haicai_Do_Silêncio.html"><strong aria-hidden="true">247.</strong> Haicai Do Silêncio</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-16-Haicai_da_Indiferença.html"><strong aria-hidden="true">248.</strong> Haicai da Indiferença</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-15-Oração_Proteção.html"><strong aria-hidden="true">249.</strong> Oração Proteção</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-15-O_Primeiro_Notívago.html"><strong aria-hidden="true">250.</strong> O Primeiro Notívago</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-15-Manhãs_de_segunda_ou_Equilíbrio_de_gatos.html"><strong aria-hidden="true">251.</strong> Manhãs de segunda ou Equilíbrio de gatos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-15-Haicai_do_Aterro.html"><strong aria-hidden="true">252.</strong> Haicai do Aterro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-15-A_Casa.html"><strong aria-hidden="true">253.</strong> A Casa</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-14-Haicai_Inaugural.html"><strong aria-hidden="true">254.</strong> Haicai Inaugural</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-13-Ser_e_viver_reviveres.html"><strong aria-hidden="true">255.</strong> Ser e viver reviveres</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-13-Primeiros_Haicais.html"><strong aria-hidden="true">256.</strong> Primeiros Haicais</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-13-Haicai_do_Morro.html"><strong aria-hidden="true">257.</strong> Haicai do Morro</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-12-Haicai_Fiado.html"><strong aria-hidden="true">258.</strong> Haicai Fiado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-11-Haicai_Doído.html"><strong aria-hidden="true">259.</strong> Haicai Doído</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-10-Samba_de_fé.html"><strong aria-hidden="true">260.</strong> Samba de fé</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-10-Haicai_para_viagem.html"><strong aria-hidden="true">261.</strong> Haicai para viagem</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-09-Haicai_sobre_Haicais.html"><strong aria-hidden="true">262.</strong> Haicai sobre Haicais</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-08-Haicai_de_Aprendizado.html"><strong aria-hidden="true">263.</strong> Haicai de Aprendizado</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-07-Haicai_de_Sonho.html"><strong aria-hidden="true">264.</strong> Haicai de Sonho</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-06-Haicai_de_Força.html"><strong aria-hidden="true">265.</strong> Haicai de Força</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-05-Haicai_do_Grito.html"><strong aria-hidden="true">266.</strong> Haicai do Grito</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-04-Haicai_de_Liberdade.html"><strong aria-hidden="true">267.</strong> Haicai de Liberdade</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-03-Haicai_do_compromisso.html"><strong aria-hidden="true">268.</strong> Haicai do compromisso</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-02-Haicai_de_Alma.html"><strong aria-hidden="true">269.</strong> Haicai de Alma</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2025-01-01-Haicai_de_Ano_novo.html"><strong aria-hidden="true">270.</strong> Haicai de Ano novo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-12-30-Me_ser_e_tecer.html"><strong aria-hidden="true">271.</strong> Me ser e tecer</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-12-29-Floresça.html"><strong aria-hidden="true">272.</strong> Floresça</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-12-13-Poemas_Roubados_Tacituras.html"><strong aria-hidden="true">273.</strong> Poemas Roubados Tacituras</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-10-29-Poemas_Palíndromo_À_diva.html"><strong aria-hidden="true">274.</strong> Poemas Palíndromo À diva</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-10-06-Haicais_do_Arvoredo.html"><strong aria-hidden="true">275.</strong> Haicais do Arvoredo</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-10-01-Poemas_Roubados_Tenho_roubado_versos.html"><strong aria-hidden="true">276.</strong> Poemas Roubados Tenho roubado versos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="2024-01-01-Creditos.html"><strong aria-hidden="true">277.</strong> Creditos</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="Capa.html"><strong aria-hidden="true">278.</strong> Capa</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="SUMMARY.html"><strong aria-hidden="true">279.</strong> Summary</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="About.html"><strong aria-hidden="true">280.</strong> About</a></span></li><li class="chapter-item expanded "><span class="chapter-link-wrapper"><a href="RSS.html"><strong aria-hidden="true">281.</strong> RSS Feed</a></span></li></ol>';
        // Set the current, active page, and reveal it if it's hidden
        let current_page = document.location.href.toString().split('#')[0].split('?')[0];
        if (current_page.endsWith('/')) {
            current_page += 'index.html';
        }
        const links = Array.prototype.slice.call(this.querySelectorAll('a'));
        const l = links.length;
        for (let i = 0; i < l; ++i) {
            const link = links[i];
            const href = link.getAttribute('href');
            if (href && !href.startsWith('#') && !/^(?:[a-z+]+:)?\/\//.test(href)) {
                link.href = path_to_root + href;
            }
            // The 'index' page is supposed to alias the first chapter in the book.
            // Check both with and without the '.html' suffix to be robust against pretty URLs
            if (link.href.replace(/\.html$/, '') === current_page.replace(/\.html$/, '')
                || i === 0
                && path_to_root === ''
                && current_page.endsWith('/index.html')) {
                link.classList.add('active');
                let parent = link.parentElement;
                while (parent) {
                    if (parent.tagName === 'LI' && parent.classList.contains('chapter-item')) {
                        parent.classList.add('expanded');
                    }
                    parent = parent.parentElement;
                }
            }
        }
        // Track and set sidebar scroll position
        this.addEventListener('click', e => {
            if (e.target.tagName === 'A') {
                const clientRect = e.target.getBoundingClientRect();
                const sidebarRect = this.getBoundingClientRect();
                sessionStorage.setItem('sidebar-scroll-offset', clientRect.top - sidebarRect.top);
            }
        }, { passive: true });
        const sidebarScrollOffset = sessionStorage.getItem('sidebar-scroll-offset');
        sessionStorage.removeItem('sidebar-scroll-offset');
        if (sidebarScrollOffset !== null) {
            // preserve sidebar scroll position when navigating via links within sidebar
            const activeSection = this.querySelector('.active');
            if (activeSection) {
                const clientRect = activeSection.getBoundingClientRect();
                const sidebarRect = this.getBoundingClientRect();
                const currentOffset = clientRect.top - sidebarRect.top;
                this.scrollTop += currentOffset - parseFloat(sidebarScrollOffset);
            }
        } else {
            // scroll sidebar to current active section when navigating via
            // 'next/previous chapter' buttons
            const activeSection = document.querySelector('#mdbook-sidebar .active');
            if (activeSection) {
                activeSection.scrollIntoView({ block: 'center' });
            }
        }
        // Toggle buttons
        const sidebarAnchorToggles = document.querySelectorAll('.chapter-fold-toggle');
        function toggleSection(ev) {
            ev.currentTarget.parentElement.parentElement.classList.toggle('expanded');
        }
        Array.from(sidebarAnchorToggles).forEach(el => {
            el.addEventListener('click', toggleSection);
        });
    }
}
window.customElements.define('mdbook-sidebar-scrollbox', MDBookSidebarScrollbox);


// ---------------------------------------------------------------------------
// Support for dynamically adding headers to the sidebar.

(function() {
    // This is used to detect which direction the page has scrolled since the
    // last scroll event.
    let lastKnownScrollPosition = 0;
    // This is the threshold in px from the top of the screen where it will
    // consider a header the "current" header when scrolling down.
    const defaultDownThreshold = 150;
    // Same as defaultDownThreshold, except when scrolling up.
    const defaultUpThreshold = 300;
    // The threshold is a virtual horizontal line on the screen where it
    // considers the "current" header to be above the line. The threshold is
    // modified dynamically to handle headers that are near the bottom of the
    // screen, and to slightly offset the behavior when scrolling up vs down.
    let threshold = defaultDownThreshold;
    // This is used to disable updates while scrolling. This is needed when
    // clicking the header in the sidebar, which triggers a scroll event. It
    // is somewhat finicky to detect when the scroll has finished, so this
    // uses a relatively dumb system of disabling scroll updates for a short
    // time after the click.
    let disableScroll = false;
    // Array of header elements on the page.
    let headers;
    // Array of li elements that are initially collapsed headers in the sidebar.
    // I'm not sure why eslint seems to have a false positive here.
    // eslint-disable-next-line prefer-const
    let headerToggles = [];
    // This is a debugging tool for the threshold which you can enable in the console.
    let thresholdDebug = false;

    // Updates the threshold based on the scroll position.
    function updateThreshold() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const windowHeight = window.innerHeight;
        const documentHeight = document.documentElement.scrollHeight;

        // The number of pixels below the viewport, at most documentHeight.
        // This is used to push the threshold down to the bottom of the page
        // as the user scrolls towards the bottom.
        const pixelsBelow = Math.max(0, documentHeight - (scrollTop + windowHeight));
        // The number of pixels above the viewport, at least defaultDownThreshold.
        // Similar to pixelsBelow, this is used to push the threshold back towards
        // the top when reaching the top of the page.
        const pixelsAbove = Math.max(0, defaultDownThreshold - scrollTop);
        // How much the threshold should be offset once it gets close to the
        // bottom of the page.
        const bottomAdd = Math.max(0, windowHeight - pixelsBelow - defaultDownThreshold);
        let adjustedBottomAdd = bottomAdd;

        // Adjusts bottomAdd for a small document. The calculation above
        // assumes the document is at least twice the windowheight in size. If
        // it is less than that, then bottomAdd needs to be shrunk
        // proportional to the difference in size.
        if (documentHeight < windowHeight * 2) {
            const maxPixelsBelow = documentHeight - windowHeight;
            const t = 1 - pixelsBelow / Math.max(1, maxPixelsBelow);
            const clamp = Math.max(0, Math.min(1, t));
            adjustedBottomAdd *= clamp;
        }

        let scrollingDown = true;
        if (scrollTop < lastKnownScrollPosition) {
            scrollingDown = false;
        }

        if (scrollingDown) {
            // When scrolling down, move the threshold up towards the default
            // downwards threshold position. If near the bottom of the page,
            // adjustedBottomAdd will offset the threshold towards the bottom
            // of the page.
            const amountScrolledDown = scrollTop - lastKnownScrollPosition;
            const adjustedDefault = defaultDownThreshold + adjustedBottomAdd;
            threshold = Math.max(adjustedDefault, threshold - amountScrolledDown);
        } else {
            // When scrolling up, move the threshold down towards the default
            // upwards threshold position. If near the bottom of the page,
            // quickly transition the threshold back up where it normally
            // belongs.
            const amountScrolledUp = lastKnownScrollPosition - scrollTop;
            const adjustedDefault = defaultUpThreshold - pixelsAbove
                + Math.max(0, adjustedBottomAdd - defaultDownThreshold);
            threshold = Math.min(adjustedDefault, threshold + amountScrolledUp);
        }

        if (documentHeight <= windowHeight) {
            threshold = 0;
        }

        if (thresholdDebug) {
            const id = 'mdbook-threshold-debug-data';
            let data = document.getElementById(id);
            if (data === null) {
                data = document.createElement('div');
                data.id = id;
                data.style.cssText = `
                    position: fixed;
                    top: 50px;
                    right: 10px;
                    background-color: 0xeeeeee;
                    z-index: 9999;
                    pointer-events: none;
                `;
                document.body.appendChild(data);
            }
            data.innerHTML = `
                <table>
                  <tr><td>documentHeight</td><td>${documentHeight.toFixed(1)}</td></tr>
                  <tr><td>windowHeight</td><td>${windowHeight.toFixed(1)}</td></tr>
                  <tr><td>scrollTop</td><td>${scrollTop.toFixed(1)}</td></tr>
                  <tr><td>pixelsAbove</td><td>${pixelsAbove.toFixed(1)}</td></tr>
                  <tr><td>pixelsBelow</td><td>${pixelsBelow.toFixed(1)}</td></tr>
                  <tr><td>bottomAdd</td><td>${bottomAdd.toFixed(1)}</td></tr>
                  <tr><td>adjustedBottomAdd</td><td>${adjustedBottomAdd.toFixed(1)}</td></tr>
                  <tr><td>scrollingDown</td><td>${scrollingDown}</td></tr>
                  <tr><td>threshold</td><td>${threshold.toFixed(1)}</td></tr>
                </table>
            `;
            drawDebugLine();
        }

        lastKnownScrollPosition = scrollTop;
    }

    function drawDebugLine() {
        if (!document.body) {
            return;
        }
        const id = 'mdbook-threshold-debug-line';
        const existingLine = document.getElementById(id);
        if (existingLine) {
            existingLine.remove();
        }
        const line = document.createElement('div');
        line.id = id;
        line.style.cssText = `
            position: fixed;
            top: ${threshold}px;
            left: 0;
            width: 100vw;
            height: 2px;
            background-color: red;
            z-index: 9999;
            pointer-events: none;
        `;
        document.body.appendChild(line);
    }

    function mdbookEnableThresholdDebug() {
        thresholdDebug = true;
        updateThreshold();
        drawDebugLine();
    }

    window.mdbookEnableThresholdDebug = mdbookEnableThresholdDebug;

    // Updates which headers in the sidebar should be expanded. If the current
    // header is inside a collapsed group, then it, and all its parents should
    // be expanded.
    function updateHeaderExpanded(currentA) {
        // Add expanded to all header-item li ancestors.
        let current = currentA.parentElement;
        while (current) {
            if (current.tagName === 'LI' && current.classList.contains('header-item')) {
                current.classList.add('expanded');
            }
            current = current.parentElement;
        }
    }

    // Updates which header is marked as the "current" header in the sidebar.
    // This is done with a virtual Y threshold, where headers at or below
    // that line will be considered the current one.
    function updateCurrentHeader() {
        if (!headers || !headers.length) {
            return;
        }

        // Reset the classes, which will be rebuilt below.
        const els = document.getElementsByClassName('current-header');
        for (const el of els) {
            el.classList.remove('current-header');
        }
        for (const toggle of headerToggles) {
            toggle.classList.remove('expanded');
        }

        // Find the last header that is above the threshold.
        let lastHeader = null;
        for (const header of headers) {
            const rect = header.getBoundingClientRect();
            if (rect.top <= threshold) {
                lastHeader = header;
            } else {
                break;
            }
        }
        if (lastHeader === null) {
            lastHeader = headers[0];
            const rect = lastHeader.getBoundingClientRect();
            const windowHeight = window.innerHeight;
            if (rect.top >= windowHeight) {
                return;
            }
        }

        // Get the anchor in the summary.
        const href = '#' + lastHeader.id;
        const a = [...document.querySelectorAll('.header-in-summary')]
            .find(element => element.getAttribute('href') === href);
        if (!a) {
            return;
        }

        a.classList.add('current-header');

        updateHeaderExpanded(a);
    }

    // Updates which header is "current" based on the threshold line.
    function reloadCurrentHeader() {
        if (disableScroll) {
            return;
        }
        updateThreshold();
        updateCurrentHeader();
    }


    // When clicking on a header in the sidebar, this adjusts the threshold so
    // that it is located next to the header. This is so that header becomes
    // "current".
    function headerThresholdClick(event) {
        // See disableScroll description why this is done.
        disableScroll = true;
        setTimeout(() => {
            disableScroll = false;
        }, 100);
        // requestAnimationFrame is used to delay the update of the "current"
        // header until after the scroll is done, and the header is in the new
        // position.
        requestAnimationFrame(() => {
            requestAnimationFrame(() => {
                // Closest is needed because if it has child elements like <code>.
                const a = event.target.closest('a');
                const href = a.getAttribute('href');
                const targetId = href.substring(1);
                const targetElement = document.getElementById(targetId);
                if (targetElement) {
                    threshold = targetElement.getBoundingClientRect().bottom;
                    updateCurrentHeader();
                }
            });
        });
    }

    // Takes the nodes from the given head and copies them over to the
    // destination, along with some filtering.
    function filterHeader(source, dest) {
        const clone = source.cloneNode(true);
        clone.querySelectorAll('mark').forEach(mark => {
            mark.replaceWith(...mark.childNodes);
        });
        dest.append(...clone.childNodes);
    }

    // Scans page for headers and adds them to the sidebar.
    document.addEventListener('DOMContentLoaded', function() {
        const activeSection = document.querySelector('#mdbook-sidebar .active');
        if (activeSection === null) {
            return;
        }

        const main = document.getElementsByTagName('main')[0];
        headers = Array.from(main.querySelectorAll('h2, h3, h4, h5, h6'))
            .filter(h => h.id !== '' && h.children.length && h.children[0].tagName === 'A');

        if (headers.length === 0) {
            return;
        }

        // Build a tree of headers in the sidebar.

        const stack = [];

        const firstLevel = parseInt(headers[0].tagName.charAt(1));
        for (let i = 1; i < firstLevel; i++) {
            const ol = document.createElement('ol');
            ol.classList.add('section');
            if (stack.length > 0) {
                stack[stack.length - 1].ol.appendChild(ol);
            }
            stack.push({level: i + 1, ol: ol});
        }

        // The level where it will start folding deeply nested headers.
        const foldLevel = 3;

        for (let i = 0; i < headers.length; i++) {
            const header = headers[i];
            const level = parseInt(header.tagName.charAt(1));

            const currentLevel = stack[stack.length - 1].level;
            if (level > currentLevel) {
                // Begin nesting to this level.
                for (let nextLevel = currentLevel + 1; nextLevel <= level; nextLevel++) {
                    const ol = document.createElement('ol');
                    ol.classList.add('section');
                    const last = stack[stack.length - 1];
                    const lastChild = last.ol.lastChild;
                    // Handle the case where jumping more than one nesting
                    // level, which doesn't have a list item to place this new
                    // list inside of.
                    if (lastChild) {
                        lastChild.appendChild(ol);
                    } else {
                        last.ol.appendChild(ol);
                    }
                    stack.push({level: nextLevel, ol: ol});
                }
            } else if (level < currentLevel) {
                while (stack.length > 1 && stack[stack.length - 1].level > level) {
                    stack.pop();
                }
            }

            const li = document.createElement('li');
            li.classList.add('header-item');
            li.classList.add('expanded');
            if (level < foldLevel) {
                li.classList.add('expanded');
            }
            const span = document.createElement('span');
            span.classList.add('chapter-link-wrapper');
            const a = document.createElement('a');
            span.appendChild(a);
            a.href = '#' + header.id;
            a.classList.add('header-in-summary');
            filterHeader(header.children[0], a);
            a.addEventListener('click', headerThresholdClick);
            const nextHeader = headers[i + 1];
            if (nextHeader !== undefined) {
                const nextLevel = parseInt(nextHeader.tagName.charAt(1));
                if (nextLevel > level && level >= foldLevel) {
                    const toggle = document.createElement('a');
                    toggle.classList.add('chapter-fold-toggle');
                    toggle.classList.add('header-toggle');
                    toggle.addEventListener('click', () => {
                        li.classList.toggle('expanded');
                    });
                    const toggleDiv = document.createElement('div');
                    toggleDiv.textContent = '❱';
                    toggle.appendChild(toggleDiv);
                    span.appendChild(toggle);
                    headerToggles.push(li);
                }
            }
            li.appendChild(span);

            const currentParent = stack[stack.length - 1];
            currentParent.ol.appendChild(li);
        }

        const onThisPage = document.createElement('div');
        onThisPage.classList.add('on-this-page');
        onThisPage.append(stack[0].ol);
        const activeItemSpan = activeSection.parentElement;
        activeItemSpan.after(onThisPage);
    });

    document.addEventListener('DOMContentLoaded', reloadCurrentHeader);
    document.addEventListener('scroll', reloadCurrentHeader, { passive: true });
})();

