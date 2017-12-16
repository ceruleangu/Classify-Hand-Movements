% To plot EMG and different IMF functions of the first row of data
% Author: Kening Zhang
IMFs=emd(feature(1,1:2500));
first=IMFs(1,:);
second=IMFs(2,:);
third=IMFs(3,:);
residual=IMFs(11,:);

subplot(5,1,1);
plot(feature(1,1:2500));
title('raw EMG');

subplot(5,1,2);
plot(first);
title('firstIMF');

subplot(5,1,3);
plot(second);
title('SecondIMF');

subplot(5,1,4);
plot(third);
title('ThirdIMF');

subplot(5,1,5);
plot(residual);
title('Residual');