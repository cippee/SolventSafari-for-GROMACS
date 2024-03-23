# SolventSafari for GROMACS
A collection of DFT-MM/MD parametrized boxes of non-water solvents for GROMACS.

## Contents
The folder of each solvent contains:
* the Force Field topology parametrized with Q-Force [1] at the PBEPBE/6-31G*(D) level of theory (.itp)
* the GROMACS processed geometry of the box, each box containing 9000 atoms (.gro)
* a .txt file with all the specs of the box calculated with the gmx energy tool (volume, temperature, pressure, and density) and their plots

### List of solvents
* Ac - Acetone - CH3COCH3
* ACN - Acetonitrile - CH3CN
* C2Cl4 - Tethrachloroethylene - C2Cl4
* CCl4 - Tetrachloromethane - CCl4
* CHCl3 - Chloroform - ChCl3
* cHex - Ciclohexane - C6H12
* ClPh - Chlorobenzene - C6H5Cl
* CS2 - Carbon Disulfide - CS2
* DCM - Dichloromethane - CH2Cl2
* DMSO - Dimethyl sulfoxide
* EtOH - Ethane - C2H5OH
* MeOH - Methane - CH3OH
* nHex - Hexane - C6H14
* Ph - Benzene - C6H6
* THF - Tetrahydrofuran - C4H8O
* Tol - Toluene - C6H6CH3

## Usage



## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
