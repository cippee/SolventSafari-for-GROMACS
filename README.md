# SolventSafari for GROMACS

A collection of DFT-MM/MD parametrized boxes of solvents for GROMACS. Further details are available in this [article](https://doi.org/10.1021/acs.jchemed.6c00154). If you use this material, please cite:

*Chiara Picarelli, Giuseppina Raffaini, Matteo Tommasini; From GROMACS Molecular Dynamics Simulations to Electronic Absorption Spectra: A Tutorial for Small Molecules in Organic Solvents. J. Chem. Educ. 2026; https://doi.org/10.1021/acs.jchemed.6c00154*

   ```
   @article{Picarelli2026,
       author = {Picarelli, Chiara and Raffaini, Giuseppina and Tommasini, Matteo},
       title = {From GROMACS Molecular Dynamics Simulations to Electronic Absorption Spectra: A Tutorial for Small Molecules in Organic Solvents},
       journal = {Journal of Chemical Education},
       year = {2026},
       month = {09},
       issn = {0021-9584},
       doi = {10.1021/acs.jchemed.6c00154},
       url = {https://doi.org/10.1021/acs.jchemed.6c00154},
       eprint = {https://pubs.acs.org/jceda8/article-pdf/doi/10.1021/acs.jchemed.6c00154/68102490/acs.jchemed.6c00154.pdf}}
   ```

## Contents

Each solvent folder contains:
* The OPLS-AA-based force field topology, parametrized with [Q-Force](https://github.com/selimsami/qforce "Q-Force") at the PBEPBE/6-31+G(d) level of theory
* The GROMACS-processed `$SOLVENT_solventbox.gro` file of the final simulation box (containing 9000 atoms
* The molecular dynamics parameter files `.mdp` used for energy minimizations, equilibrations, and the production run
* A `workflow.sh` script that automates the full simulation pipeline and reproduces the reported solvent box
* A text file containing thermodynamic data extracted using the `gmx energy` module (potential energy, kinetic energy, volume, temperature, pressure, and density), together with the corresponding plots

### List of solvents

* **Ac** - Acetone - CH3COCH3
* **ACN** - Acetonitrile - CH3CN
* **C2Cl4** - Tetrachloroethylene - C2Cl4
* **CCl4** - Tetrachloromethane - CCl4
* **CHCl3** - Chloroform - ChCl3
* **cHex** - Cyclohexane - C6H12
* **ClPh** - Chlorobenzene - C6H5Cl
* **CS2** - Carbon Disulfide - CS2
* **DCM** - Dichloromethane - CH2Cl2
* **DMSO** - Dimethyl sulfoxide - (CH3)2SO
* **EtOH** - Ethanol - C2H5OH
* **MeOH** - Methanol - CH3OH
* **nHex** - Hexane - C6H14
* **Ph** - Benzene - C6H6
* **THF** - Tetrahydrofuran - C4H8O
* **Tol** - Toluene - C6H6CH3

## Usage

The solvent boxes can be either installed in the top level directory of the GROMACS installation folder or used locally.

### Installation (global)

1. Copy the `.gro` structure file into the top-level GROMACS force field directory (*e.g.*, `/opt/gromacs-2022.4/share/gromacs/top`).
2. Remove all but the `[moleculetype]` section from the solvent .itp file and move it to the OPLS-AA force field folder (*e.g.*, `/opt/gromacs-2022.4/share/gromacs/top/oplsaa.ff/`).
3. Edit `watermodels.dat` (located in the force field's directory, *e.g.*, `/opt/gromacs-2022.4/share/gromacs/top/oplsaa.ff/watermodels.dat`), adding a new line with: `<filename>` (omit the file extention), `<shortdescription>`, and `<longdescription>`.

You can now use the new solvent with the `-cs <solvent>` flag in `gmx solvate`.

For further details refer to this [guide](https://wiki.archlinux.org/title/GROMACS#Use_a_non-water_solvent).

### Local use

1. Place the `.gro` and `.itp` files in your working directory.
2. Copy the `[atomtypes]` sections from all the `.itp` files (solute and solvent) at the top of the `.top` file. Then, comment them out it in the `.itp` files.
3. In the `.top` file, add
   ```
   #include "your_solvent.itp"
   #include "your_solute.itp"
   ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss proposed modifications.
