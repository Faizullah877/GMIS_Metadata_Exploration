function distances = get_euclidian_distances(cameraCenters)
n = size(cameraCenters, 1); % Number of cameras
distances = zeros(n, n); % Initialize a matrix to store distances
% Calculate Euclidean distance between each pair of cameras
for i = 1:n
    for j = i+1:n
        distances(i,j) = norm(cameraCenters(i,:) - cameraCenters(j,:));
        distances(j,i) = distances(i,j); % The distance matrix is symmetric
    end
end
end