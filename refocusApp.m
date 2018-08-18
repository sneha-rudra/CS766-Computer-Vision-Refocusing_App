function refocusApp(rgb_stack, depth_map)

%Following tasks need to be executed in a loop
% 1. Display an image in a focal stack
% 2. Ask a user to choose a scene point- use ginput
% 3. refocus the image such that the scene point is focused
% Program terminates when user chooses a point outside the displayed image
% frame

imshow(rgb_stack(:,:,1:3))
h = msgbox('Choose scene points to refocus. Hit enter to terminate');
pause(7)

x =1;
y =1;

sz = size(rgb_stack);
xmax = sz(1);
ymax = sz(2);

[x,y] = ginput(1);
while ~isempty(x)  && ~isempty(y) && ceil(x) <= xmax && ceil(y) <= ymax
    
    imNo = depth_map(ceil(y), ceil(x));
    imshow(rgb_stack(:,:,3*imNo-2:3*imNo))
    pause(5)
    [x,y] = ginput(1);
end
