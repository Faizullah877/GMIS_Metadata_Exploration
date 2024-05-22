function CamerasItr = get_camera_intr_params(filename)
    % Open the file
    fid = fopen(filename, 'r');

    % Check if file exists
    if fid == -1
        error('File could not be opened, check name or path.')
    end

    % Initialize line counter
    lineCounter = 0;

    % Initialize output structure
    CamerasItr = {};

    % Read the file line by line
    while ~feof(fid)
        line = fgetl(fid);
        % Skip lines starting with "#"
        if line(1) ~= '#'
            lineCounter = lineCounter + 1;

            % Split the line into words
            words = strsplit(line);
            
            % Create a structure for this line
            lineStruct = struct();
            lineStruct.camera_id = str2double(words{1});
            lineStruct.camera_model = words{2};
            lineStruct.width = str2double(words{3});
            lineStruct.height = str2double(words{4});
            lineStruct.params = cellfun(@str2double, words(5:end));
            
            % Assign the line structure to the corresponding field
            CamerasItr{lineStruct.camera_id} = lineStruct;
        end
    end

    % Close the file
    fclose(fid);
end