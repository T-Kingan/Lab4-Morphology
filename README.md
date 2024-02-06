# Lab 4 - Morphological Image Processing

In this laboratory session, you will explore the use of various morphological operators and get a feel of how they modify visual information.  

As before, clone this repository to your laptop and keep your experimental logbook on your repo.  Some students add their results, observations, reflections, etc. directly onto the README.md file.  This turns the Lab Instruction into their logbook.  Clever move!

Task 1: Dilation and Erosion

Matlab provides a collection of morphological functions.  Here is a list of them:

<p align="center"> <img src="assets/morphological_operators.jpg" /> </p><BR>

```
A = imread('assets/text-broken.tif');
B1 = [0 1 0;
     1 1 1;
     0 1 0];    % create structuring element
A1 = imdilate(A, B1);
montage({A,A1})
```

> Change the structuring element (SE) to all 1's.  Instead of enumerating it, you can do that with the function _ones_:
```
B2 = ones(3,3);     % generate a 3x3 matrix of 1's
```

> Try making the SE larger.
> Try to make the SE diagonal cross:
```
Bx = [1 0 1;
      0 1 0;
      1 0 1];
```

> What happens if you dilate the original image with B1 twice (or more times)?

Instead of dilation, explore the effect of erosion on the image with different SEs.


