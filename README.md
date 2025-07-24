# SolventSafari for GROMACS

A collection of DFT-MM/MD parametrized boxes of non-water solvents for GROMACS.

## Contents

Each solvent folder contains:
* The OPLS-AA-based force field topology, parametrized with [Q-Force](https://github.com/selimsami/qforce "Q-Force") at the PBEPBE/6-31+G(d) level of theory
* The GROMACS-processed `.gro` file of the final simulation box (containing 9000 atoms)
* A text file with simulation data extracted using `gmx energy` (volume, temperature, pressure, density), along with related plots

### List of solvents

* **Ac** - Acetone - CH3COCH3
* **ACN** - Acetonitrile - CH3CN
* **C2Cl4** - Tetrachloroethylene - C2Cl4
* **CCl4** - Tetrachloromethane - CCl4
* **CHCl3** - Chloroform - ChCl3
* **cHex** - Ciclohexane - C6H12
* **ClPh** - Chlorobenzene - C6H5Cl
* **CS2** - Carbon Disulfide - CS2
* **DCM** - Dichloromethane - CH2Cl2
* **DMSO** - Dimethyl sulfoxide - (CH3)2SO
* **EtOH** - Ethane - C2H5OH
* **MeOH** - Methane - CH3OH
* **nHex** - Hexane - C6H14
* **Ph** - Benzene - C6H6
* **THF** - Tetrahydrofuran - C4H8O
* **Tol** - Toluene - C6H6CH3


<img width="3877" height="1434" alt="fig3_density" src="https://github.com/user-attachments/assets/fff564f0-73da-4aa7-898c-49f081a0b708" />

**Fig 1** – *Left panel: table showing experimental and calculated values with relative error. Central panel: bar plot of percentage relative errors, ϵₚ × 100%. Right panel: scatter plot of experimental vs. theoretical values, with grey area indicating the error margin and dashed line representing the linear regression.*


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
