function[label]=generateLabel()
    label=zeros(1800,6);
    for i=1:6
        label(1+(i-1)*300:i*300,i)= 1;
    end
end