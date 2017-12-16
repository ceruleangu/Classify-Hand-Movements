% To Plot the features in a graph for a specific gesture
% Author: Kening Zhang
subplot(6,1,1);
plot(feature1(1,:));
title('40 Features for Cyrindarical');

subplot(6,1,2);
plot(feature1(301,:));
title('40 Features for Tip');

subplot(6,1,3);
plot(feature1(601,:));
title('40 Features for Hook');

subplot(6,1,4);
plot(feature1(901,:));
title('40 Features for Palmar');

subplot(6,1,5);
plot(feature1(1201,:));
title('40 Features for Spherical');

subplot(6,1,6);
plot(feature1(1501,:));
title('40 Features for Lateral');
