% Define the parameters for the different structuring elements
shapes = {'diamond', 'disk', 'disk', 'octagon', 'line', 'rectangle', 'square'};
parameters = {4, 4, [4, 8], 3, {10, 45}, [5, 7], 4};

% For disk structuring elements, N must be 0, 4, 6, or 8.

% Create an array to hold the structuring elements
SE_array = cell(size(shapes));

% Create the structuring elements using the specified shapes and parameters
for i = 1:length(shapes)
    if strcmp(shapes{i}, 'line')
        % Line structuring element requires two separate parameters
        SE_array{i} = strel(shapes{i}, parameters{i}{:});
    elseif strcmp(shapes{i}, 'disk') && length(parameters{i}) == 2
        % Disk with a specified decomposition level
        SE_array{i} = strel(shapes{i}, parameters{i}(1), parameters{i}(2));
    else
        % All other shapes
        SE_array{i} = strel(shapes{i}, parameters{i});
    end
end

% Print the parameters and Neighborhood property of each structuring element
for i = 1:length(SE_array)
    fprintf('SE shape "%s" with parameters: ', shapes{i});
    if iscell(parameters{i})
        fprintf('%g ', parameters{i}{:});
    else
        fprintf('%g ', parameters{i});
    end
    fprintf('\nNeighborhood:\n');
    disp(SE_array{i}.Neighborhood);
    fprintf('\n'); % Add an extra newline for readability
end
