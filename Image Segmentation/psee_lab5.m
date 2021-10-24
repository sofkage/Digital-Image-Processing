clear all;
close all;
clc;

I = imread('cell.tif');
figure,imshow(I,'displayrange',[]);
title('Original Imge');

%----------  1   -------
[BW,thresh] = (edge(I,'Sobel'));
[BW,thresh] = (edge(I,'Sobel',thresh*graythresh(double(BW))));
figure,imshow(BW);
title('Binarized Imge');



%---------   2   ---------

se_90_degrees = strel('line',3,90);
se_0_degrees = strel('line',3,0);

BW_dilated = imdilate(BW,[se_90_degrees se_0_degrees]);
figure,imshow(BW_dilated)
title('Dilated Image')

%---3
BW_fill = imfill(BW_dilated,'holes');
figure,imshow(BW_fill)
title('Binary Image with Filled Holes')
%---4

BW_clear = imclearborder(BW_fill,4);
figure,imshow(BW_clear)
title('Cleared Border Image')

se_diamond = strel('diamond',1);
BW_segmented = imerode(BW_clear,se_diamond);
BW_segmented = imerode(BW_segmented,se_diamond);
figure,imshow(BW_segmented)
title('Segmented Image');


BWoutline = bwperim(BW_segmented);

SegoutR = I;
SegoutG = I;
SegoutB = I;
%now set red
SegoutR(BWoutline) = 255;
SegoutG(BWoutline) = 0;
SegoutB(BWoutline) = 0;
SegoutRGB = cat(3, SegoutR, SegoutG, SegoutB);
figure,imshow(SegoutRGB);
title('Outlined Original Image')


