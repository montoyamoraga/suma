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

- `v0.1 rev-a`: diseñada en octubre 2026.

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
