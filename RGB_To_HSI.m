function HSI = RGB_To_HSI(RGB)
% Extract the individual component images.
% R- red
% G- green
% B- blue
RGB = im2double(RGB);
R = RGB(:, :, 1);
G = RGB(:, :, 2);
B = RGB(:, :, 3);
num = 0.5*((R - G) + (R - B));
den = sqrt((R - G).^2 + (R - B).*(G - B));
theta = acos(num./(den + eps));

H = theta;
H(B > G) = 2*pi - H(B > G);
H = H/(2*pi);

num = min(min(R, G), B);
den = R + G + B;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;
I = (R + G + B)/3;
HSI = cat(3, H, S, I); %comination of all 3 result into hsi image

