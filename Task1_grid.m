clear all
close all
A = imread('assets/wirebond-mask.tif');
SE2 = strel('disk',2);
SE10 = strel('disk',10);
SE20 = strel('disk',20);
E2 = imerode(A,SE2);
E10 = imerode(A,SE10);
E20 = imerode(A,SE20);

% Apply grid to E10 and E20
E2_with_grid = applyGridToImage(E2);
E10_with_grid = applyGridToImage(E10);
E20_with_grid = applyGridToImage(E20);

imshow(E2_with_grid)

% Visualize the original and eroded images with grids
%montage({A, E2, E10_with_grid, E20_with_grid}, "size", [2 2])

function A_with_grid = applyGridToImage(A, gridThickness, greyValue)
    % Apply a grid to an image to visualize the pixels with grey grid lines.
    % A is the input image.
    % gridThickness is the thickness of the grid lines.
    % greyValue is the color of the grid lines in grey scale.
    
    if nargin < 2
        gridThickness = 1; % Default grid thickness
    end
    if nargin < 3
        greyValue = 128; % Default grey value for the grid lines
    end

    % Calculate the size for the new image with grid lines
    newRows = size(A, 1) + (size(A, 1) - 1) * gridThickness;
    newCols = size(A, 2) + (size(A, 2) - 1) * gridThickness;

    % Create the new image, initially set to the grey value for the grid lines
    A_with_grid = greyValue * ones(newRows, newCols, size(A, 3), 'like', A);

    % Copy the original image pixels into the new image, skipping spaces for the grid lines
    for row = 1:size(A, 1)
        for col = 1:size(A, 2)
            newRow = (row - 1) * (gridThickness + 1) + 1;
            newCol = (col - 1) * (gridThickness + 1) + 1;
            A_with_grid(newRow, newCol, :) = A(row, col, :);
        end
    end
end

