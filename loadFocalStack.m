function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)

% rgb_stack is an mxnx3k matrix, where m and n are the height and width of
% the image, respectively, and 3k is the number of images in a focal stack
% multiplied by 3 (each image contains RGB channels). 
%
% rgb_stack will only be used for the refocusing app viewer (it is not used
% here).
%
% gray_stack is an mxnxk matrix.

cd(focal_stack_dir);
listing = dir;


k = length(listing)-3;

i = imread(listing(4).name);
sz =size(i);
m = sz(1);
n = sz(2);

gray_stack = uint8(zeros(m,n,k));
rgb_stack = uint8(zeros(m,n,3*k));

% 4-> 1,2,3
% 5-> 4,5,6
% 6-> 7,8,9


for in = 4:1:k+3

    i = imread(listing(in).name);
    kt = in-3;
    rgb_stack(:,:,3*in-12+1:3*(in-3)) = i; 

    g = rgb2gray(i);
    gray_stack(:,:,in-3) = g;

end


cd('..')


