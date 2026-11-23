// versiones.scad

// version del panel de suma, grabada en el panel. sigue la version de
// la placa con la que calza: v<mayor>.<menor> rev-<letra>
VERSION = "v0.1 rev-b";

SUMA_TEXTO = "suma";
SUMA_HP = 5;

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
