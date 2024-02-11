clear all
close all

% Read the image file 'finger-noisy.tif' into f.
f = imread('assets/fingerprint-noisy.tif');

% Generate a 3x3 structuring element SE.
%SE = strel('square', 3);
SE = strel('disk', 1);

% Erode f to produce _f_e.
fe = imerode(f, SE);

% Dilate fe to produce fed.
fed = imdilate(fe, SE);

% Open f to produce fo.
fo = imopen(f, SE);

% Improve the image fo_ with a close operation
foc = imclose(fo, SE);

% Show f, fe, fed and fo as a 4 image montage.
montage({f, fe, fed, fo, foc});

% compare morphological filtering using Open + Close to spatial filter with a Gaussian filter.
% Create a Gaussian filter with a standard deviation of 1.5
h = fspecial('gaussian', 5, 1.5);

% Apply the Gaussian filter to the original image f.
fg = imfilter(f, h, 'replicate');

% Show the original image f and the Gaussian filtered image fg as a 2 image montage.
figure, montage({f, foc, fg});
