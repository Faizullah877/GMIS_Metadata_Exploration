function CameraExtr = get_camera_extr_params(filename)
    % Open the file
    fid = fopen(filename, 'r');

    % Check if file exists
    if fid == -1
        error('File could not be opened, check name or path.')
    end

    % Initialize line counter
    lineCounter = 0;

    % Initialize output structure
    CameraExtr = {};
    % Read the file line by line
    while ~feof(fid)
        line = fgetl(fid);
        % Skip lines starting with "#"
        if line(1) ~= '#'
            lineCounter = lineCounter + 1;
            if mod(lineCounter, 2) ~= 0
                % Split the line into words
                words = strsplit(line);

                % Create a structure for this line
                lineStruct = struct();
                lineStruct.image_id = str2double(words{1});
                lineStruct.Quaternions =cellfun(@str2double, words(2:5));
                lineStruct.Translation =cellfun(@str2double, words(6:8));
                lineStruct.camera_id = str2double(words{9});
                lineStruct.name = words{10};                
                CameraExtr{lineStruct.image_id} = lineStruct;
            end
        end
    end

    % Close the file
    fclose(fid);
end