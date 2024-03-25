# SolventSafari for GROMACS

A collection of DFT-MM/MD parametrized boxes of non-water solvents for GROMACS.

## Contents

The folder of each solvent contains the following:
* The OPLS-aa based Force Field topology, parametrized with [Q-Force](https://github.com/selimsami/qforce "Q-Force") at the PBEPBE/6-31+G(D) level of theory
* The GROMACS processed file of the geometry of the box at the end of the simulation, each box containing 9000 atoms
* A text file with all the specs of the box calculated with the `gmx energy` tool (volume, temperature, pressure, and density) and their plots

### List of solvents

* Ac - Acetone - CH3COCH3
* ACN - Acetonitrile - CH3CN
* C2Cl4 - Tetrachloroethylene - C2Cl4
* CCl4 - Tetrachloromethane - CCl4
* CHCl3 - Chloroform - ChCl3
* cHex - Ciclohexane - C6H12
* ClPh - Chlorobenzene - C6H5Cl
* CS2 - Carbon Disulfide - CS2
* DCM - Dichloromethane - CH2Cl2
* DMSO - Dimethyl sulfoxide - (CH3)2SO
* EtOH - Ethane - C2H5OH
* MeOH - Methane - CH3OH
* nHex - Hexane - C6H14
* Ph - Benzene - C6H6
* THF - Tetrahydrofuran - C4H8O
* Tol - Toluene - C6H6CH3

## Usage

The solvent boxes can be either installed in the top level directory of the GROMACS installation folder or used locally.

### Installation

1. Place the structure file `.gro` in the top level directory of the force field directory (_e.g._, `/opt/gromacs-2022.4/share/gromacs/top`).
2. Modify the topology file for the single solvent by removing everything but the `[moleculetype]` and move it to the OPLS-aa force field directory (_e.g._, `/opt/gromacs-2022.4/share/gromacs/top/oplsaa.ff`).
3. Update the `watermodels.dat` of the OPLS-aa (located in the force field's directory, _e.g._, `/opt/gromacs-2022.4/share/gromacs/top/oplsaa.ff/watermodels.dat`), adding the solvent as a line with _filename_ (omit the file extention), _shortdescription_, and _longdescription_.

Now you can use `-cs solvent` when running `gmx solvate` typing the name of the new solvent.

For further details refer to this [guide](https://wiki.archlinux.org/title/GROMACS#Use_a_non-water_solvent).

### Local use

1. Place the `.gro` and `.itp` files in the working directory.
2. Copy and paste the `[atomtypes]` section of all the `.itp` files in the working folder (both solute and solvent) at the top of the `.top` file. Comment it in the `.itp` files.
3. In the `.top` file `#include` the `.itp` files of solvent and solute and the `oplsaa.ff`.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
