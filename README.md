# Lab 4 - Morphological Image Processing
*_Peter Cheung, version 1.0, 8 Feb 2024_*


In this laboratory session, you will explore the use of various morphological operators and get a feel of how they modify visual information.  

As before, clone this repository to your laptop and keep your experimental logbook on your repo.  Some students add their results, observations, reflections, etc. directly onto the README.md file.  This turns the Lab Instruction into their logbook.  Clever move!

## Task 1: Dilation and Erosion

Matlab provides a collection of morphological functions.  Here is a list of them:

<p align="center"> <img src="assets/morphological_operators.jpg" /> </p>

### Dilation Operation
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

### Generation of structuring element

For spatial filtering, we used function _fspecial_ to generate our filter kernel.  For morphological operations, we use function _strel_ to generate different kinds of structuring elements.

Here is a list of SE that _strel_ can generate:

<p align="center"> <img src="assets/strel.jpg" /> </p>

For example, to generate a disk with radius r = 4:

```
SE = strel('disk',4);
SE.Neighborhood         % print the SE neighborhood contents
```

_strel_ returns not a matrix, but an internal data structure called _strel_. This speeds up the execution of the morphological functions by Matlab.

### Erosion Operation

Explore erosion with the following:

```
clear all
close all
A = imread('assets/wirebond-mask.tif');
SE5 = strel('disk',2);
SE10 = strel('disk',10);
SE20 = strel('disk',20);
E5 = imerode(A,SE5);
E10 = imerode(A,SE10);
E20 = imerode(A,SE20);
montage({A, E5, E10, E20})
```
Comment on the results.

## Task 2 - Morphological Filtering with Open and Close

### Opening = Erosion + Dilation
In this task, you will explore the effect of using Open and Close on a binary noisy fingerprint image.

1. Read the image file 'finger-noisy.tif' into F.
2. Generate a 3x3 structuring element SE.
3. Erode F to produce F_e.
4. Dilate F_e to produce F_ed.
5. Open F to produce F_o.
6. Show F, F_e, F_ed and F_o as a 4 image montage.

Comment on the the results.

Explore what happens with other size and shape of structuring element.

Improve the image F_o with a close operation.

Finally, compare morphological filtering using Open + Close to spatial filter with a Gaussian filter. Comment on your comparison.

## Task 3 - Boundary detection 

The grayscale image 'blobs.tif' consists of blobs or bubbles of different sizes in a sea of noise. Further, the bubbles are dark, while the background is white.  The goal of this task is to find the boundaries of the blobs using the boundary operator (Lecture 6, slide 17).

<p align="center"> <img src="assets/blobs.jpg" /> </p>

First we turn this "inverte" grayscale image into a binary image with white objects and black background. Do the following:

```
clear all
close all
I = imread('assets/blobs.tif');
I = imcomplement(I);
level = graythresh(I);
BW = imbinarize(I, level);
```
The Matlab function  _graythresh_ computes a global threshold T from grayscale image I, by finding a threshold that minimizes the variance of the thresholded black and white pixels. (This method is known as the [Otsu's method](https://cw.fel.cvut.cz/b201/_media/courses/a6m33bio/otsu.pdf).)

Now, use the boundary operation to computer the boundaries of the blobs. That is, compute BW - BW eroded with SE, where SE is a 3x3 elements of 1's.  Diplay as montage {I, BW, erosed BW and boundary detected image}.  Comment on the result.

How can you improve on this result?


## Task 4 - Function bwmorph - thinning, top-hat?

## Task 5 - Connected Components and labels

## Task 6 - Morphological Reconstruction

## Task 7 - Morphological Operations on Grayscale images

