# coding-challenge-february-3rd

how to run:

1. install dependencies:

        $ bundle

2. run executable (terminate with CTRL+d to signal EOF and show output):

        $ bin/explorer

3. to run sample case do:

        $ bin/explorer < sample/test1.input

assumptions:

- the upper right coordinates of the plateau are given in a "X-max Y-max" format

- there's space for an infinite number of rovers inside the plateau regardless of coordinate (no collision between rovers)

- if rover is instructed to move beyond the limits of the plateau it will stay at the same place