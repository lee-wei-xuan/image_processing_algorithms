A = double(imread('sunflower.jpeg'));
canvas = zeros(1200, 1200, 3);
for c = 1:3
    for i = 1:1200
        for j = 1:1200
            % Find the 40 degree 
            % (counter-clockwise) rotation
            % for the (i,j)-th entry
            % int32 to round to nearest integer
            i_rot = int32(cosd(40)*(i - 600) - ...
                        sind(40)*(j - 600))+ 427;
            j_rot = int32(sind(40)*(i - 600) + ...
                        cosd(40)*(j - 600))+ 320;
            % Check if out of bounds
            if i_rot < 1 || ...
               i_rot > size(A, 1) || ...
               j_rot < 1 || ...
               j_rot > size(A, 2)
               % Set to white
                canvas(i, j, c) = 255;
            else
                canvas(i, j, c) = ...
                A(i_rot, j_rot, c);
            end
        end
    end
end
image(uint8(canvas))



