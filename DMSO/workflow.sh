SOLVENT=DMSO
MDP=input/mdp
SIZE=4.7
NMOL=899

# create the box 
gmx_d editconf -f $SOLVENT.gro -o "$SOLVENT"_box.gro -box $SIZE $SIZE $SIZE -c -bt cubic
# insert molecules to reach the desired amount (here 9000 atoms)
gmx_d insert-molecules -f "$SOLVENT"_box.gro -ci $SOLVENT.gro -nmol $NMOL -o "$SOLVENT"_solvent.gro -rot xyz -try 1000 -dr 10 10 10

# warning: the total number of molecules in DMSO.top should be edited manually

# 1. energy minimization
# coarse with steepest descent algorithm
gmx_d grompp -f $MDP/0_em_steep.mdp -c "$SOLVENT"_solvent.gro -p "$SOLVENT".top -o em_0_solvent.tpr
gmx_d mdrun -v -deffnm em_0_solvent
# finer with conjugated gradint algorithm
gmx_d grompp -f $MDP/1_em_cg.mdp -c em_0_solvent.gro -p "$SOLVENT".top -o em_1_solvent.tpr
gmx_d mdrun -v -deffnm em_1_solvent


# equilibration
# 2. NVT equilibration
gmx_d grompp -f $MDP/2_nvt.mdp -c em_1_solvent.gro -r em_1_solvent.gro -p "$SOLVENT".top -o nvt_solvent.tpr
gmx_d mdrun -v -deffnm nvt_solvent

# 3. NPT equilibration
gmx_d grompp -f $MDP/3_npt.mdp -c nvt_solvent.gro -r nvt_solvent.gro -p "$SOLVENT".top -o npt_solvent.tpr
gmx_d mdrun -v -deffnm npt_solvent

# NPT production run
gmx_d grompp -f $MDP/4_md.mdp -c npt_solvent.gro -r npt_solvent.gro -p "$SOLVENT".top -o md_solvent.tpr
gmx_d mdrun -v -deffnm md_solvent