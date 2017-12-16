function[m]=concate()
    %load('\\acsnfs4.ucsd.edu\CifsHomes\943\kez040\cogs118B\sEMG_Basic_Hand_movements_upatras\Database 2\male_day_1.mat')
    load('male_day_1.mat');
    mCyl1=horzcat(cyl_ch1, cyl_ch2);
    mHook1=horzcat(hook_ch1,hook_ch2);
    mTip1=horzcat(tip_ch1, tip_ch2);
    mPalm1=horzcat(palm_ch1,palm_ch2);
    mSpher1=horzcat(spher_ch1,spher_ch2);
    mLat1=horzcat(lat_ch1,lat_ch2);
    m1={mCyl1,mHook1,mTip1,mPalm1,mSpher1,mLat1};
    %load('\\acsnfs4.ucsd.edu\CifsHomes\943\kez040\cogs118B\sEMG_Basic_Hand_movements_upatras\Database 2\male_day_2.mat')
    load('male_day_2.mat');
    mCyl2=horzcat(cyl_ch1, cyl_ch2);
    mHook2=horzcat(hook_ch1,hook_ch2);
    mTip2=horzcat(tip_ch1, tip_ch2);
    mPalm2=horzcat(palm_ch1,palm_ch2);
    mSpher2=horzcat(spher_ch1,spher_ch2);
    mLat2=horzcat(lat_ch1,lat_ch2);
    m2={mCyl2,mHook2,mTip2,mPalm2,mSpher2,mLat2};
    %load('\\acsnfs4.ucsd.edu\CifsHomes\943\kez040\cogs118B\sEMG_Basic_Hand_movements_upatras\Database 2\male_day_3.mat')
    load('male_day_3.mat');
    mCyl3=horzcat(cyl_ch1, cyl_ch2);
    mHook3=horzcat(hook_ch1,hook_ch2);
    mTip3=horzcat(tip_ch1, tip_ch2);
    mPalm3=horzcat(palm_ch1,palm_ch2);
    mSpher3=horzcat(spher_ch1,spher_ch2);
    mLat3=horzcat(lat_ch1,lat_ch2);
    m3={mCyl3,mHook3,mTip3,mPalm3,mSpher3,mLat3};
    for i=1:6
        m(1+(i-1)*300:100+(i-1)*300, 1:5000)=m1{1,i};
        m(101+(i-1)*300:200+(i-1)*300, 1:5000)=m2{1,i};
        m(201+(i-1)*300:300+(i-1)*300, 1:5000)=m3{1,i};
    end
end