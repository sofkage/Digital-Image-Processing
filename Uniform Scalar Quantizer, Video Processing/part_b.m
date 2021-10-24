clear all;
close all;
clc;
%--------------- PART B -------------------

vd = VideoReader('xylophone3.mp4')
duration = vd.Duration
frameRate = vd.FrameRate
numOfFrames = vd.Duration*vd.FrameRate

%resolution = 
disp(['Resolution is: ' num2str(vd.Width) 'x' num2str(vd.Height)]) ;

%read frames
while hasFrame(vd)
    vidFrame = readFrame(vd);
    figure,imshow(vidFrame)
    pause(1/frameRate);
end

%extractin 50th frame
vd = VideoReader('xylophone3.mp4')
frame = read(vd,50);
framegray = rgb2gray(frame);


figure;
subplot(1,2,1), imshow(frame),title('RGB')
subplot(1,2,2), imshow(framegray),title('Gray-scale')


