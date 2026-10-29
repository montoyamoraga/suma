# suma

## About

suma is an open source hardware Eurorack mixer module by [piruetas](https://piruetas.xyz), part of popusintes. It sums three inputs, each with its own potentiometer, into an output and an inverted output, using a TL072 dual op amp. The design is made in KiCad 10 with its own local symbol, footprint and 3D model libraries, included in `hardware/suma-v-0-rev-a/bibliotecas/`. Hardware is licensed under CERN-OHL-P-2.0 and documentation under CC-BY-SA-4.0 (see [LICENSE.md](./LICENSE.md)). Documentation, schematic, board render and bill of materials (in Spanish): <https://piruetas.xyz/suma/>.

## Acerca de

Mezclador eurorack de [piruetas](https://piruetas.xyz), parte de popusintes, hecho en KiCad y publicado como hardware de código abierto.

Documentación, esquemático, placa y Bill of materials: <https://piruetas.xyz/suma/>.

## Características

- 3 entradas (jacks de 3.5 mm), cada una con su potenciómetro.
- 2 salidas: la suma de las entradas, y la suma invertida.
- Amplificador operacional dual TL072.
- Alimentación por header Eurorack de 10 pines (2x05), ±12V, con diodos Schottky de protección contra polaridad inversa.
- Placa de 25 × 100 mm, 2 capas.

## Revisiones

- `v0.1 rev-a`: diseñada y fabricada en octubre 2026. No funciona tal como viene armada (ver errores abajo).
- `v0.1 rev-b`: en desarrollo, corrige las huellas de los diodos y de los potenciómetros.

### Errores conocidos de rev-a

El esquemático está bien; los errores están en las huellas.

- **Diodos D1 y D2 montados al revés.** El símbolo tiene el cátodo (K) en el pin 1, pero la serigrafía de la huella `SOD-123FL_L2.8-W1.8-LS3.7-R-RD` marca el cátodo en el pad 2, y JLCPCB los montó siguiendo la serigrafía. Los diodos quedan en inverso, el TL072 solo recibe la corriente de fuga de los Schottky y los rieles caen a unos ±1.5 V en vez de ±11.7 V. Resultado: la salida sale muy baja (~1 Vpp en vez de 5 Vpp) y deformada.
- **Potenciómetros al revés.** La huella `POT_TH_Alps_RK09K_Single_Vertical` tiene los pads 1 y 3 intercambiados respecto a la huella estándar de KiCad. Girando en sentido horario el cursor va hacia GND (silencio), y en antihorario hacia la entrada (volumen máximo).

Para comprobarlo en una placa: con el módulo alimentado, medir el pin 8 y el pin 4 de U1 (o C1 y C2) respecto a GND. Si da ~±1-2 V en vez de ~±11.7 V, los diodos están al revés.

Arreglo de las placas rev-a ya armadas:

- Desoldar D1 y D2 y soldarlos girados 180°. Para probar rápido, también se pueden puentear con un cable (se pierde la protección contra polaridad inversa).
- Los potenciómetros no tienen arreglo limpio: esas placas funcionan al revés (antihorario = más volumen).

### Simulación

rev-a y rev-b se pueden simular en KiCad (Inspeccionar → Simulador → Ejecutar). Los modelos están en `bibliotecas/spice/`: el TL072 (macro-modelo aproximado; para más precisión reemplazar por el modelo oficial de TI), el 1N5817, y modelos de los conectores para no agregar fuentes al esquemático. J4 se comporta como una fuente de ±12 V, J1-J3 como osciladores senoidales (J1: 5 Vpp a 220 Hz; J2 y J3 en 0 V; se cambian con `amplitud` y `frecuencia` en Sim.Params) y J5-J6 como la entrada de 100k de otro módulo. La posición de cada potenciómetro se cambia con `pos` en Sim.Params (1 = horario completo, según el esquemático).

La simulación muestra el circuito tal como está en el esquemático (que funciona: 4.95 Vpp con el potenciómetro al máximo). Para reproducir cómo quedó armada rev-a, cambiar Sim.Pins de D1 y D2 a `1=A 2=K` e invertir `pos` en los potenciómetros.

El PCB de rev-a no se actualizó con los campos de simulación, para que siga siendo igual a lo fabricado. Por eso el DRC con paridad de esquemático muestra 12 avisos de campos `Sim.*` faltantes, que no afectan al circuito.

### Pendientes para rev-b

Ya está hecho en [hardware/suma-v-0-rev-b](./hardware/suma-v-0-rev-b):

- Diodos: serigrafía espejada para que el cátodo quede en el pad 1 (K) y modelo 3D girado 180°. El cobre no cambia.
- Potenciómetros: pads 1 y 3 intercambiados en la huella (biblioteca y placa), igual que la huella estándar de KiCad.

Falta:

- [ ] En pcbnew, rerutear la pista de entrada de RV1, RV2 y RV3: ahora tiene que llegar al pad derecho (x = 40.3 mm, pad 3) en vez del izquierdo (x = 35.3 mm, ahora GND). Después rellenar las zonas (B). Hasta hacerlo, el DRC marca cortos con GND en esos tres puntos.
- [ ] Opcional: "Actualizar PCB desde esquemático" para copiar los campos de simulación a la placa.
- [ ] Simular rev-b en KiCad antes de mandarla a fabricar.
- [ ] Generar gerbers, BOM y CPL de rev-b (`hardware/suma-v-0-rev-b-fab` y `hardware/suma-v-0-rev-b-pcba`).
- [ ] En el pedido de JLCPCB, revisar en la vista previa de montaje que la banda de cada diodo quede en el pad 1: lado del riel de +12 V en D1, lado del header en D2.
- [ ] Actualizar [kicad-retrata.yml](./kicad-retrata.yml), la estructura del repositorio de este README y [docs](./docs) para que apunten a rev-b.
- [ ] Revisar si otros módulos de popusintes usan estas mismas huellas de diodo y potenciómetro.

## Estructura del repositorio

- [hardware/suma-v-0-rev-a](./hardware/suma-v-0-rev-a): proyecto de KiCad (esquemático y placa), los archivos fuente del diseño.
- [hardware/suma-v-0-rev-a/bibliotecas](./hardware/suma-v-0-rev-a/bibliotecas): símbolos, huellas y modelos 3D usados por el proyecto. Van en el repositorio para que el proyecto de KiCad se abra sin instalar bibliotecas adicionales.
- [hardware/suma-v-0-rev-a-fab](./hardware/suma-v-0-rev-a-fab): gerbers y archivos de taladrado para fabricar la placa.
- [hardware/suma-v-0-rev-a-pcba](./hardware/suma-v-0-rev-a-pcba): lista de componentes y archivo de posiciones para armado en JLCPCB.
- [docs](./docs): documentación, publicada en <https://piruetas.xyz/suma/>. Las capturas del esquemático y de la placa, y la tabla de Bill of materials, las genera [kicad-retrata](https://github.com/piruetasxyz/kicad-retrata) en cada push (ver [kicad-retrata.yml](./kicad-retrata.yml)).
- [LICENSES](./LICENSES): textos completos de las licencias.

## Fabricación

Como es hardware de código abierto, los archivos fuente de KiCad, los archivos de fabricación de [hardware/suma-v-0-rev-a-fab](./hardware/suma-v-0-rev-a-fab), los de armado de [hardware/suma-v-0-rev-a-pcba](./hardware/suma-v-0-rev-a-pcba) y la [Bill of materials](https://piruetas.xyz/suma/#bill-of-materials-v01-rev-a) están publicados para que cualquiera pueda estudiar, modificar y fabricar el diseño. piruetas no da soporte para unidades fabricadas o armadas por terceros.

## Créditos

- Aarón Montoya-Moraga: investigación, esquemático, PCB, fabricación y documentación.

## Licencia

suma es (c) 2026 piruetas SpA / Aarón Montoya-Moraga.

- Hardware (`hardware/`): [CERN-OHL-P-2.0](./LICENSES/CERN-OHL-P-2.0.txt).
- Documentación (`docs/`): [CC-BY-SA-4.0](./LICENSES/CC-BY-SA-4.0.txt).
- El nombre, logo y marca de piruetas no están cubiertos por estas licencias: ver [LicenseRef-piruetas-branding](./LICENSES/LicenseRef-piruetas-branding.txt).

Ver [LICENSE.md](./LICENSE.md) para los detalles. El repositorio sigue la especificación [REUSE](https://reuse.software/).
