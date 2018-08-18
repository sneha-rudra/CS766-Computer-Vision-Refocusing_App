function index_map = generateIndexMap(gray_stack, w_size)

% Write a program called generate index map - this one
% that generates an index map from a focal stack
% index map = image, every pixel corresponds to a scene point

sz = size(gray_stack);

if mod(sz(3), 3) ~= 0
    figure(1);
    index_map = uint8(ones(sz(1:2)));
    close(1); 

    focus = double(ones(sz));
    

    % The integer intensity of every pixel indicates the index 
    % of the best focussed layer associated with the scene point
    % Index map generation can be carried out in two steps
    % First step is to compute a focus measure for every pixel in every image
    % of the focal stack

    for l = 1:1:sz(3)

            focus(:,:,l) = abs(del2(double(gray_stack(:,:,l))));

    end



    for i = 1:1:sz(1)
        for j = 1:1:sz(2)
            [c,in] = max(focus(i,j,:));
            index_map(i,j) = in;
        end
    end

else
    
    figure(1);
    index_map = uint8(ones(sz(1:2)));
    close(1); 

    focus = double(ones(sz));
    

    % The integer intensity of every pixel indicates the index 
    % of the best focussed layer associated with the scene point
    % Index map generation can be carried out in two steps
    % First step is to compute a focus measure for every pixel in every image
    % of the focal stack

    % 1-> 1,2,3
    % 2-> 4,5,6
    % 3-> 7,8,9

    
    for l = 1:1:uint8((sz(3)/3))
            focus(:,:,3*l-2:3*l) = abs(del2(double(gray_stack(:,:,3*l-2:3*l))));
    end



    for i = 1:1:sz(1)
        for j = 1:1:sz(2)
            fv = [];
            for l = 1:1:uint8((sz(3)/3))
                vec = [];
                vec(1) = focus(i,j,3*l-2); 
                vec(2) = focus(i,j,3*l-1);
                vec(3) = focus(i,j,3*l);
                fv(l) = norm(vec);

            end
            [c,in] = max(fv);
            index_map(i,j) = in;
        end

    end



end