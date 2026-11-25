// versiones.scad

// version del panel de suma. sigue la version de
// la placa con la que calza: v<mayor>.<menor> rev-<letra>
VERSION = "v0.1 rev-b";

SUMA_TEXTO = "suma";
SUMA_HP = 5;

// espesor del panel, mas grueso que PANEL_PROFUNDIDAD (2.4 mm) para
// que no se doble. el rebaje de los jacks crece en la misma medida,
// asi el jack sigue viendo 1.2 mm de panel y la tuerca la misma rosca
SUMA_PANEL_PROFUNDIDAD = 3.0;
SUMA_JACK_REBAJE_HONDO = SUMA_PANEL_PROFUNDIDAD - (PANEL_PROFUNDIDAD - JACK_REBAJE_HONDO);

// versiones
//
// v0.1 rev-b: octubre 2026. primer panel como parte de este
// repositorio, antes en popusintes-cajas-paneles (que solo tenia los
// tornillos de montaje). agujeros para los tres potenciometros, las
// tres entradas y la salida de la placa suma-v-0-rev-b
//
// noviembre 2026: los agujeros de los tornillos M3 pasan a ser elipses
// horizontales (agujeros_tornillos con elipse = true) para dar holgura
// al montar en el riel, y se agrega un rebaje en la cara frontal
// alrededor de cada jack para que entren las tuercas, igual que en el
// panel de atenu
//
// noviembre 2026: se quitan los grabados (nombre y version) de la
// cara trasera, porque eran tan sutiles que no se leian bien
//
// noviembre 2026: el panel pasa de 2.4 a 3.0 mm de espesor para que no
// se doble (rigidez ~2x, crece con el cubo del espesor). el rebaje de
// los jacks pasa de 1.2 a 1.8 mm de hondo, asi la zona del jack sigue
// en 1.2 mm y la tuerca alcanza la misma rosca
