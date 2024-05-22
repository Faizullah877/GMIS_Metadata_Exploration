function cameraCenters = get_camera_centers(CamExtr)

no_of_images = length(CamExtr); % no_of_images = no_of_cameras
cameraCenters = zeros(no_of_images, 3);

% rotation R and camera center tw for each each camera
for imgId = 1:no_of_images
    % Quaternion to Rotation Matrix R
    R = quat2rotm(CamExtr{imgId}.Quaternions);
    CamExtr{imgId}.R = R;

    T = transpose(CamExtr{imgId}.Translation);
    CamExtr{imgId}.T = T;
    Tw = transpose(-1*R)*T;
    CamExtr{imgId}.Tw = Tw;
    cameraCenters(imgId, :) = Tw;
end