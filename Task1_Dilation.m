
A = imread('assets/text-broken.tif');
B1 = [0 1 0;
     1 1 1;
     0 1 0];    % create structuring element
B2 = ones(3,3);     % generate a 3x3 matrix of 1's
Bx = [1 0 1;
      0 1 0;
      1 0 1];
A1 = imdilate(A, B1);
A2 = imdilate(A, B2);
A3 = imdilate(A, Bx);
%montage({A,A1,A2,A3});

A4 = imdilate(A1, B1);
A5 = imdilate(A2, B2);
montage({A, A1, A4, A5})


% Ensure A2_binary and A3_binary are indeed binary images
A2_binary = A2 > 0;
A3_binary = A3 > 0;

% Find white pixels in A2 that aren't in A3
difference = A2_binary & ~A3_binary;

% Initialize an RGB image. Use uint8 to ensure compatibility with imshow.
% If A2_binary is true (white), set the corresponding pixel to white in the RGB image.
A2_rgb = uint8(zeros(size(A2_binary, 1), size(A2_binary, 2), 3));
A2_rgb(:,:,1) = uint8(A2_binary) * 255; % Red channel
A2_rgb(:,:,2) = uint8(A2_binary) * 255; % Green channel
A2_rgb(:,:,3) = uint8(A2_binary) * 255; % Blue channel

% Overlay red where difference is true
% For pixels that should be red, set them to [255,0,0].
A2_rgb(repmat(difference, [1, 1, 3])) = 0; % First, set these pixels to black
A2_rgb(:,:,1) = A2_rgb(:,:,1) + uint8(difference) * 255; % Then, add red to the red channel

% Display the result
%imshow(A2_rgb);
    